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
            Filter = "代码/文本文件|*.txt;*.cs;*.xaml;*.md;*.json;*.lua;*.c"
        };

        if (dialog.ShowDialog() == true)
        {
            try
            {
                EditorBox.Text    = File.ReadAllText(dialog.FileName);   //EditorBox: from .xaml
                FileNameText.Text = Path.GetFileName(dialog.FileName);   //FileNameText: from .xaml
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
        MessageBox.Show("按钮接通了(OnSaveClick)!");
    }
}