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
    /// Логика взаимодействия для PlanesPage.xaml
    /// </summary>
    public partial class PlanesPage : Page
    {
        public PlanesPage()
        {
            InitializeComponent();
            //DGridPlanes.ItemsSource = AirBaseEntities.GetContext().Planes.ToList();
        }

        private void BtnEditPlanes_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPlanesPage((sender as Button).DataContext as Planes));
        }

        private void BtnDeletePlanes_Click(object sender, RoutedEventArgs e)
        {
            var planesForRemoving = DGridPlanes.SelectedItems.Cast<Planes>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {planesForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    AirBaseEntities.GetContext().Planes.RemoveRange(planesForRemoving);
                    AirBaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    DGridPlanes.ItemsSource = AirBaseEntities.GetContext().Planes.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void BtnAddPlanes_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPlanesPage(null));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                AirBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridPlanes.ItemsSource = AirBaseEntities.GetContext().Planes.ToList();
            }
        }
    }
}
