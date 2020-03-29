func cast(_ param: UnsafeRawPointer) -> OpaquePointer! {
    return OpaquePointer(param)
}

func cast<S, T>(_ param: UnsafeMutablePointer<S>?) -> UnsafeMutablePointer<T>! {
    return param?.withMemoryRebound(to: T.self, capacity: 1) { $0 }
}

func cast<S, T>(_ param: UnsafeMutablePointer<S>?) -> UnsafePointer<T>! {
    return param?.withMemoryRebound(to: T.self, capacity: 1) { UnsafePointer<T>($0) }
}

func cast<S, T>(_ param: UnsafePointer<S>?) -> UnsafePointer<T>! {
    return param?.withMemoryRebound(to: T.self, capacity: 1) { UnsafePointer<T>($0) }
}

func cast<T>(_ param: OpaquePointer?) -> UnsafeMutablePointer<T>! {
    return UnsafeMutablePointer<T>(param)
}

func cast<T>(_ param: OpaquePointer?) -> UnsafePointer<T>! {
    return UnsafePointer<T>(param)
}

func cast(_ param: OpaquePointer?) -> UnsafeMutableRawPointer! {
    return UnsafeMutableRawPointer(param)
}

func cast(_ param: UnsafeRawPointer?) -> UnsafeMutableRawPointer! {
    return UnsafeMutableRawPointer(mutating: param)
}

func cast<T>(_ param: UnsafePointer<T>?) -> OpaquePointer! {
    return OpaquePointer(param)
}

func cast<T>(_ param: UnsafeMutablePointer<T>?) -> OpaquePointer! {
    return OpaquePointer(param)
}

func cast<T>(_ param: UnsafeRawPointer?) -> UnsafeMutablePointer<T>! {
    return UnsafeMutableRawPointer(mutating: param)?.assumingMemoryBound(to: T.self)
}

func cast<T>(_ param: UnsafeMutableRawPointer?) -> UnsafeMutablePointer<T>! {
    return param?.assumingMemoryBound(to: T.self)
}

func cast<T>(_ param: T) -> T { return param }

extension gboolean {
    private init(_ b: Bool) { self = b ? gboolean(1) : gboolean(0) }
}

func asStringArray(_ param: UnsafePointer<UnsafePointer<CChar>?>) -> [String] {
    var ptr = param
    var rv = [String]()
    while ptr.pointee != nil {
        rv.append(String(cString: ptr.pointee!))
        ptr = ptr.successor()
    }
    return rv
}

func asStringArray<T>(_ param: UnsafePointer<UnsafePointer<CChar>?>, release: ((UnsafePointer<T>?) -> Void)) -> [String] {
    let rv = asStringArray(param)
    param.withMemoryRebound(to: T.self, capacity: rv.count) { release(UnsafePointer<T>($0)) }
    return rv
}
import CGLib
import CCairo
import GLib
import GLibObject

extension _cairo {
	public typealias FontType = cairo_font_type_t
}







public typealias Status = cairo_status_t

public extension Status {
    static let success = CAIRO_STATUS_SUCCESS /* 0 */
    static let no_memory = CAIRO_STATUS_NO_MEMORY /* 1 */
    static let invalid_restore = CAIRO_STATUS_INVALID_RESTORE /* 2 */
    static let invalid_pop_group = CAIRO_STATUS_INVALID_POP_GROUP /* 3 */
    static let no_current_point = CAIRO_STATUS_NO_CURRENT_POINT /* 4 */
    static let invalid_matrix = CAIRO_STATUS_INVALID_MATRIX /* 5 */
    static let invalid_status = CAIRO_STATUS_INVALID_STATUS /* 6 */
    static let null_pointer = CAIRO_STATUS_NULL_POINTER /* 7 */
    static let invalid_string = CAIRO_STATUS_INVALID_STRING /* 8 */
    static let invalid_path_data = CAIRO_STATUS_INVALID_PATH_DATA /* 9 */
    static let read_error = CAIRO_STATUS_READ_ERROR /* 10 */
    static let write_error = CAIRO_STATUS_WRITE_ERROR /* 11 */
    static let surface_finished = CAIRO_STATUS_SURFACE_FINISHED /* 12 */
    static let surface_type_mismatch = CAIRO_STATUS_SURFACE_TYPE_MISMATCH /* 13 */
    static let pattern_type_mismatch = CAIRO_STATUS_PATTERN_TYPE_MISMATCH /* 14 */
    static let invalid_content = CAIRO_STATUS_INVALID_CONTENT /* 15 */
    static let invalid_format = CAIRO_STATUS_INVALID_FORMAT /* 16 */
    static let invalid_visual = CAIRO_STATUS_INVALID_VISUAL /* 17 */
    static let file_not_found = CAIRO_STATUS_FILE_NOT_FOUND /* 18 */
    static let invalid_dash = CAIRO_STATUS_INVALID_DASH /* 19 */
    static let invalid_dsc_comment = CAIRO_STATUS_INVALID_DSC_COMMENT /* 20 */
    static let invalid_index = CAIRO_STATUS_INVALID_INDEX /* 21 */
    static let clip_not_representable = CAIRO_STATUS_CLIP_NOT_REPRESENTABLE /* 22 */
    static let temp_file_error = CAIRO_STATUS_TEMP_FILE_ERROR /* 23 */
    static let invalid_stride = CAIRO_STATUS_INVALID_STRIDE /* 24 */
    static let font_type_mismatch = CAIRO_STATUS_FONT_TYPE_MISMATCH /* 25 */
    static let user_font_immutable = CAIRO_STATUS_USER_FONT_IMMUTABLE /* 26 */
    static let user_font_error = CAIRO_STATUS_USER_FONT_ERROR /* 27 */
    static let negative_count = CAIRO_STATUS_NEGATIVE_COUNT /* 28 */
    static let invalid_clusters = CAIRO_STATUS_INVALID_CLUSTERS /* 29 */
    static let invalid_slant = CAIRO_STATUS_INVALID_SLANT /* 30 */
    static let invalid_weight = CAIRO_STATUS_INVALID_WEIGHT /* 31 */
    static let invalid_size = CAIRO_STATUS_INVALID_SIZE /* 32 */
    static let user_font_not_implemented = CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED /* 33 */
    static let device_type_mismatch = CAIRO_STATUS_DEVICE_TYPE_MISMATCH /* 34 */
    static let device_error = CAIRO_STATUS_DEVICE_ERROR /* 35 */
    static let invalid_mesh_construction = CAIRO_STATUS_INVALID_MESH_CONSTRUCTION /* 36 */
    static let device_finished = CAIRO_STATUS_DEVICE_FINISHED /* 37 */
    static let jbig2_global_missing = CAIRO_STATUS_JBIG2_GLOBAL_MISSING /* 38 */
}

