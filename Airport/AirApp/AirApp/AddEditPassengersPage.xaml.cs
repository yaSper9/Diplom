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
    /// Логика взаимодействия для AddEditPassengersPage.xaml
    /// </summary>
    public partial class AddEditPassengersPage : Page
    {
        private Passengers _currentPassenger = new Passengers();

        public AddEditPassengersPage(Passengers selectedPassengers)
        {
            InitializeComponent();

            if (selectedPassengers != null)
            {
                _currentPassenger = selectedPassengers;
            }

            DataContext = _currentPassenger;
            ComboDepartures.ItemsSource = AirBaseEntities.GetContext().Departures.ToList();
        }

        private void BtnSavePassengers_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
;
            if (_currentPassenger.Departures == null)
                errors.AppendLine("Выберите номер вылета");
            if (_currentPassenger.SeatNumber < 1)
                errors.AppendLine("Укажите номер места");
            if (string.IsNullOrWhiteSpace(_currentPassenger.FIO))
                errors.AppendLine("Укажите ФИО пассажира");
            if (string.IsNullOrWhiteSpace(_currentPassenger.Passport))
                errors.AppendLine("Укажите пасспорт пассажира");


            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentPassenger.CodePassenger == 0)
                AirBaseEntities.GetContext().Passengers.Add(_currentPassenger);

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
