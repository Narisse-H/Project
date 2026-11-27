using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
//using System.Windows.Shapes;
using System.IO;
using Microsoft.Win32;

namespace ProjectEditor;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
    }

    private void OnOpenClick(object sender, RoutedEventArgs e)
    {
        var dialog = new OpenFileDialog
        {
            Title  = "打开文件",
            Filter = "代码/文本文件|*.txt;*.cs;*.xaml;*.md;*.json|所有文件|*.*"
        };
        // Filter 格式：显示名|通配符|显示名|通配符，竖线是分隔符

        // ── 2. 用户点了取消就直接返回 ──
        if (dialog.ShowDialog() != true)
            return;

        // ── 3. 读文件并显示 ──
        try
        {
            EditorBox.Text    = File.ReadAllText(dialog.FileName);   // 内容 → 编辑区
            FileNameText.Text = Path.GetFileName(dialog.FileName);   // 顶栏只显示文件名，不显示完整路径
        }
        catch (Exception ex)
        {
            // 文件被占用、没权限、路径太长……都可能失败。
            // 不 catch 的话异常会往上抛，程序直接崩掉。
            MessageBox.Show($"打不开这个文件：{ex.Message}",
                            "错误", MessageBoxButton.OK, MessageBoxImage.Error);
        }
        //MessageBox.Show("按钮接通了(OnOpenClick)!");
    }

    private void OnSaveClick(object sender, RoutedEventArgs e)
    {
        MessageBox.Show("按钮接通了(OnSaveClick)!");
    }
}