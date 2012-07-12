typedef struct _Media
{
  GObject parent_instance;

  guint inv_nr;
  GString *location; 
  GString *title;
  gboolean orig_package; 
} Media;

typedef struct _MediaClass
{
  GObjectClass parent_class;

  // Signals
  void (*unpacked) (Media *media);
  void (*throw_out) (Media *media, gboolean permanent);
} MediaClass;

#define TYPE_MEDIA(media_get_type())

#define MEDIA(object) \
  (G_TYPE_CHECK_INSTANCE_CAST((object), TYPE_MEDIA, Media))

#define IS_MEDIA(object) \
  (G_TYPE_CHECK_INSTANCE_TYPE(object), TYPE_MEDIA)

#define IS_MEDIA_CLASS(klass) \
  (G_TYPE_CHECK_INSTANCE_TYPE((object), TYPE_MEDIA))

#define MEDIA_GET_CLASS(object) \
  (G_TYPE_CHECK_INSTANCE_GET_CLASS((object), TYPE_MEDIA, MediaClass) 

