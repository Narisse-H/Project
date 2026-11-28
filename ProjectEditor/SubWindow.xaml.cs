using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ProjectEditor;

/// <summary>
/// Interaction logic for SubWindow.xaml
/// </summary>
public partial class SubWindow : Window
{
    public SubWindow()
    {
        InitializeComponent();
    }

    public string output_api_key { get; private set; } = string.Empty;
    private void OnSaveClick(object sender, RoutedEventArgs e)
    {
        var api_key = ApiKeyTextBox.Text.Trim();
        if (!string.IsNullOrEmpty(api_key))
        {
            output_api_key = api_key;
            DialogResult = true;
        }
        //MessageBox.Show("按钮接通了(OnSaveClick)!");
    }
}