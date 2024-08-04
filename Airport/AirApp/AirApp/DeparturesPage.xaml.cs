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
    /// Логика взаимодействия для DeparturesPage.xaml
    /// </summary>
    public partial class DeparturesPage : Page
    {
        public DeparturesPage()
        {
            InitializeComponent();
            DGridDepartures.ItemsSource = AirBaseEntities.GetContext().Departures.ToList();
        }

        private void BtnEditDepartures_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditDeparturesPage((sender as Button).DataContext as Departures));
        }

        private void BtnDeleteDepartures_Click(object sender, RoutedEventArgs e)
        {
            var departuresForRemoving = DGridDepartures.SelectedItems.Cast<Departures>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {departuresForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    AirBaseEntities.GetContext().Departures.RemoveRange(departuresForRemoving);
                    AirBaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    DGridDepartures.ItemsSource = AirBaseEntities.GetContext().Departures.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void BtnAddDepartures_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditDeparturesPage(null));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                AirBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridDepartures.ItemsSource = AirBaseEntities.GetContext().Departures.ToList();
            }
        }
    }
}
