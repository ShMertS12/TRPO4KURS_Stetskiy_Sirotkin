using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Diagnostics;

namespace TRPO4KURS_Stetskiy_Sirotkin
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ButCal_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButEx_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButIm_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButBack_Click(object sender, RoutedEventArgs e)
        {

        }

        private void MainFrame_Navigated(object sender, NavigationEventArgs e)
        {
            if (!MainFrame.CanGoBack)
            {
                ButBack.Visibility = Visibility.Collapsed;
            }
            else
            {
                ButBack.Visibility = Visibility.Visible;
            }
        }

        private void SPBUT_Click(object sender, RoutedEventArgs e)
        {
            Process.Start("help.chm");
        }
    }
}
