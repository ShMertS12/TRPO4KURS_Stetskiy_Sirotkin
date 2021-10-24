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
using System.ComponentModel;

namespace TRPO4KURS_Stetskiy_Sirotkin.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserOut.xaml
    /// </summary>
    public partial class UserOut : Page, INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private List<Users> PrivUser { get; set; }
        public List<Users> CurUser { get { return PrivUser; } set { PrivUser = value;  PropertyChanged(this, new PropertyChangedEventArgs("CurUser")); } }
        
        


        public UserOut(Users usya)
        {
            InitializeComponent();
            DataContext = this;
            
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            CurUser = Core.BD.Users.Where(u => u.FIO.Contains(SearchTB.Text)).ToList();
            SortCB.SelectedItem = null;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            CurUser = Core.BD.Users.ToList();
        }

        private void VozrCBI_Selected(object sender, RoutedEventArgs e)
        {
            CurUser = (from usya in CurUser orderby usya.FIO ascending select usya).ToList();
        }

        private void UbivCBI_Selected(object sender, RoutedEventArgs e)
        {
            CurUser = (from usya in CurUser orderby usya.FIO descending select usya).ToList();
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            CurUser = CurUser.Where(u => u.RoleID == 2).ToList();
        }

        private void CheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            CurUser = Core.BD.Users.Where(u => u.FIO.Contains(SearchTB.Text)).ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            SearchTB.Text = "";
            SortCB.SelectedItem = null;
            CHB.IsChecked = false;
            CurUser = Core.BD.Users.Where(u => u.FIO.Contains(SearchTB.Text)).ToList();
        }
    }
}
