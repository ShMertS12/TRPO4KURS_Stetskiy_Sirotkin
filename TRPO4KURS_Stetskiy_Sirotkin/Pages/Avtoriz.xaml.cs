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
    /// Логика взаимодействия для Avtoriz.xaml
    /// </summary>
    public partial class Avtoriz : Page
    {
        public Avtoriz()
        {
            InitializeComponent();
            TLB.Text = "administrator";
            PWB.Password = "1";
        }

        private void LogBut_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(TLB.Text) || string.IsNullOrEmpty(PWB.Password))
            {
                MessageBox.Show("Введите логин и пароль");
                return;


            }

            using (var db = new SAVSAA_Material_storageEntities())
            {
                var user = db.Users.AsNoTracking().FirstOrDefault(u => u.Login == TLB.Text);

                if (user == null)
                {
                    MessageBox.Show("Данный логин не найден");
                    return;
                }

                if (user.Password != PWB.Password)
                {
                    MessageBox.Show("Данный пароль неверен");
                    return;
                }

                switch (user.RoleID)
                {
                    case 2:
                        {
                            MessageBox.Show("befsdfsdf");
                            break;
                        }

                    case 1:
                        {
                            MessageBox.Show("sfsafsdfsdfsfsfsfsdsffagygsdfdfsdfasdf");
                            break;
                        }

                }

            }
        }

        private void RegBut_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
