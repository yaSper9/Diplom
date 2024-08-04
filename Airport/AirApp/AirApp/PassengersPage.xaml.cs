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
    /// Логика взаимодействия для PassengersPage.xaml
    /// </summary>
    public partial class PassengersPage : Page
    {
        public PassengersPage()
        {
            InitializeComponent();
            //DGridPassengers.ItemsSource = AirBaseEntities.GetContext().Passengers.ToList();
        }

        private void BtnEditPassengers_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPassengersPage((sender as Button).DataContext as Passengers));
        }

        private void BtnDeletePassengers_Click(object sender, RoutedEventArgs e)
        {
            var passengersForRemoving = DGridPassengers.SelectedItems.Cast<Passengers>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {passengersForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    AirBaseEntities.GetContext().Passengers.RemoveRange(passengersForRemoving);
                    AirBaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    DGridPassengers.ItemsSource = AirBaseEntities.GetContext().Passengers.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void BtnAddPassengers_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPassengersPage(null));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                AirBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridPassengers.ItemsSource = AirBaseEntities.GetContext().Passengers.ToList();
            }
        }
    }
}
