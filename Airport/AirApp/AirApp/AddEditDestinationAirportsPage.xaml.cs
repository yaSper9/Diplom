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

namespace AirApp
{
    /// <summary>
    /// Логика взаимодействия для AddEditDestinationAirportsPage.xaml
    /// </summary>
    public partial class AddEditDestinationAirportsPage : Page
    {
        private DestinationAirports _currentDestAir = new DestinationAirports();

        public AddEditDestinationAirportsPage(DestinationAirports selectedDestAir)
        {
            InitializeComponent();

            if (selectedDestAir != null)
            {
                _currentDestAir = selectedDestAir;
            }

            DataContext = _currentDestAir;
        }

        private void BtnSaveDestAir_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentDestAir.Title))
                errors.AppendLine("Укажите название аэропорта");


            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentDestAir.AirportCode == 0)
                AirBaseEntities.GetContext().DestinationAirports.Add(_currentDestAir);

            try
            {
                AirBaseEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
