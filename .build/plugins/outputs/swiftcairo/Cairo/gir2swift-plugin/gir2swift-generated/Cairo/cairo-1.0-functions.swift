import CGLib
import CCairo
import GLib
import GLibObject
import GIO
import GModule
@inlinable public func imageSurfaceCreate(format: cairo_format_t, width: Int, height: Int) -> Surface {
    
    return Surface(cairo_image_surface_create(format, CInt(width), CInt(height)))
    
}