public typealias Content = cairo_content_t

public extension Content {
    static let color = CAIRO_CONTENT_COLOR /* 4096 */
    static let alpha = CAIRO_CONTENT_ALPHA /* 8192 */
    static let color_alpha = CAIRO_CONTENT_COLOR_ALPHA /* 12288 */
}

public typealias Operator = cairo_operator_t

public extension Operator {
    static let clear = CAIRO_OPERATOR_CLEAR /* 0 */
    static let source = CAIRO_OPERATOR_SOURCE /* 1 */
    static let over = CAIRO_OPERATOR_OVER /* 2 */
    static let in_ = CAIRO_OPERATOR_IN /* 3 */
    static let out = CAIRO_OPERATOR_OUT /* 4 */
    static let atop = CAIRO_OPERATOR_ATOP /* 5 */
    static let dest = CAIRO_OPERATOR_DEST /* 6 */
    static let dest_over = CAIRO_OPERATOR_DEST_OVER /* 7 */
    static let dest_in = CAIRO_OPERATOR_DEST_IN /* 8 */
    static let dest_out = CAIRO_OPERATOR_DEST_OUT /* 9 */
    static let dest_atop = CAIRO_OPERATOR_DEST_ATOP /* 10 */
    static let xor = CAIRO_OPERATOR_XOR /* 11 */
    static let add = CAIRO_OPERATOR_ADD /* 12 */
    static let saturate = CAIRO_OPERATOR_SATURATE /* 13 */
    static let multiply = CAIRO_OPERATOR_MULTIPLY /* 14 */
    static let screen = CAIRO_OPERATOR_SCREEN /* 15 */
    static let overlay = CAIRO_OPERATOR_OVERLAY /* 16 */
    static let darken = CAIRO_OPERATOR_DARKEN /* 17 */
    static let lighten = CAIRO_OPERATOR_LIGHTEN /* 18 */
    static let color_dodge = CAIRO_OPERATOR_COLOR_DODGE /* 19 */
    static let color_burn = CAIRO_OPERATOR_COLOR_BURN /* 20 */
    static let hard_light = CAIRO_OPERATOR_HARD_LIGHT /* 21 */
    static let soft_light = CAIRO_OPERATOR_SOFT_LIGHT /* 22 */
    static let difference = CAIRO_OPERATOR_DIFFERENCE /* 23 */
    static let exclusion = CAIRO_OPERATOR_EXCLUSION /* 24 */
    static let hsl_hue = CAIRO_OPERATOR_HSL_HUE /* 25 */
    static let hsl_saturation = CAIRO_OPERATOR_HSL_SATURATION /* 26 */
    static let hsl_color = CAIRO_OPERATOR_HSL_COLOR /* 27 */
    static let hsl_luminosity = CAIRO_OPERATOR_HSL_LUMINOSITY /* 28 */
}

public typealias Antialias = cairo_antialias_t

public extension Antialias {
    static let default_ = CAIRO_ANTIALIAS_DEFAULT /* 0 */
    static let none_ = CAIRO_ANTIALIAS_NONE /* 1 */
    static let gray = CAIRO_ANTIALIAS_GRAY /* 2 */
    static let subpixel = CAIRO_ANTIALIAS_SUBPIXEL /* 3 */
    static let fast = CAIRO_ANTIALIAS_FAST /* 4 */
    static let good = CAIRO_ANTIALIAS_GOOD /* 5 */
    static let best = CAIRO_ANTIALIAS_BEST /* 6 */
}

public typealias FillRule = cairo_fill_rule_t

