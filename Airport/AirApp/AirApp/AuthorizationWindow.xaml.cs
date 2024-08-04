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
using System.Windows.Shapes;

namespace AirApp
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private void BtnEnter1_Click(object sender, RoutedEventArgs e)
        {
            string login = LogBox.Text.Trim();
            string password = PassBox.Password.Trim();

            if(login.Length < 5)
            {
                LogBox.ToolTip = "Это поле введено не корректно!";
                LogBox.Background = Brushes.DarkRed;
            }
            else if (password.Length < 5)
            {
                PassBox.ToolTip = "Это поле введено не корректно!";
                PassBox.Background = Brushes.DarkRed;
            } else {
                LogBox.ToolTip = "";
                LogBox.Background = Brushes.Transparent;
                PassBox.ToolTip = "";
                PassBox.Background = Brushes.Transparent;

                Users AuthUser = null;
                using (AirBaseEntities db = new AirBaseEntities())
                {
                    AuthUser = db.Users.Where(b => b.Login == login && b.Password == password).FirstOrDefault();
                }

                if (AuthUser != null)
                {
                    MessageBox.Show("Добро пожаловать!");
                    MainWindow mainWindow = new MainWindow();
                    mainWindow.Show();
                    Close();
                }   
                else
                    MessageBox.Show("Логин или пароль введены некорректно!");
            }
        }
    }
}
