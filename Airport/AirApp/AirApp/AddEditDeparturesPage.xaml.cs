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
    /// Логика взаимодействия для AddEditDeparturesPage.xaml
    /// </summary>
    public partial class AddEditDeparturesPage : Page
    {
        private Departures _currentDeparture = new Departures();

        public AddEditDeparturesPage(Departures selectedDepartures)
        {
            InitializeComponent();

            if (selectedDepartures != null)
            {
                _currentDeparture = selectedDepartures;
            }

            DataContext = _currentDeparture;
            ComboFlights.ItemsSource = AirBaseEntities.GetContext().Flights.ToList();
            ComboPlanes.ItemsSource = AirBaseEntities.GetContext().Planes.ToList();
        }

        private void BtnSaveDepartures_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (_currentDeparture.Flights == null)
                errors.AppendLine("Выберите рейс");
            if (_currentDeparture.Planes == null)
                errors.AppendLine("Выберите самолёт");
            if (string.IsNullOrWhiteSpace(_currentDeparture.CrewCommander))
                errors.AppendLine("Укажите командира экипажа");


            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentDeparture.CodeDeparture == 0)
                AirBaseEntities.GetContext().Departures.Add(_currentDeparture);

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