public extension FillRule {
    static let winding = CAIRO_FILL_RULE_WINDING /* 0 */
    static let even_odd = CAIRO_FILL_RULE_EVEN_ODD /* 1 */
}

public typealias LineCap = cairo_line_cap_t

public extension LineCap {
    static let butt = CAIRO_LINE_CAP_BUTT /* 0 */
    static let round = CAIRO_LINE_CAP_ROUND /* 1 */
    static let square = CAIRO_LINE_CAP_SQUARE /* 2 */
}

public typealias LineJoin = cairo_line_join_t

public extension LineJoin {
    static let miter = CAIRO_LINE_JOIN_MITER /* 0 */
    static let round = CAIRO_LINE_JOIN_ROUND /* 1 */
    static let bevel = CAIRO_LINE_JOIN_BEVEL /* 2 */
}

public typealias TextClusterFlags = cairo_text_cluster_flags_t

public extension TextClusterFlags {
    static let backward = CAIRO_TEXT_CLUSTER_FLAG_BACKWARD /* 1 */
}

public typealias FontSlant = cairo_font_slant_t

public extension FontSlant {
    static let normal = CAIRO_FONT_SLANT_NORMAL /* 0 */
    static let italic = CAIRO_FONT_SLANT_ITALIC /* 1 */
    static let oblique = CAIRO_FONT_SLANT_OBLIQUE /* 2 */
}

public typealias FontWeight = cairo_font_weight_t

public extension FontWeight {
    static let normal = CAIRO_FONT_WEIGHT_NORMAL /* 0 */
    static let bold = CAIRO_FONT_WEIGHT_BOLD /* 1 */
}

public typealias SubpixelOrder = cairo_subpixel_order_t

public extension SubpixelOrder {
    static let default_ = CAIRO_SUBPIXEL_ORDER_DEFAULT /* 0 */
    static let rgb = CAIRO_SUBPIXEL_ORDER_RGB /* 1 */
    static let bgr = CAIRO_SUBPIXEL_ORDER_BGR /* 2 */
    static let vrgb = CAIRO_SUBPIXEL_ORDER_VRGB /* 3 */
    static let vbgr = CAIRO_SUBPIXEL_ORDER_VBGR /* 4 */
}

public typealias HintStyle = cairo_hint_style_t

public extension HintStyle {
    static let default_ = CAIRO_HINT_STYLE_DEFAULT /* 0 */
    static let none_ = CAIRO_HINT_STYLE_NONE /* 1 */
    static let slight = CAIRO_HINT_STYLE_SLIGHT /* 2 */
    static let medium = CAIRO_HINT_STYLE_MEDIUM /* 3 */
    static let full = CAIRO_HINT_STYLE_FULL /* 4 */
}

public typealias HintMetrics = cairo_hint_metrics_t

public extension HintMetrics {
    static let default_ = CAIRO_HINT_METRICS_DEFAULT /* 0 */
    static let off = CAIRO_HINT_METRICS_OFF /* 1 */
    static let on = CAIRO_HINT_METRICS_ON /* 2 */
}

public typealias FontType = cairo_font_type_t

public extension FontType {
    static let toy = CAIRO_FONT_TYPE_TOY /* 0 */
    static let ft = CAIRO_FONT_TYPE_FT /* 1 */
    static let win32 = CAIRO_FONT_TYPE_WIN32 /* 2 */
    static let quartz = CAIRO_FONT_TYPE_QUARTZ /* 3 */
    static let user = CAIRO_FONT_TYPE_USER /* 4 */
}

public typealias PathDataType = cairo_path_data_type_t

public extension PathDataType {
    static let move_to = CAIRO_PATH_MOVE_TO /* 0 */
    static let line_to = CAIRO_PATH_LINE_TO /* 1 */
    static let curve_to = CAIRO_PATH_CURVE_TO /* 2 */
    static let close_path = CAIRO_PATH_CLOSE_PATH /* 3 */
}

public typealias DeviceType = cairo_device_type_t

public extension DeviceType {
    static let drm = CAIRO_DEVICE_TYPE_DRM /* 0 */
    static let gl = CAIRO_DEVICE_TYPE_GL /* 1 */
    static let script = CAIRO_DEVICE_TYPE_SCRIPT /* 2 */
    static let xcb = CAIRO_DEVICE_TYPE_XCB /* 3 */
    static let xlib = CAIRO_DEVICE_TYPE_XLIB /* 4 */
    static let xml = CAIRO_DEVICE_TYPE_XML /* 5 */
    static let cogl = CAIRO_DEVICE_TYPE_COGL /* 6 */
    static let win32 = CAIRO_DEVICE_TYPE_WIN32 /* 7 */
    static let invalid = CAIRO_DEVICE_TYPE_INVALID /* -1 */
}

public typealias SurfaceType = cairo_surface_type_t

