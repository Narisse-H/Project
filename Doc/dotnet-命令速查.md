# dotnet CLI 命令速查（ProjectEditor）

> 项目：ProjectEditor（WPF） · 目标框架：`net10.0-windows` · SDK：`10.0.100`
> 整理时间：2026-11-26

---

## 0. 本项目路径速查

| 项目 | 路径 |
| --- | --- |
| 项目目录 | `D:\App project\Project\ProjectEditor` |
| 项目文件 | `ProjectEditor\ProjectEditor.csproj` |
| 当前输出（Debug） | `ProjectEditor\bin\Debug\net10.0-windows\` |
| 中间产物 | `ProjectEditor\obj\Debug\net10.0-windows\` |
| 配置文件目录 | `ProjectEditor\config\`（当前为空） |
| 文档目录 | `D:\App project\Project\Doc` |

**记住一条前置动作**：所有 `dotnet` 命令的"当前项目"是**当前目录**决定的。不在项目目录里执行就会报 `MSB1003`。

```powershell
cd "D:\App project\Project\ProjectEditor"
```

---

## 1. 每天都会用的五条

```powershell
dotnet build                  # 编译（默认 Debug），不启动
dotnet run                    # 编译并启动程序
dotnet build -c Release       # Release 编译（带优化）
dotnet run --no-build         # 不重新编译，直接跑上次的产物
dotnet clean                  # 清掉 bin/ 和 obj/ 里的本次输出
```

- `dotnet run` 会先隐式执行一次 build，所以它比较慢是正常的。
- 改了 XAML 必须重新 `dotnet build` / `dotnet run`，没有设计器就没有 XAML 热重载。
- 只想看编译错误、不想让窗口弹出来时，用 `dotnet build`。

---

## 2. 输出到底落在哪：默认规则

```
bin\<配置>\<目标框架>[\<运行时ID>]\     ← 最终产物（exe/dll/json/pdb 都在这）
obj\<配置>\<目标框架>[...]\             ← 中间产物（增量编译用，别手改）
```

本项目当前：

```
ProjectEditor\bin\Debug\net10.0-windows\ProjectEditor.exe
ProjectEditor\bin\Debug\net10.0-windows\ProjectEditor.dll
ProjectEditor\bin\Debug\net10.0-windows\ProjectEditor.deps.json
ProjectEditor\bin\Debug\net10.0-windows\ProjectEditor.runtimeconfig.json
ProjectEditor\bin\Debug\net10.0-windows\ProjectEditor.pdb
```

### 命令 → 产物落点对照

| 命令 | 产物落在 |
| --- | --- |
| `dotnet build` | `bin\Debug\net10.0-windows\` |
| `dotnet build -c Release` | `bin\Release\net10.0-windows\` |
| `dotnet build -r win-x64` | `bin\Debug\net10.0-windows\win-x64\`（多一层 RID） |
| `dotnet publish -c Release` | `bin\Release\net10.0-windows\publish\`（默认多一层 `publish`） |
| `dotnet run` | 不换地方，用 `bin\Debug\...` 那份 |

### 想确认真实路径，别猜——问 MSBuild

```powershell
dotnet msbuild ProjectEditor.csproj -getProperty:OutDir
```

只做求值、**不编译**，直接打印真实输出目录（相对项目目录）。本项目实测输出：

```
bin\Debug\net10.0-windows\
```

同理可查：`-getProperty:TargetFramework`、`-getProperty:Configuration`、`-getProperty:AssemblyName`。

---

## 3. 临时改变输出位置（一次性）

```powershell
dotnet build -o D:\temp\out              # 编译产物丢这
dotnet publish -o D:\dist\ProjectEditor  # 发布产物丢这
dotnet build --artifacts-path D:\build\artifacts
```

- `-o` 适合"我只想看看产物有哪些文件"。
- **不适合日常**：它把所有配置/框架揉进同一个目录，而 `obj` 的增量信息仍留在原地，反复用容易出现"改了代码没生效"的怪现象。

---

## 4. 项目级固定输出位置（改 csproj）

在 `ProjectEditor.csproj` 的 `<PropertyGroup>` 里加：

```xml
<PropertyGroup>
  <!-- 只换最终输出的根目录 -->
  <BaseOutputPath>$(MSBuildThisFileDirectory)..\build\bin\</BaseOutputPath>

  <!-- 不想让路径里带 net10.0-windows 这一层 -->
  <AppendTargetFrameworkToOutputPath>false</AppendTargetFrameworkToOutputPath>

  <!-- 中间产物也挪走 -->
  <BaseIntermediateOutputPath>$(MSBuildThisFileDirectory)..\build\obj\</BaseIntermediateOutputPath>

  <!-- publish 的落点 -->
  <PublishDir>$(MSBuildThisFileDirectory)..\build\publish\</PublishDir>
</PropertyGroup>
```

- 优先改 `BaseOutputPath`，**别直接写 `OutputPath`**——`OutputPath` 是更底层那个，会把配置层一起覆盖掉。
- 改了输出位置，VS Code 的 `launch.json` 里 `program` 字段必须跟着改，否则 F5 找不到 dll。

---

## 5. 全局统一输出：artifacts 方案（多项目时推荐）

.NET 8 之后官方提供的"把所有项目输出收进一个 `artifacts` 文件夹"机制，比手改 `OutputPath` 干净得多。

在解决方案根目录（`D:\App project\Project\`）新建 `Directory.Build.props`：

```xml
<Project>
  <PropertyGroup>
    <ArtifactsPath>$(MSBuildThisFileDirectory)artifacts</ArtifactsPath>
  </PropertyGroup>
