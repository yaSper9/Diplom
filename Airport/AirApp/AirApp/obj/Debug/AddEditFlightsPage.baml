   M S B A M L   `   `   `  ����A  =AirApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:AirAppAirApp  5          AirApp.AddEditFlightsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      &localclr-namespace:AirApp     5        N� Title$  AddEditFlightsPage��5	      .��5      �  � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� $��Номер рейса��6   6)   �� 5   
   $#��Аэропорт вылета��6   $��1��6+   6:   �� 5   
   $+��%Аэропорт назначения��6   $��2��6/   6>   �� 5   
   $(��"Продолжительность��6   $��3��6-   6<   �� 5   
   $%��Стоимость билета��6   $��4��6,   6;   �� 5   
   $��1��60   $	��150��6@   $
��Left=�6L   ��6   �� *FlightNumber+6i   �� 5   
    �� 	MaxLength$	 100��64   $��1��6D   $��1��6T   $	��300��6a   $
��Left=�6m   ��6   �� *DepartureAirport+6�   �� 5   
   -   5         ��Name$ ComboAirports��5   �   $��1��6@   $��2��6P   $	��300��6]   $
��Left=�6i    �� DisplayMemberPath$ Title��6�    �� SelectedItem 6   �� *DestinationAirports+6�   �� 5    
   $��1��62   $��3��6B   $	��150��6O   $
��Left=�6[   ��6   �� *FlightDuration+6x   �� 5!   
   $��1��6/   $��4��6?   $	��150��6L   $
��Left=�6X   ��6   �� *TicketPrice+6u   �� 5#   
   -   5        $��BtnSaveFlights��5#   F   $��Сохранить��6   $��2��6%   $��5��69   6{   5$      5%      