typedef struct _footype footype;
footype *my_data;

my_data = (footype *) g_malloc(sizeof(footype) *3);

my_data = g_new(footype, 3);

// Initializes all memory locations to 0
my_data = g_new0(footype, 3);

my_data = (footype *) g_realloc(my_data, size(footype) * 4);

my_data = g_renew(my_data, 4);

// GMemChunk _;