</Project>
```

生成的结构：

```
artifacts\bin\ProjectEditor\debug_net10.0-windows\
artifacts\obj\ProjectEditor\debug_net10.0-windows\
artifacts\publish\ProjectEditor\release_net10.0-windows\
```

**硬性约束（实测 SDK 报错 `NETSDK1199`）**：`ArtifactsPath` / `UseArtifactsOutput` **不能写在 csproj 里**，只能写在 `Directory.Build.props` 或命令行。`UseArtifactsOutput=true` 但没给 `ArtifactsPath` 时，还会报 `NETSDK1200`（必须有 `Directory.Build.props` 才能推导位置）。

---

## 6. 发布（publish）

```powershell
# 框架依赖（最小，需目标机装 .NET 10 桌面运行时）
dotnet publish -c Release

# 自包含（目标机不用装运行时，体积大）
dotnet publish -c Release -r win-x64 --self-contained true

# 单文件（仍是自包含）
dotnet publish -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true
```

注意：**WPF 不要开 `PublishTrimmed`**（裁剪），SDK 会直接警告不支持（WPF 大量反射）。要减小体积只能靠自包含 + 压缩，或者以后换 AOT（WPF 目前也不支持）。

---

## 7. 查询类命令（不修改任何文件）

```powershell
dotnet --info                 # 完整环境快照
dotnet --list-sdks            # 装了哪些 SDK
dotnet --list-runtimes        # 装了哪些运行时（看 WindowsDesktop 那几行）
dotnet --version              # 当前生效的 SDK 版本

dotnet list package           # 项目引用了哪些 NuGet 包
dotnet build -v n             # 普通详细度编译日志，能看到 "xxx -> bin\..." 的落点
dotnet msbuild ProjectEditor.csproj -getProperty:OutDir
```

---

## 8. NuGet 包（后面接 MVVM / DI 会用到）

```powershell
dotnet add package CommunityToolkit.Mvvm
dotnet add package Microsoft.Extensions.Hosting
dotnet add package Microsoft.Extensions.Configuration.Json

dotnet add package <包名> --version 8.4.0   # 指定版本
dotnet remove package <包名>
dotnet list package --outdated              # 看哪些包有新版
dotnet nuget locals all --clear              # 清 NuGet 缓存（还原出怪问题时用）
```

---

## 9. 解决方案文件（目前还没有 .sln）

```powershell
# 在 D:\App project\Project 下执行
dotnet new sln -n Project
dotnet sln add ProjectEditor\ProjectEditor.csproj

# 之后就能在根目录直接构建整个解决方案
dotnet build
```

.NET 10 也支持新的 XML 格式解决方案：`dotnet new sln --format slnx`。

注意：`dotnet build -o` **不能**配合解决方案使用（报 `NETSDK1194`），多项目输出请用第 5 节的 artifacts 方案。

---

## 10. 常见报错对照

| 报错 | 原因 | 处理 |
| --- | --- | --- |
| `MSB1003: Specify a project or solution file` | 当前目录没有 csproj/sln | `cd` 进 `ProjectEditor`，或写全路径 |
| `CS0246` 指向 `System.Configuration` | `App.xaml.cs` 顶部两行是 .NET Framework 老模板残留 | 删掉 `using System.Configuration;` / `using System.Data;` |
| `NETSDK1199` | 把 `ArtifactsPath` 写进了 csproj | 挪到 `Directory.Build.props` |
| `NETSDK1200` | 开了 `UseArtifactsOutput` 但没有 `ArtifactsPath` | 建 `Directory.Build.props` 并显式给路径 |
| F5 起不来 | `launch.json` 的 `program` 写错 | 指向 `...\bin\Debug\net10.0-windows\ProjectEditor.**dll**`（不是 exe） |
| 配置文件读不到 | 相对路径 + 工作目录不一致 | 见第 11 节 |

---

## 11. 和 `config` 目录相关的两条铁律

### ① config 想进 `bin`，必须在 csproj 里显式声明

默认只有 `.cs` / `.xaml` 等被处理，`config\*.json` **不会**自动复制到输出目录。

```xml
<ItemGroup>
  <None Update="config\**\*" CopyToOutputDirectory="PreserveNewest" />
</ItemGroup>
```

用 `Update` 而不是 `Include`——SDK 已把这些文件作为 `None` 项收进来了，再 `Include` 会重复包含报错。

### ② 别用"当前工作目录"找配置，用 `AppContext.BaseDirectory`

三种启动方式的当前目录并不相同：

| 启动方式 | 当前目录 |
| --- | --- |
| `dotnet run` | 项目目录 `ProjectEditor\` |
| VS Code F5 | 由 `launch.json` 的 `cwd` 决定 |
| 双击 `bin\...\ProjectEditor.exe` | exe 所在目录 |

所以代码里统一这样拼：

```csharp
var configPath = Path.Combine(AppContext.BaseDirectory, "config", "appsettings.json");
```

`AppContext.BaseDirectory` 永远等于 exe 所在目录，三种启动方式都一致。

---

## 12. VS Code 调试配置参考

`.vscode/launch.json`：

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug ProjectEditor",
      "type": "coreclr",
      "request": "launch",
      "preLaunchTask": "build",
      "program": "${workspaceFolder}/ProjectEditor/bin/Debug/net10.0-windows/ProjectEditor.dll",
      "cwd": "${workspaceFolder}/ProjectEditor",
      "console": "internalConsole",
      "stopAtEntry": false
    }
  ]
}
```

- `program` 指向 **.dll**，不是 .exe。
- `cwd` 与第 11 节的路径规则有关；如果以后改用 `AppContext.BaseDirectory`，`cwd` 填什么都不影响。
