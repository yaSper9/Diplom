   M S B A M L   `   `   `  ����A  =AirApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:AirAppAirApp  5   	        AirApp.AuthorizationWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   &localclr-namespace:AirApp     5   	     � Title$5  /Авторизация пользователя��5   	   $	��350��6*   $	��500��67    � 
ResizeMode$ CanMinimize=�6C    � WindowStartupLocation$ CenterScreen=�6\   .��5	      �  � RowDefinitions 5
   
   �� 5      $��75 �6   �� 5      $��* �6   �� 5      $��30 �6   .+�5   
   �� $��Resources/logo.jpg��6   $
��Left=�6,   $��10,1,0,1q�6G   $��67��6Y   6f   �� 5   
   $��Авторизация��6   $��28(�6'   $��Center=�65   $��Center=�6R   ���	#FFF1EAEA$��Source Sans Pro Black)�6�   � 5   
   ���#003764 K� ZIndex$ -2��6$   68   � 5   
   $��2��6   ���#042a4f63   �� 5   
   $��
Логин��6   $��1 ��6!   $
��Left=�6/   $��
130,48,0,0q�6J   $	��Top=�6^   6x   �� 5   
   $��Пароль��6   $��1��6"   $
��Left=�6/   $��122,108,0,0q�6J   $	��Top=�6_   6y   �� 5   
   -   5         ��Name$ LogBox��5      $��185,41,185,0q�6"   $��1��68   $	��Top=�6E   6_   G� 5   
   -   5         G�Name$ PassBox��5      $��185,101,185,0q�6'   $��1��6>   $	��Top=�6K   6e   �� 5   
   -   5        $��
Войти��5      $��1��6!   $	��100��6F   $��Center=�6R   $��30��6o   $��	0,166,0,0q�6{   $	��Top=�6�   5      5      