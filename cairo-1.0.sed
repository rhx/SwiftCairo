s/func image_surface_create()/func image_surface_create(format: cairo_format_t, width: Int, height: Int) -> Surface/
s/cairo_image_surface_create()/return Surface(cairo_image_surface_create(format, CInt(width), CInt(height)))/
