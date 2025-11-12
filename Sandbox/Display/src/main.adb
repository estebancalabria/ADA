with SDL.Video.Windows;
with SDL.Events.Events;
with SDL.Events.Enums;

procedure Hello_World is
   Win : Gtk_Window;
   Label : Gtk_Label;
begin
   Gtk.Main.Init;

   Gtk_New (Win);
   Win.Set_Title ("Hola, Mundo");
   Win.Set_Default_Size (250, 100);

   Gtk_New (Label, "¡Hola, mundo en GtkAda!");
   Win.Add (Label);

   Win.Show_All;

   Gtk.Main.Main;
end Hello_World;
