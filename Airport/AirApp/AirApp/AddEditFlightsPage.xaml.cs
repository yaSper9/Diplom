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
    /// Логика взаимодействия для AddEditFlightsPage.xaml
    /// </summary>
    public partial class AddEditFlightsPage : Page
    {
        private Flights _currentFlight = new Flights();

        public AddEditFlightsPage(Flights selectedFlights)
        {
            InitializeComponent();

            if (selectedFlights != null)
            {
                _currentFlight = selectedFlights;
            }

            DataContext = _currentFlight;
            ComboAirports.ItemsSource = AirBaseEntities.GetContext().DestinationAirports.ToList();
        }

        private void BtnSaveFlights_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (_currentFlight.FlightNumber < 1)
                errors.AppendLine("Укажите номер рейса");
            if (_currentFlight.FlightDuration < 1)
                errors.AppendLine("Укажите продолжительность рейса");
            if (_currentFlight.TicketPrice < 1)
                errors.AppendLine("Укажите стоимость билета");
            if (string.IsNullOrWhiteSpace(_currentFlight.DepartureAirport))
                errors.AppendLine("Укажите аэропорт вылета");
            if (_currentFlight.DestinationAirports == null)
                errors.AppendLine("Выберите аэропорт назначения");
            

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentFlight.FlightCode == 0)
                AirBaseEntities.GetContext().Flights.Add(_currentFlight);

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