public extension SurfaceType {
    static let image = CAIRO_SURFACE_TYPE_IMAGE /* 0 */
    static let pdf = CAIRO_SURFACE_TYPE_PDF /* 1 */
    static let ps = CAIRO_SURFACE_TYPE_PS /* 2 */
    static let xlib = CAIRO_SURFACE_TYPE_XLIB /* 3 */
    static let xcb = CAIRO_SURFACE_TYPE_XCB /* 4 */
    static let glitz = CAIRO_SURFACE_TYPE_GLITZ /* 5 */
    static let quartz = CAIRO_SURFACE_TYPE_QUARTZ /* 6 */
    static let win32 = CAIRO_SURFACE_TYPE_WIN32 /* 7 */
    static let beos = CAIRO_SURFACE_TYPE_BEOS /* 8 */
    static let directfb = CAIRO_SURFACE_TYPE_DIRECTFB /* 9 */
    static let svg = CAIRO_SURFACE_TYPE_SVG /* 10 */
    static let os2 = CAIRO_SURFACE_TYPE_OS2 /* 11 */
    static let win32_printing = CAIRO_SURFACE_TYPE_WIN32_PRINTING /* 12 */
    static let quartz_image = CAIRO_SURFACE_TYPE_QUARTZ_IMAGE /* 13 */
    static let script = CAIRO_SURFACE_TYPE_SCRIPT /* 14 */
    static let qt = CAIRO_SURFACE_TYPE_QT /* 15 */
    static let recording = CAIRO_SURFACE_TYPE_RECORDING /* 16 */
    static let vg = CAIRO_SURFACE_TYPE_VG /* 17 */
    static let gl = CAIRO_SURFACE_TYPE_GL /* 18 */
    static let drm = CAIRO_SURFACE_TYPE_DRM /* 19 */
    static let tee = CAIRO_SURFACE_TYPE_TEE /* 20 */
    static let xml = CAIRO_SURFACE_TYPE_XML /* 21 */
    static let skia = CAIRO_SURFACE_TYPE_SKIA /* 22 */
    static let subsurface = CAIRO_SURFACE_TYPE_SUBSURFACE /* 23 */
    static let cogl = CAIRO_SURFACE_TYPE_COGL /* 24 */
}

public typealias Format = cairo_format_t

public extension Format {
    static let invalid = CAIRO_FORMAT_INVALID /* -1 */
    static let argb32 = CAIRO_FORMAT_ARGB32 /* 0 */
    static let rgb24 = CAIRO_FORMAT_RGB24 /* 1 */
    static let a8 = CAIRO_FORMAT_A8 /* 2 */
    static let a1 = CAIRO_FORMAT_A1 /* 3 */
    static let rgb16_565 = CAIRO_FORMAT_RGB16_565 /* 4 */
    static let rgb30 = CAIRO_FORMAT_RGB30 /* 5 */
}

public typealias PatternType = cairo_pattern_type_t

public extension PatternType {
    static let solid = CAIRO_PATTERN_TYPE_SOLID /* 0 */
    static let surface = CAIRO_PATTERN_TYPE_SURFACE /* 1 */
    static let linear = CAIRO_PATTERN_TYPE_LINEAR /* 2 */
    static let radial = CAIRO_PATTERN_TYPE_RADIAL /* 3 */
    static let mesh = CAIRO_PATTERN_TYPE_MESH /* 4 */
    static let raster_source = CAIRO_PATTERN_TYPE_RASTER_SOURCE /* 5 */
}

public typealias Extend = cairo_extend_t

public extension Extend {
    static let none_ = CAIRO_EXTEND_NONE /* 0 */
    static let repeat_ = CAIRO_EXTEND_REPEAT /* 1 */
    static let reflect = CAIRO_EXTEND_REFLECT /* 2 */
    static let pad = CAIRO_EXTEND_PAD /* 3 */
}

public typealias Filter = cairo_filter_t

public extension Filter {
    static let fast = CAIRO_FILTER_FAST /* 0 */
    static let good = CAIRO_FILTER_GOOD /* 1 */
    static let best = CAIRO_FILTER_BEST /* 2 */
    static let nearest = CAIRO_FILTER_NEAREST /* 3 */
    static let bilinear = CAIRO_FILTER_BILINEAR /* 4 */
    static let gaussian = CAIRO_FILTER_GAUSSIAN /* 5 */
}

public typealias RegionOverlap = cairo_region_overlap_t

public extension RegionOverlap {
    static let in_ = CAIRO_REGION_OVERLAP_IN /* 0 */
    static let out = CAIRO_REGION_OVERLAP_OUT /* 1 */
    static let part = CAIRO_REGION_OVERLAP_PART /* 2 */
}
public func imageSurfaceCreate(format: cairo_format_t, width: Int, height: Int) -> Surface {
    return Surface(cairo_image_surface_create(format, CInt(width), CInt(height)))

}



// MARK: - Context Record

/// The `ContextProtocol` protocol exposes the methods and properties of an underlying `cairo_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Context`.
/// Alternatively, use `ContextRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol ContextProtocol {
    /// Untyped pointer to the underlying `cairo_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_t> { get }
}

/// The `ContextRef` type acts as a lightweight Swift reference to an underlying `cairo_t` instance.
/// It exposes methods that can operate on this data type through `ContextProtocol` conformance.
/// Use `ContextRef` only as an `unowned` reference to an existing `cairo_t` instance.
///

