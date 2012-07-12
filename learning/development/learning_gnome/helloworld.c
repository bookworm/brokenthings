#include <gtk/gtk.h>

// gcc -Wall -g helloworld.c -o helloworld `pkg-config --cflags gtk+-2.0` 
// \ `pkg-config --libs gtk+-2.0`

int main(int argc, char *argv[])
{
  GtkWidget *window;

  gtk_init(&argc, &argv);

  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window), "Hello world");
  gtk_widget_show(window);

  gtk_main();
  return 0;
}