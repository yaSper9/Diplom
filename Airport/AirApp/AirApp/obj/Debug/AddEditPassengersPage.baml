   M S B A M L   `   `   `  ����A  =AirApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:AirAppAirApp  5      "    AirApp.AddEditPassengersPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      &localclr-namespace:AirApp     5        N� Title$  AddEditPassengersPage��5	      .��5      �  � ColumnDefinitions 5   
   �� 5      $	��200 �6   �� 5      $��* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� $��
Вылет��6   6#   �� 5   
   $��Номер места��6   $��1��6'   66   �� 5   
   $��ФИО��6   $��2��6   6.   �� 5   
   $��Паспорт��6   $��3��6#   62   �� 5   
   -   5         ��Name$ ComboDepartures��5   n   $��1��67   $	��150��6G   $
��Left=�6S    �� DisplayMemberPath$ CodeDeparture��6�    �� SelectedItem 6   �� *
Departures+6�   �� 5   
   $��1��6.   $��1��6>   $	��150��6K   $
��Left=�6W   ��6   �� *
SeatNumber+6t   �� 5   
    �� 	MaxLength$	 100��6'   $��1��67   $��2��6G   $	��300��6T   $
��Left=�6`   ��6   �� *FIO+6}   �� 5   
   $ 11��6,   $��1��6;   $��3��6K   $	��150��6X   $
��Left=�6d   ��6   �� *
Passport+6�   �� 5    
   -   5        $��BtnSavePassengers��5    F   $��Сохранить��6   $��2��6%   $��5��69   6�   5!      5"      