public struct ContextRef: ContextProtocol {
    /// Untyped pointer to the underlying `cairo_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension ContextRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `ContextProtocol`
    init<T: ContextProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Context` type acts as an owner of an underlying `cairo_t` instance.
/// It provides the methods that can operate on this data type through `ContextProtocol` conformance.
/// Use `Context` as a strong reference or owner of a `cairo_t` instance.
///

open class Context: ContextProtocol {
    /// Untyped pointer to the underlying `cairo_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Context` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `Context` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_t>) {
        ptr = UnsafeMutableRawPointer(op)
        ref()
    }

    /// Reference intialiser for a related type that implements `ContextProtocol`
    /// `cairo_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `ContextProtocol`
    public init<T: ContextProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        ref()
    }

    /// Do-nothing destructor for`cairo_t`.
    deinit {
        unref()
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        ref()
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        ref()
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        ref()
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ContextProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        ref()
    }



}

// MARK: - no Context properties

// MARK: - no signals


public extension ContextProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_t> { return ptr.assumingMemoryBound(to: cairo_t.self) }

}



// MARK: - Device Record

/// The `DeviceProtocol` protocol exposes the methods and properties of an underlying `cairo_device_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Device`.
/// Alternatively, use `DeviceRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol DeviceProtocol {
    /// Untyped pointer to the underlying `cairo_device_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_device_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_device_t> { get }
}

/// The `DeviceRef` type acts as a lightweight Swift reference to an underlying `cairo_device_t` instance.
/// It exposes methods that can operate on this data type through `DeviceProtocol` conformance.
/// Use `DeviceRef` only as an `unowned` reference to an existing `cairo_device_t` instance.
///

public struct DeviceRef: DeviceProtocol {
    /// Untyped pointer to the underlying `cairo_device_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension DeviceRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_device_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `DeviceProtocol`
    init<T: DeviceProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Device` type acts as an owner of an underlying `cairo_device_t` instance.
/// It provides the methods that can operate on this data type through `DeviceProtocol` conformance.
/// Use `Device` as a strong reference or owner of a `cairo_device_t` instance.
///

open class Device: DeviceProtocol {
    /// Untyped pointer to the underlying `cairo_device_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Device` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_device_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_device_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `Device` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_device_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_device_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `DeviceProtocol`
    /// `cairo_device_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `DeviceProtocol`
    public init<T: DeviceProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_device_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_device_t`.
    deinit {
        // no reference counting for cairo_device_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_device_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_device_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_device_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `DeviceProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_device_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no Device properties

// MARK: - no signals


public extension DeviceProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_device_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_device_t> { return ptr.assumingMemoryBound(to: cairo_device_t.self) }

}



// MARK: - Surface Record

/// The `SurfaceProtocol` protocol exposes the methods and properties of an underlying `cairo_surface_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Surface`.
/// Alternatively, use `SurfaceRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol SurfaceProtocol {
    /// Untyped pointer to the underlying `cairo_surface_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_surface_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_surface_t> { get }
}

/// The `SurfaceRef` type acts as a lightweight Swift reference to an underlying `cairo_surface_t` instance.
/// It exposes methods that can operate on this data type through `SurfaceProtocol` conformance.
/// Use `SurfaceRef` only as an `unowned` reference to an existing `cairo_surface_t` instance.
///

public struct SurfaceRef: SurfaceProtocol {
    /// Untyped pointer to the underlying `cairo_surface_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension SurfaceRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_surface_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `SurfaceProtocol`
    init<T: SurfaceProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Surface` type acts as an owner of an underlying `cairo_surface_t` instance.
/// It provides the methods that can operate on this data type through `SurfaceProtocol` conformance.
/// Use `Surface` as a strong reference or owner of a `cairo_surface_t` instance.
///

open class Surface: SurfaceProtocol {
    /// Untyped pointer to the underlying `cairo_surface_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Surface` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_surface_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_surface_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `Surface` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_surface_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_surface_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `SurfaceProtocol`
    /// `cairo_surface_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `SurfaceProtocol`
    public init<T: SurfaceProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_surface_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_surface_t`.
    deinit {
        cairo_surface_destroy(cast(ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_surface_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_surface_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_surface_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `SurfaceProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_surface_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no Surface properties

// MARK: - no signals


public extension SurfaceProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_surface_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_surface_t> { return ptr.assumingMemoryBound(to: cairo_surface_t.self) }

}



// MARK: - Matrix Record

/// The `MatrixProtocol` protocol exposes the methods and properties of an underlying `cairo_matrix_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Matrix`.
/// Alternatively, use `MatrixRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol MatrixProtocol {
    /// Untyped pointer to the underlying `cairo_matrix_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_matrix_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_matrix_t> { get }
}

/// The `MatrixRef` type acts as a lightweight Swift reference to an underlying `cairo_matrix_t` instance.
/// It exposes methods that can operate on this data type through `MatrixProtocol` conformance.
/// Use `MatrixRef` only as an `unowned` reference to an existing `cairo_matrix_t` instance.
///

