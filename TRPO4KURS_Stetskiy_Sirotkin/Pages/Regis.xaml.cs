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
    /// Логика взаимодействия для Regis.xaml
    /// </summary>
    public partial class Regis : Page
    {
        public Regis()
        {
            InitializeComponent();
            CBX.SelectedIndex = 0;
            Console.WriteLine($"{CBX.SelectedValue.ToString()} типа {CBX.SelectedValue.ToString().GetType()} (SelectedValue.ToString)");
            Console.WriteLine(CBX.SelectedValue.ToString().Contains("Пользователь"));
            Console.WriteLine(CBX.SelectedItem.ToString().Contains("Пользователь"));
            Console.WriteLine(CBX.SelectedItem.ToString() == "System.Windows.Controls.ComboBoxItem: Пользователь");

            TBLOGIN.Text = "Логин или почта";
            TBLOGIN.Foreground = new SolidColorBrush(Color.FromRgb(125, 153, 130));

            TBPASSGLUSH.Text = "Не менее 6 латинский знаков с 1 цифрой";
            TBPASSGLUSH.FontSize = 10;
            TBPASSGLUSH.Foreground = new SolidColorBrush(Color.FromRgb(125, 153, 130));

            TBPASSCORRGLUSH.Text = "Повторите пароль";
            TBPASSCORRGLUSH.Foreground = new SolidColorBrush(Color.FromRgb(125, 153, 130));

            TBFIO.Text = "ФИО русскими буквами";
            TBFIO.Foreground = new SolidColorBrush(Color.FromRgb(125, 153, 130));


        }

        private void CancelBut_Click(object sender, RoutedEventArgs e)
        {
            NavigationService?.Navigate(new Avtoriz());
        }

 
        /*private bool CheckLett(string S)
        {
            int i = 0;
            while (i != S.Length)
            {
                i++;
            }


            return true;
        }*/

        private void RegBut_Click(object sender, RoutedEventArgs e)
        {

            if (!(string.IsNullOrEmpty(TBLOGIN.Text) || string.IsNullOrEmpty(TBPASS.Password)
                || string.IsNullOrEmpty(TBPASSCORR.Password) || string.IsNullOrEmpty(TBFIO.Text)))
            {
                if (TBPASS.Password.Length >= 6)
                {
                    int numcount = 0;
                    for (int i = 0; i < TBPASS.Password.Length; i++)
                    {
                        switch (TBPASS.Password[i])
                        {
                            case '0':
                                numcount++;
                                break;
                            case '1':
                                numcount++;
                                break;
                            case '2':
                                numcount++;
                                break;
                            case '3':
                                numcount++;
                                break;
                            case '4':
                                numcount++;
                                break;
                            case '5':
                                numcount++;
                                break;
                            case '6':
                                numcount++;
                                break;
                            case '7':
                                numcount++;
                                break;
                            case '8':
                                numcount++;
                                break;
                            case '9':
                                numcount++;
                                break;

                            default:
                                break;

                        }
                    }
                    if (numcount == 0)
                        MessageBox.Show("Нужно ввести хотя бы одну цифру");

                    else
                    {
                        int lettercount = 0;
                        for (int i = 0; i < TBPASS.Password.Length; i++)
                        {

                            if (char.IsLetter(TBPASS.Password[i]))
                            {
                                lettercount++;

                            }
                        }
                        if (lettercount < 3)
                            MessageBox.Show("Пароль должен содержать минимум 3 буквы");

                        else if (TBPASS.Password != TBPASSCORR.Password)
                            MessageBox.Show("Пароли не совпадают");

                        else
                        {
                            SAVSAA_Material_storageEntities db = new SAVSAA_Material_storageEntities();

                            Users userobject = new Users
                            {
                                FIO = TBFIO.Text,
                                Login = TBLOGIN.Text,
                                Password = TBPASS.Password,
                            };
                            /*
                            //CBX.SelectedValue.ToString();
                            switch (CBX.SelectedIndex)
                            {
                                case 1:
                                    userobject.RoleID = 1;
                                    db.Users.Add(userobject);
                                    db.SaveChanges();
                                    MessageBox.Show("Пользователь зарегистрирован!");
                                    NavigationService.GoBack();
                                    break;
                                case 0:
                                    userobject.RoleID = 2;
                                    db.Users.Add(userobject);
                                    db.SaveChanges();
                                    MessageBox.Show("Пользователь зарегистрирован!");
                                    NavigationService.GoBack();
                                    break;

                                default: break;
                            }
                            */

                            switch (CBX.SelectedItem.ToString().Replace("System.Windows.Controls.ComboBoxItem: ", ""))
                            {
                                case "Администратор":
                                    userobject.RoleID = 1;
                                    db.Users.Add(userobject);
                                    db.SaveChanges();
                                    MessageBox.Show("Пользователь зарегистрирован!");
                                    NavigationService.Navigate(new Avtoriz());
                                    break;
                                case "Пользователь":
                                    userobject.RoleID = 2;
                                    db.Users.Add(userobject);
                                    db.SaveChanges();
                                    MessageBox.Show("Пользователь зарегистрирован!");
                                    NavigationService.Navigate(new Avtoriz());
                                    break;

                                default: break;
                            }
                            //List<Users> allUsers = Core.BD.Users.ToList();
                            //allUsers[0].Role;



                        }
                    }
                }
                else
                    MessageBox.Show("Пароль должен быть не менее 6 символов");
            }
            else MessageBox.Show("Введите недостоющие данные.");

        }




        private void TBFIO_GotFocus(object sender, RoutedEventArgs e)
        {
            TBFIO.Text = "";
            TBFIO.Foreground = new SolidColorBrush(Color.FromRgb(0, 0, 0));
        }
        

        private void TBLOGIN_GotFocus(object sender, RoutedEventArgs e)
        {
            TBLOGIN.Text = "";
            TBLOGIN.Foreground = new SolidColorBrush(Color.FromRgb(0, 0, 0));
        }

        private void TBLOGIN_LostFocus(object sender, RoutedEventArgs e)
        {
            if(TBLOGIN.Text.Length <= 0)
            {
                TBLOGIN.Text = "Логин или почта";
                TBLOGIN.Foreground = new SolidColorBrush(Color.FromRgb(125, 153, 130));
            }
            
        }

        private void TBFIO_LostFocus(object sender, RoutedEventArgs e)
        {
            if (TBFIO.Text.Length <= 0)
            {
                TBFIO.Text = "ФИО русскими буквами";
                TBFIO.Foreground = new SolidColorBrush(Color.FromRgb(125, 153, 130));
            }
        }

        private void TBPASSGLUSH_GotFocus(object sender, RoutedEventArgs e)
        {
            TBPASSGLUSH.Visibility = Visibility.Collapsed;
            TBPASS.Visibility = Visibility.Visible;
        }



        private void TBPASSCORRGLUSH_GotFocus(object sender, RoutedEventArgs e)
        {
            TBPASSCORRGLUSH.Visibility = Visibility.Collapsed;
            TBPASSCORR.Visibility = Visibility.Visible;
        }
    }
}
