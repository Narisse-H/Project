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

    //Script Part
    private string file_path = string.Empty;
    private string api_key = string.Empty;
    private void OnOpenClick(object sender, RoutedEventArgs e)
    {
        var dialog = new OpenFileDialog
        {
            Title = "打开文件",
            Filter = "代码/文本文件|*.c;*.cpp;*.cs;*.java;*.py;*.lua;*.json;*.txt",
        };

        if (dialog.ShowDialog() == true)
        {
            try
            {
                EditorBox.Text = File.ReadAllText(dialog.FileName);   //EditorBox: from .xaml
                FileNameText.Text = Path.GetFileName(dialog.FileName);   //FileNameText: from .xaml
                FilePathText.Text = dialog.FileName;   //FilePathText: from .xaml
                file_path = dialog.FileName;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"打不开这个文件：{ex.Message}",
                                "错误", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        //MessageBox.Show("按钮接通了(OnOpenClick)!");
    }

    private void OnSaveClick(object sender, RoutedEventArgs e)
    {
        if (file_path == string.Empty)
        {
            var dialog = new SaveFileDialog
            {
                Title = "保存文件",
                Filter = "代码/文本文件|*.c;*.cpp;*.cs;*.java;*.py;*.lua;*.json;*.txt",
            };

            if (dialog.ShowDialog() == true)
            {
                try
                {
                    File.WriteAllText(dialog.FileName, EditorBox.Text);
                    FileNameText.Text = Path.GetFileName(dialog.FileName);
                    FilePathText.Text = dialog.FileName;
                    file_path = dialog.FileName;
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"无法保存文件：{ex.Message}",
                                    "错误", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
        else
        {
            try
            {
                File.WriteAllText(file_path, EditorBox.Text);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"无法保存文件：{ex.Message}",
                                "错误", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        //MessageBox.Show("按钮接通了(OnSaveClick)!");
    }

    private void OnSendClick(object sender, RoutedEventArgs e)
    {
        var input = InputBox.Text.Trim();
        if (ChatContentText.Text == "")
        {
            ChatContentText.Text = string.Empty;
        }
        if (input.Length != 0)
        {
            ChatContentText.Text += $"你：{input}{Environment.NewLine}";
            InputBox.Clear();
            ChatScrollViewer.ScrollToEnd();
        }
        //MessageBox.Show("按钮接通了(OnSendClick)!");
    }
}