public struct MatrixRef: MatrixProtocol {
    /// Untyped pointer to the underlying `cairo_matrix_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension MatrixRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_matrix_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `MatrixProtocol`
    init<T: MatrixProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Matrix` type acts as an owner of an underlying `cairo_matrix_t` instance.
/// It provides the methods that can operate on this data type through `MatrixProtocol` conformance.
/// Use `Matrix` as a strong reference or owner of a `cairo_matrix_t` instance.
///

open class Matrix: MatrixProtocol {
    /// Untyped pointer to the underlying `cairo_matrix_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Matrix` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_matrix_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_matrix_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `Matrix` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_matrix_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_matrix_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `MatrixProtocol`
    /// `cairo_matrix_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `MatrixProtocol`
    public init<T: MatrixProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_matrix_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_matrix_t`.
    deinit {
        // no reference counting for cairo_matrix_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_matrix_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_matrix_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_matrix_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MatrixProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_matrix_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no Matrix properties

// MARK: - no signals


public extension MatrixProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_matrix_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_matrix_t> { return ptr.assumingMemoryBound(to: cairo_matrix_t.self) }

}



// MARK: - Pattern Record

/// The `PatternProtocol` protocol exposes the methods and properties of an underlying `cairo_pattern_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Pattern`.
/// Alternatively, use `PatternRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol PatternProtocol {
    /// Untyped pointer to the underlying `cairo_pattern_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_pattern_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_pattern_t> { get }
}

/// The `PatternRef` type acts as a lightweight Swift reference to an underlying `cairo_pattern_t` instance.
/// It exposes methods that can operate on this data type through `PatternProtocol` conformance.
/// Use `PatternRef` only as an `unowned` reference to an existing `cairo_pattern_t` instance.
///

public struct PatternRef: PatternProtocol {
    /// Untyped pointer to the underlying `cairo_pattern_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension PatternRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_pattern_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `PatternProtocol`
    init<T: PatternProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Pattern` type acts as an owner of an underlying `cairo_pattern_t` instance.
/// It provides the methods that can operate on this data type through `PatternProtocol` conformance.
/// Use `Pattern` as a strong reference or owner of a `cairo_pattern_t` instance.
///

open class Pattern: PatternProtocol {
    /// Untyped pointer to the underlying `cairo_pattern_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Pattern` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_pattern_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_pattern_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `Pattern` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_pattern_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_pattern_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `PatternProtocol`
    /// `cairo_pattern_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `PatternProtocol`
    public init<T: PatternProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_pattern_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_pattern_t`.
    deinit {
        // no reference counting for cairo_pattern_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_pattern_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_pattern_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_pattern_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PatternProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_pattern_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no Pattern properties

// MARK: - no signals


public extension PatternProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_pattern_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_pattern_t> { return ptr.assumingMemoryBound(to: cairo_pattern_t.self) }

}



// MARK: - Region Record

/// The `RegionProtocol` protocol exposes the methods and properties of an underlying `cairo_region_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Region`.
/// Alternatively, use `RegionRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol RegionProtocol {
    /// Untyped pointer to the underlying `cairo_region_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_region_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_region_t> { get }
}

/// The `RegionRef` type acts as a lightweight Swift reference to an underlying `cairo_region_t` instance.
/// It exposes methods that can operate on this data type through `RegionProtocol` conformance.
/// Use `RegionRef` only as an `unowned` reference to an existing `cairo_region_t` instance.
///

public struct RegionRef: RegionProtocol {
    /// Untyped pointer to the underlying `cairo_region_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension RegionRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_region_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `RegionProtocol`
    init<T: RegionProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Region` type acts as an owner of an underlying `cairo_region_t` instance.
/// It provides the methods that can operate on this data type through `RegionProtocol` conformance.
/// Use `Region` as a strong reference or owner of a `cairo_region_t` instance.
///

open class Region: RegionProtocol {
    /// Untyped pointer to the underlying `cairo_region_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Region` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_region_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_region_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `Region` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_region_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_region_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `RegionProtocol`
    /// `cairo_region_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `RegionProtocol`
    public init<T: RegionProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_region_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_region_t`.
    deinit {
        // no reference counting for cairo_region_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_region_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_region_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_region_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RegionProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_region_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no Region properties

// MARK: - no signals


public extension RegionProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_region_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_region_t> { return ptr.assumingMemoryBound(to: cairo_region_t.self) }

}



// MARK: - FontOptions Record

/// The `FontOptionsProtocol` protocol exposes the methods and properties of an underlying `cairo_font_options_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `FontOptions`.
/// Alternatively, use `FontOptionsRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol FontOptionsProtocol {
    /// Untyped pointer to the underlying `cairo_font_options_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_font_options_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_font_options_t> { get }
}

/// The `FontOptionsRef` type acts as a lightweight Swift reference to an underlying `cairo_font_options_t` instance.
/// It exposes methods that can operate on this data type through `FontOptionsProtocol` conformance.
/// Use `FontOptionsRef` only as an `unowned` reference to an existing `cairo_font_options_t` instance.
///

public struct FontOptionsRef: FontOptionsProtocol {
    /// Untyped pointer to the underlying `cairo_font_options_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension FontOptionsRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_font_options_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `FontOptionsProtocol`
    init<T: FontOptionsProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `FontOptions` type acts as an owner of an underlying `cairo_font_options_t` instance.
/// It provides the methods that can operate on this data type through `FontOptionsProtocol` conformance.
/// Use `FontOptions` as a strong reference or owner of a `cairo_font_options_t` instance.
///

open class FontOptions: FontOptionsProtocol {
    /// Untyped pointer to the underlying `cairo_font_options_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontOptions` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_font_options_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_font_options_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `FontOptions` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_font_options_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_font_options_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `FontOptionsProtocol`
    /// `cairo_font_options_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `FontOptionsProtocol`
    public init<T: FontOptionsProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_font_options_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_font_options_t`.
    deinit {
        // no reference counting for cairo_font_options_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_font_options_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_font_options_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_font_options_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontOptionsProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_font_options_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no FontOptions properties

// MARK: - no signals


public extension FontOptionsProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_font_options_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_font_options_t> { return ptr.assumingMemoryBound(to: cairo_font_options_t.self) }

}



// MARK: - FontFace Record

/// The `FontFaceProtocol` protocol exposes the methods and properties of an underlying `cairo_font_face_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `FontFace`.
/// Alternatively, use `FontFaceRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol FontFaceProtocol {
    /// Untyped pointer to the underlying `cairo_font_face_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_font_face_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_font_face_t> { get }
}

/// The `FontFaceRef` type acts as a lightweight Swift reference to an underlying `cairo_font_face_t` instance.
/// It exposes methods that can operate on this data type through `FontFaceProtocol` conformance.
/// Use `FontFaceRef` only as an `unowned` reference to an existing `cairo_font_face_t` instance.
///

public struct FontFaceRef: FontFaceProtocol {
    /// Untyped pointer to the underlying `cairo_font_face_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension FontFaceRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_font_face_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `FontFaceProtocol`
    init<T: FontFaceProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `FontFace` type acts as an owner of an underlying `cairo_font_face_t` instance.
/// It provides the methods that can operate on this data type through `FontFaceProtocol` conformance.
/// Use `FontFace` as a strong reference or owner of a `cairo_font_face_t` instance.
///

open class FontFace: FontFaceProtocol {
    /// Untyped pointer to the underlying `cairo_font_face_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `FontFace` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_font_face_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_font_face_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `FontFace` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_font_face_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_font_face_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `FontFaceProtocol`
    /// `cairo_font_face_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `FontFaceProtocol`
    public init<T: FontFaceProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_font_face_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_font_face_t`.
    deinit {
        // no reference counting for cairo_font_face_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_font_face_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_font_face_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_font_face_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `FontFaceProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_font_face_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no FontFace properties

// MARK: - no signals


public extension FontFaceProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_font_face_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_font_face_t> { return ptr.assumingMemoryBound(to: cairo_font_face_t.self) }

}



// MARK: - ScaledFont Record

/// The `ScaledFontProtocol` protocol exposes the methods and properties of an underlying `cairo_scaled_font_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `ScaledFont`.
/// Alternatively, use `ScaledFontRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol ScaledFontProtocol {
    /// Untyped pointer to the underlying `cairo_scaled_font_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_scaled_font_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_scaled_font_t> { get }
}

/// The `ScaledFontRef` type acts as a lightweight Swift reference to an underlying `cairo_scaled_font_t` instance.
/// It exposes methods that can operate on this data type through `ScaledFontProtocol` conformance.
/// Use `ScaledFontRef` only as an `unowned` reference to an existing `cairo_scaled_font_t` instance.
///

public struct ScaledFontRef: ScaledFontProtocol {
    /// Untyped pointer to the underlying `cairo_scaled_font_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension ScaledFontRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_scaled_font_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `ScaledFontProtocol`
    init<T: ScaledFontProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `ScaledFont` type acts as an owner of an underlying `cairo_scaled_font_t` instance.
/// It provides the methods that can operate on this data type through `ScaledFontProtocol` conformance.
/// Use `ScaledFont` as a strong reference or owner of a `cairo_scaled_font_t` instance.
///

open class ScaledFont: ScaledFontProtocol {
    /// Untyped pointer to the underlying `cairo_scaled_font_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `ScaledFont` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_scaled_font_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_scaled_font_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `ScaledFont` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_scaled_font_t>) {
        ptr = UnsafeMutableRawPointer(op)
        ref()
    }

