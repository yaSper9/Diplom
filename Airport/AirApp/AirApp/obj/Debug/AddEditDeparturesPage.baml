   M S B A M L   `   `   `  ����A  =AirApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:AirAppAirApp  5      "    AirApp.AddEditDeparturesPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      &localclr-namespace:AirApp     5        N� Title$  AddEditDeparturesPage��5	      .��5      �  � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� $��Рейс��6   6"   �� 5   
   $��Время вылета��6   $��1��6(   67   �� 5   
   $��Самолёт��6   $��2��6#   62   �� 5   
   $%��Командир экипажа��6   $��3��6,   6;   �� 5   
   -   5         ��Name$ ComboFlights��5   k   $��1��64   $	��150��6D   $
��Left=�6P    �� DisplayMemberPath$ FlightNumber��6�    �� SelectedItem 6   �� *	Flights+6�   �� 5   
   $��1��61   $��1��6A   $	��300��6N   $
��Left=�6Z   ��6   �� *DepartureTime+6w   �� 5   
   -   5        $ ComboPlanes��5   w   $��1��63   $��2��6C   $	��300��6P   $
��Left=�6\   $ 	TypePlane��6�    6   �� *Planes+6�   �� 5   
   $��1��61   $��3��6A   $	��300��6N   $
��Left=�6Z   ��6   �� *CrewCommander+6w   �� 5    
   -   5        $��BtnSaveDepartures��5    F   $��Сохранить��6   $��2��6%   $��5��69   6�   5!      5"      