#include <glib/gstdio.h>
#include <gtk/gtk.h>
#include <unistd.h>

typedef struct
{
  GtkWidget *file, *name, *rnm;
} Widgets;

static void file_changed(GtkFileChooser*, Widgets*);
static void rename_clicked(GtkButton*, Widgets*);

int main(int argc, char *argv[])
{
  Widgets *w = (Widgets*) g_malloc(sizeof(Widgets));
  GtkWidget *window, *vbox, *hbox;

  gtk_init(&argc, &argv);

  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window), "Exercise 4-1");
  gtk_container_set_border_width(GTK_CONTAINER(window), 10);

  g_signal_connect(G_OBJECT(window), "destroy",
                  G_CALLBACK(gtk_main_quit), NULL);

  
}