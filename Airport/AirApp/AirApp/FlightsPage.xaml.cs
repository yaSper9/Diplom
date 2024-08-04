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
using System.Windows.Media.Media3D;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AirApp
{
    /// <summary>
    /// Логика взаимодействия для FlightsPage.xaml
    /// </summary>
    public partial class FlightsPage : Page
    {
        public FlightsPage()
        {
            InitializeComponent();
            //DGridFlights.ItemsSource = AirBaseEntities.GetContext().Flights.ToList();
        }

        private void BtnAddFlights_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditFlightsPage(null));
        }

        private void BtnEditFlights_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditFlightsPage((sender as Button).DataContext as Flights));
        }

        private void BtnDeleteFlights_Click(object sender, RoutedEventArgs e)
        {
            var flightsForRemoving = DGridFlights.SelectedItems.Cast<Flights>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {flightsForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    AirBaseEntities.GetContext().Flights.RemoveRange(flightsForRemoving);
                    AirBaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    DGridFlights.ItemsSource = AirBaseEntities.GetContext().Flights.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                AirBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridFlights.ItemsSource = AirBaseEntities.GetContext().Flights.ToList();
            }
        }
    }
}
