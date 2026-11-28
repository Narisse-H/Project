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

    private void OnSaveClick(object sender, RoutedEventArgs e)
    {
        MessageBox.Show("按钮接通了(OnSaveClick)!");
    }
}