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

namespace TRPO4KURS_Stetskiy_Sirotkin.Pages
{
    /// <summary>
    /// Логика взаимодействия для Shyip.xaml
    /// </summary>
    public partial class Shyip : Page
    {
        public List<Shipper> ShipList { get; set; }

        public Shyip()
        {
            InitializeComponent();
            ShipList = Core.BD.Shipper.ToList();
            DataContext = this;
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButtonDel_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ButtonEdit_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