    /// Reference intialiser for a related type that implements `ScaledFontProtocol`
    /// `cairo_scaled_font_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `ScaledFontProtocol`
    public init<T: ScaledFontProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        ref()
    }

    /// Do-nothing destructor for`cairo_scaled_font_t`.
    deinit {
        unref()
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        ref()
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        ref()
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        ref()
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `ScaledFontProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        ref()
    }



}

// MARK: - no ScaledFont properties

// MARK: - no signals


public extension ScaledFontProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_scaled_font_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_scaled_font_t> { return ptr.assumingMemoryBound(to: cairo_scaled_font_t.self) }

}



// MARK: - Path Record

/// The `PathProtocol` protocol exposes the methods and properties of an underlying `cairo_path_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Path`.
/// Alternatively, use `PathRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol PathProtocol {
    /// Untyped pointer to the underlying `cairo_path_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_path_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_path_t> { get }
}

/// The `PathRef` type acts as a lightweight Swift reference to an underlying `cairo_path_t` instance.
/// It exposes methods that can operate on this data type through `PathProtocol` conformance.
/// Use `PathRef` only as an `unowned` reference to an existing `cairo_path_t` instance.
///

public struct PathRef: PathProtocol {
    /// Untyped pointer to the underlying `cairo_path_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension PathRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_path_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `PathProtocol`
    init<T: PathProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Path` type acts as an owner of an underlying `cairo_path_t` instance.
/// It provides the methods that can operate on this data type through `PathProtocol` conformance.
/// Use `Path` as a strong reference or owner of a `cairo_path_t` instance.
///

open class Path: PathProtocol {
    /// Untyped pointer to the underlying `cairo_path_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Path` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_path_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_path_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `Path` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_path_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_path_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `PathProtocol`
    /// `cairo_path_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `PathProtocol`
    public init<T: PathProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_path_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_path_t`.
    deinit {
        // no reference counting for cairo_path_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_path_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_path_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_path_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `PathProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_path_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no Path properties

// MARK: - no signals


public extension PathProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_path_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_path_t> { return ptr.assumingMemoryBound(to: cairo_path_t.self) }

}



// MARK: - Rectangle Record

/// The `RectangleProtocol` protocol exposes the methods and properties of an underlying `cairo_rectangle_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `Rectangle`.
/// Alternatively, use `RectangleRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol RectangleProtocol {
    /// Untyped pointer to the underlying `cairo_rectangle_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_rectangle_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_rectangle_t> { get }
}

/// The `RectangleRef` type acts as a lightweight Swift reference to an underlying `cairo_rectangle_t` instance.
/// It exposes methods that can operate on this data type through `RectangleProtocol` conformance.
/// Use `RectangleRef` only as an `unowned` reference to an existing `cairo_rectangle_t` instance.
///

public struct RectangleRef: RectangleProtocol {
    /// Untyped pointer to the underlying `cairo_rectangle_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension RectangleRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_rectangle_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `RectangleProtocol`
    init<T: RectangleProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `Rectangle` type acts as an owner of an underlying `cairo_rectangle_t` instance.
/// It provides the methods that can operate on this data type through `RectangleProtocol` conformance.
/// Use `Rectangle` as a strong reference or owner of a `cairo_rectangle_t` instance.
///

open class Rectangle: RectangleProtocol {
    /// Untyped pointer to the underlying `cairo_rectangle_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `Rectangle` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_rectangle_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_rectangle_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `Rectangle` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_rectangle_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_rectangle_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `RectangleProtocol`
    /// `cairo_rectangle_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `RectangleProtocol`
    public init<T: RectangleProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_rectangle_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_rectangle_t`.
    deinit {
        // no reference counting for cairo_rectangle_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_rectangle_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_rectangle_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_rectangle_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_rectangle_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no Rectangle properties

// MARK: - no signals


public extension RectangleProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_rectangle_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_rectangle_t> { return ptr.assumingMemoryBound(to: cairo_rectangle_t.self) }

}



// MARK: - RectangleInt Record

/// The `RectangleIntProtocol` protocol exposes the methods and properties of an underlying `cairo_rectangle_int_t` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RectangleInt`.
/// Alternatively, use `RectangleIntRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///

public protocol RectangleIntProtocol {
    /// Untyped pointer to the underlying `cairo_rectangle_int_t` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `cairo_rectangle_int_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_rectangle_int_t> { get }
}

/// The `RectangleIntRef` type acts as a lightweight Swift reference to an underlying `cairo_rectangle_int_t` instance.
/// It exposes methods that can operate on this data type through `RectangleIntProtocol` conformance.
/// Use `RectangleIntRef` only as an `unowned` reference to an existing `cairo_rectangle_int_t` instance.
///

public struct RectangleIntRef: RectangleIntProtocol {
    /// Untyped pointer to the underlying `cairo_rectangle_int_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension RectangleIntRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<cairo_rectangle_int_t>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `RectangleIntProtocol`
    init<T: RectangleIntProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `RectangleInt` type acts as an owner of an underlying `cairo_rectangle_int_t` instance.
/// It provides the methods that can operate on this data type through `RectangleIntProtocol` conformance.
/// Use `RectangleInt` as a strong reference or owner of a `cairo_rectangle_int_t` instance.
///

open class RectangleInt: RectangleIntProtocol {
    /// Untyped pointer to the underlying `cairo_rectangle_int_t` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RectangleInt` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<cairo_rectangle_int_t>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `cairo_rectangle_int_t` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `RectangleInt` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<cairo_rectangle_int_t>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for cairo_rectangle_int_t, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `RectangleIntProtocol`
    /// `cairo_rectangle_int_t` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `RectangleIntProtocol`
    public init<T: RectangleIntProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for cairo_rectangle_int_t, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for`cairo_rectangle_int_t`.
    deinit {
        // no reference counting for cairo_rectangle_int_t, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for cairo_rectangle_int_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for cairo_rectangle_int_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for cairo_rectangle_int_t, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RectangleIntProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for cairo_rectangle_int_t, cannot ref(cast(_ptr))
    }



}

// MARK: - no RectangleInt properties

// MARK: - no signals


public extension RectangleIntProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `cairo_rectangle_int_t` instance.
    var _ptr: UnsafeMutablePointer<cairo_rectangle_int_t> { return ptr.assumingMemoryBound(to: cairo_rectangle_int_t.self) }

}


