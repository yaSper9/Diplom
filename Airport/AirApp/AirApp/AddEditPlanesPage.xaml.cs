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
    /// Логика взаимодействия для AddEditPlanesPage.xaml
    /// </summary>
    public partial class AddEditPlanesPage : Page
    {
        private Planes _currentPlane = new Planes();

        public AddEditPlanesPage(Planes selectedPlanes)
        {
            InitializeComponent();

            if (selectedPlanes != null)
            {
                _currentPlane = selectedPlanes;
            }

            DataContext = _currentPlane;
        }

        private void BtnSavePlanes_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (_currentPlane.NumberSeat < 1)
                errors.AppendLine("Укажите количество мест");
            if (_currentPlane.FlightRange < 1)
                errors.AppendLine("Укажите дальность полёта");
            if (string.IsNullOrWhiteSpace(_currentPlane.TypePlane))
                errors.AppendLine("Укажите тип самолёта");


            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentPlane.PlaneCode == 0)
                AirBaseEntities.GetContext().Planes.Add(_currentPlane);

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
