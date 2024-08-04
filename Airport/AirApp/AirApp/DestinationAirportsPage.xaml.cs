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
    /// Логика взаимодействия для DestinationAirportsPage.xaml
    /// </summary>
    public partial class DestinationAirportsPage : Page
    {
        public DestinationAirportsPage()
        {
            InitializeComponent();
            DGridDestAir.ItemsSource = AirBaseEntities.GetContext().DestinationAirports.ToList();
        }

        private void BtnEditDestAir_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditDestinationAirportsPage((sender as Button).DataContext as DestinationAirports));
        }

        private void BtnDeleteDestAir_Click(object sender, RoutedEventArgs e)
        {
            var destairForRemoving = DGridDestAir.SelectedItems.Cast<DestinationAirports>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {destairForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    AirBaseEntities.GetContext().DestinationAirports.RemoveRange(destairForRemoving);
                    AirBaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    DGridDestAir.ItemsSource = AirBaseEntities.GetContext().DestinationAirports.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void BtnAddDestAir_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditDestinationAirportsPage(null));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                AirBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridDestAir.ItemsSource = AirBaseEntities.GetContext().DestinationAirports.ToList();
            }
        }
    }
}
