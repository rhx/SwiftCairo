import CGLib
import CCairo
import GLib
import GLibObject
import GIO
import GModule
public typealias Status = cairo_status_t


public extension Status {
    /// Cast constructor, converting any binary integer to a
    /// `Status`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToStatusInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToStatusInt(raw))
    }
    static let success = CAIRO_STATUS_SUCCESS // 0

    static let noMemory = CAIRO_STATUS_NO_MEMORY // 1

    static let invalidRestore = CAIRO_STATUS_INVALID_RESTORE // 2

    static let invalidPopGroup = CAIRO_STATUS_INVALID_POP_GROUP // 3

    static let noCurrentPoint = CAIRO_STATUS_NO_CURRENT_POINT // 4

    static let invalidMatrix = CAIRO_STATUS_INVALID_MATRIX // 5

    static let invalidStatus = CAIRO_STATUS_INVALID_STATUS // 6

    static let nullPointer = CAIRO_STATUS_NULL_POINTER // 7

    static let invalidString = CAIRO_STATUS_INVALID_STRING // 8

    static let invalidPathData = CAIRO_STATUS_INVALID_PATH_DATA // 9

    static let readError = CAIRO_STATUS_READ_ERROR // 10

    static let writeError = CAIRO_STATUS_WRITE_ERROR // 11

    static let surfaceFinished = CAIRO_STATUS_SURFACE_FINISHED // 12

    static let surfaceTypeMismatch = CAIRO_STATUS_SURFACE_TYPE_MISMATCH // 13

    static let patternTypeMismatch = CAIRO_STATUS_PATTERN_TYPE_MISMATCH // 14

    static let invalidContent = CAIRO_STATUS_INVALID_CONTENT // 15

    static let invalidFormat = CAIRO_STATUS_INVALID_FORMAT // 16

    static let invalidVisual = CAIRO_STATUS_INVALID_VISUAL // 17

    static let fileNotFound = CAIRO_STATUS_FILE_NOT_FOUND // 18

    static let invalidDash = CAIRO_STATUS_INVALID_DASH // 19

    static let invalidDSCComment = CAIRO_STATUS_INVALID_DSC_COMMENT // 20

    static let invalidIndex = CAIRO_STATUS_INVALID_INDEX // 21

    static let clipNotRepresentable = CAIRO_STATUS_CLIP_NOT_REPRESENTABLE // 22

    static let tempFileError = CAIRO_STATUS_TEMP_FILE_ERROR // 23

    static let invalidStride = CAIRO_STATUS_INVALID_STRIDE // 24

    static let fontTypeMismatch = CAIRO_STATUS_FONT_TYPE_MISMATCH // 25

    static let userFontImmutable = CAIRO_STATUS_USER_FONT_IMMUTABLE // 26

    static let userFontError = CAIRO_STATUS_USER_FONT_ERROR // 27

    static let negativeCount = CAIRO_STATUS_NEGATIVE_COUNT // 28

    static let invalidClusters = CAIRO_STATUS_INVALID_CLUSTERS // 29

    static let invalidSlant = CAIRO_STATUS_INVALID_SLANT // 30

    static let invalidWeight = CAIRO_STATUS_INVALID_WEIGHT // 31

    static let invalidSize = CAIRO_STATUS_INVALID_SIZE // 32

    static let userFontNotImplemented = CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED // 33

    static let deviceTypeMismatch = CAIRO_STATUS_DEVICE_TYPE_MISMATCH // 34

    static let deviceError = CAIRO_STATUS_DEVICE_ERROR // 35

    static let invalidMeshConstruction = CAIRO_STATUS_INVALID_MESH_CONSTRUCTION // 36

    static let deviceFinished = CAIRO_STATUS_DEVICE_FINISHED // 37

    static let jbig2GlobalMissing = CAIRO_STATUS_JBIG2_GLOBAL_MISSING // 38

}



public typealias Content = cairo_content_t


public extension Content {
    /// Cast constructor, converting any binary integer to a
    /// `Content`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToContentInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToContentInt(raw))
    }
    static let color = CAIRO_CONTENT_COLOR // 4096

    static let alpha = CAIRO_CONTENT_ALPHA // 8192

    static let colorAlpha = CAIRO_CONTENT_COLOR_ALPHA // 12288

}



public typealias Operator = cairo_operator_t


public extension Operator {
    /// Cast constructor, converting any binary integer to a
    /// `Operator`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToOperatorInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToOperatorInt(raw))
    }
    static let clear = CAIRO_OPERATOR_CLEAR // 0

    static let source = CAIRO_OPERATOR_SOURCE // 1

    static let over = CAIRO_OPERATOR_OVER // 2

    static let `in` = CAIRO_OPERATOR_IN // 3

    static let out = CAIRO_OPERATOR_OUT // 4

    static let atop = CAIRO_OPERATOR_ATOP // 5

    static let dest = CAIRO_OPERATOR_DEST // 6

    static let destOver = CAIRO_OPERATOR_DEST_OVER // 7

    static let destIn = CAIRO_OPERATOR_DEST_IN // 8

    static let destOut = CAIRO_OPERATOR_DEST_OUT // 9

    static let destAtop = CAIRO_OPERATOR_DEST_ATOP // 10

    static let xor = CAIRO_OPERATOR_XOR // 11

    static let add = CAIRO_OPERATOR_ADD // 12

    static let saturate = CAIRO_OPERATOR_SATURATE // 13

    static let multiply = CAIRO_OPERATOR_MULTIPLY // 14

    static let screen = CAIRO_OPERATOR_SCREEN // 15

    static let overlay = CAIRO_OPERATOR_OVERLAY // 16

    static let darken = CAIRO_OPERATOR_DARKEN // 17

    static let lighten = CAIRO_OPERATOR_LIGHTEN // 18

    static let colorDodge = CAIRO_OPERATOR_COLOR_DODGE // 19

    static let colorBurn = CAIRO_OPERATOR_COLOR_BURN // 20

    static let hardLight = CAIRO_OPERATOR_HARD_LIGHT // 21

    static let softLight = CAIRO_OPERATOR_SOFT_LIGHT // 22

    static let difference = CAIRO_OPERATOR_DIFFERENCE // 23

    static let exclusion = CAIRO_OPERATOR_EXCLUSION // 24

    static let hslHue = CAIRO_OPERATOR_HSL_HUE // 25

    static let hslSaturation = CAIRO_OPERATOR_HSL_SATURATION // 26

    static let hslColor = CAIRO_OPERATOR_HSL_COLOR // 27

    static let hslLuminosity = CAIRO_OPERATOR_HSL_LUMINOSITY // 28

}



public typealias Antialias = cairo_antialias_t


public extension Antialias {
    /// Cast constructor, converting any binary integer to a
    /// `Antialias`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToAntialiasInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToAntialiasInt(raw))
    }
    static let `default` = CAIRO_ANTIALIAS_DEFAULT // 0

    static let `none` = 1

    static let gray = CAIRO_ANTIALIAS_GRAY // 2

    static let subpixel = CAIRO_ANTIALIAS_SUBPIXEL // 3

    static let fast = CAIRO_ANTIALIAS_FAST // 4

    static let good = CAIRO_ANTIALIAS_GOOD // 5

    static let best = CAIRO_ANTIALIAS_BEST // 6

}



public typealias FillRule = cairo_fill_rule_t


public extension FillRule {
    /// Cast constructor, converting any binary integer to a
    /// `FillRule`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFillRuleInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFillRuleInt(raw))
    }
    static let winding = CAIRO_FILL_RULE_WINDING // 0

    static let evenOdd = CAIRO_FILL_RULE_EVEN_ODD // 1

}



public typealias LineCap = cairo_line_cap_t


public extension LineCap {
    /// Cast constructor, converting any binary integer to a
    /// `LineCap`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToLineCapInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToLineCapInt(raw))
    }
    static let butt = CAIRO_LINE_CAP_BUTT // 0

    static let round = CAIRO_LINE_CAP_ROUND // 1

    static let square = CAIRO_LINE_CAP_SQUARE // 2

}



public typealias LineJoin = cairo_line_join_t


public extension LineJoin {
    /// Cast constructor, converting any binary integer to a
    /// `LineJoin`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToLineJoinInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToLineJoinInt(raw))
    }
    static let miter = CAIRO_LINE_JOIN_MITER // 0

    static let round = CAIRO_LINE_JOIN_ROUND // 1

    static let bevel = CAIRO_LINE_JOIN_BEVEL // 2

}



public typealias TextClusterFlags = cairo_text_cluster_flags_t


public extension TextClusterFlags {
    /// Cast constructor, converting any binary integer to a
    /// `TextClusterFlags`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToTextClusterFlagsInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToTextClusterFlagsInt(raw))
    }
    static let backward = CAIRO_TEXT_CLUSTER_FLAG_BACKWARD // 1

}



public typealias FontSlant = cairo_font_slant_t


public extension FontSlant {
    /// Cast constructor, converting any binary integer to a
    /// `FontSlant`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFontSlantInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFontSlantInt(raw))
    }
    static let normal = CAIRO_FONT_SLANT_NORMAL // 0

    static let italic = CAIRO_FONT_SLANT_ITALIC // 1

    static let oblique = CAIRO_FONT_SLANT_OBLIQUE // 2

}



public typealias FontWeight = cairo_font_weight_t


public extension FontWeight {
    /// Cast constructor, converting any binary integer to a
    /// `FontWeight`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFontWeightInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFontWeightInt(raw))
    }
    static let normal = CAIRO_FONT_WEIGHT_NORMAL // 0

    static let bold = CAIRO_FONT_WEIGHT_BOLD // 1

}



public typealias SubpixelOrder = cairo_subpixel_order_t


public extension SubpixelOrder {
    /// Cast constructor, converting any binary integer to a
    /// `SubpixelOrder`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToSubpixelOrderInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToSubpixelOrderInt(raw))
    }
    static let `default` = CAIRO_SUBPIXEL_ORDER_DEFAULT // 0

    static let rgb = CAIRO_SUBPIXEL_ORDER_RGB // 1

    static let bgr = CAIRO_SUBPIXEL_ORDER_BGR // 2

    static let vrgb = CAIRO_SUBPIXEL_ORDER_VRGB // 3

    static let vbgr = CAIRO_SUBPIXEL_ORDER_VBGR // 4

}



public typealias HintStyle = cairo_hint_style_t


public extension HintStyle {
    /// Cast constructor, converting any binary integer to a
    /// `HintStyle`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToHintStyleInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToHintStyleInt(raw))
    }
    static let `default` = CAIRO_HINT_STYLE_DEFAULT // 0

    static let `none` = 1

    static let slight = CAIRO_HINT_STYLE_SLIGHT // 2

    static let medium = CAIRO_HINT_STYLE_MEDIUM // 3

    static let full = CAIRO_HINT_STYLE_FULL // 4

}



public typealias HintMetrics = cairo_hint_metrics_t


public extension HintMetrics {
    /// Cast constructor, converting any binary integer to a
    /// `HintMetrics`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToHintMetricsInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToHintMetricsInt(raw))
    }
    static let `default` = CAIRO_HINT_METRICS_DEFAULT // 0

    static let off = CAIRO_HINT_METRICS_OFF // 1

    static let on = CAIRO_HINT_METRICS_ON // 2

}



public typealias FontType = cairo_font_type_t


public extension FontType {
    /// Cast constructor, converting any binary integer to a
    /// `FontType`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFontTypeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFontTypeInt(raw))
    }
    static let toy = CAIRO_FONT_TYPE_TOY // 0

    static let ft = CAIRO_FONT_TYPE_FT // 1

    static let win32 = CAIRO_FONT_TYPE_WIN32 // 2

    static let quartz = CAIRO_FONT_TYPE_QUARTZ // 3

    static let user = CAIRO_FONT_TYPE_USER // 4

}



public typealias PathDataType = cairo_path_data_type_t


public extension PathDataType {
    /// Cast constructor, converting any binary integer to a
    /// `PathDataType`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToPathDataTypeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToPathDataTypeInt(raw))
    }
    static let moveTo = CAIRO_PATH_MOVE_TO // 0

    static let lineTo = CAIRO_PATH_LINE_TO // 1

    static let curveTo = CAIRO_PATH_CURVE_TO // 2

    static let closePath = CAIRO_PATH_CLOSE_PATH // 3

}



public typealias DeviceType = cairo_device_type_t


public extension DeviceType {
    /// Cast constructor, converting any binary integer to a
    /// `DeviceType`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToDeviceTypeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToDeviceTypeInt(raw))
    }
    static let drm = CAIRO_DEVICE_TYPE_DRM // 0

    static let gl = CAIRO_DEVICE_TYPE_GL // 1

    static let script = CAIRO_DEVICE_TYPE_SCRIPT // 2

    static let xcb = CAIRO_DEVICE_TYPE_XCB // 3

    static let xlib = CAIRO_DEVICE_TYPE_XLIB // 4

    static let xml = CAIRO_DEVICE_TYPE_XML // 5

    static let cogl = CAIRO_DEVICE_TYPE_COGL // 6

    static let win32 = CAIRO_DEVICE_TYPE_WIN32 // 7

    static let invalid = CAIRO_DEVICE_TYPE_INVALID // -1

}



public typealias SurfaceType = cairo_surface_type_t


public extension SurfaceType {
    /// Cast constructor, converting any binary integer to a
    /// `SurfaceType`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToSurfaceTypeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToSurfaceTypeInt(raw))
    }
    static let image = CAIRO_SURFACE_TYPE_IMAGE // 0

    static let pdf = CAIRO_SURFACE_TYPE_PDF // 1

    static let ps = CAIRO_SURFACE_TYPE_PS // 2

    static let xlib = CAIRO_SURFACE_TYPE_XLIB // 3

    static let xcb = CAIRO_SURFACE_TYPE_XCB // 4

    static let glitz = CAIRO_SURFACE_TYPE_GLITZ // 5

    static let quartz = CAIRO_SURFACE_TYPE_QUARTZ // 6

    static let win32 = CAIRO_SURFACE_TYPE_WIN32 // 7

    static let beos = CAIRO_SURFACE_TYPE_BEOS // 8

    static let directfb = CAIRO_SURFACE_TYPE_DIRECTFB // 9

    static let svg = CAIRO_SURFACE_TYPE_SVG // 10

    static let os2 = CAIRO_SURFACE_TYPE_OS2 // 11

    static let win32Printing = CAIRO_SURFACE_TYPE_WIN32_PRINTING // 12

    static let quartzImage = CAIRO_SURFACE_TYPE_QUARTZ_IMAGE // 13

    static let script = CAIRO_SURFACE_TYPE_SCRIPT // 14

    static let qt = CAIRO_SURFACE_TYPE_QT // 15

    static let recording = CAIRO_SURFACE_TYPE_RECORDING // 16

    static let vg = CAIRO_SURFACE_TYPE_VG // 17

    static let gl = CAIRO_SURFACE_TYPE_GL // 18

    static let drm = CAIRO_SURFACE_TYPE_DRM // 19

    static let tee = CAIRO_SURFACE_TYPE_TEE // 20

    static let xml = CAIRO_SURFACE_TYPE_XML // 21

    static let skia = CAIRO_SURFACE_TYPE_SKIA // 22

    static let subsurface = CAIRO_SURFACE_TYPE_SUBSURFACE // 23

    static let cogl = CAIRO_SURFACE_TYPE_COGL // 24

}



public typealias Format = cairo_format_t


public extension Format {
    /// Cast constructor, converting any binary integer to a
    /// `Format`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFormatInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFormatInt(raw))
    }
    static let invalid = CAIRO_FORMAT_INVALID // -1

    static let argb32 = CAIRO_FORMAT_ARGB32 // 0

    static let rgb24 = CAIRO_FORMAT_RGB24 // 1

    static let a8 = CAIRO_FORMAT_A8 // 2

    static let a1 = CAIRO_FORMAT_A1 // 3

    static let rgb16565 = CAIRO_FORMAT_RGB16_565 // 4

    static let rgb30 = CAIRO_FORMAT_RGB30 // 5

}



public typealias PatternType = cairo_pattern_type_t


public extension PatternType {
    /// Cast constructor, converting any binary integer to a
    /// `PatternType`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToPatternTypeInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToPatternTypeInt(raw))
    }
    static let solid = CAIRO_PATTERN_TYPE_SOLID // 0

    static let surface = CAIRO_PATTERN_TYPE_SURFACE // 1

    static let linear = CAIRO_PATTERN_TYPE_LINEAR // 2

    static let radial = CAIRO_PATTERN_TYPE_RADIAL // 3

    static let mesh = CAIRO_PATTERN_TYPE_MESH // 4

    static let rasterSource = CAIRO_PATTERN_TYPE_RASTER_SOURCE // 5

}



public typealias Extend = cairo_extend_t


public extension Extend {
    /// Cast constructor, converting any binary integer to a
    /// `Extend`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToExtendInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToExtendInt(raw))
    }
    static let `none` = 0

    static let `repeat` = CAIRO_EXTEND_REPEAT // 1

    static let reflect = CAIRO_EXTEND_REFLECT // 2

    static let pad = CAIRO_EXTEND_PAD // 3

}



public typealias Filter = cairo_filter_t


public extension Filter {
    /// Cast constructor, converting any binary integer to a
    /// `Filter`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToFilterInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToFilterInt(raw))
    }
    static let fast = CAIRO_FILTER_FAST // 0

    static let good = CAIRO_FILTER_GOOD // 1

    static let best = CAIRO_FILTER_BEST // 2

    static let nearest = CAIRO_FILTER_NEAREST // 3

    static let bilinear = CAIRO_FILTER_BILINEAR // 4

    static let gaussian = CAIRO_FILTER_GAUSSIAN // 5

}



public typealias RegionOverlap = cairo_region_overlap_t


public extension RegionOverlap {
    /// Cast constructor, converting any binary integer to a
    /// `RegionOverlap`.
    /// - Parameter raw: The raw integer value to initialise the enum from
    @inlinable init!<I: BinaryInteger>(_ raw: I) {
        func castToRegionOverlapInt<I: BinaryInteger, J: BinaryInteger>(_ param: I) -> J { J(param) }
        self.init(rawValue: castToRegionOverlapInt(raw))
    }
    static let `in` = CAIRO_REGION_OVERLAP_IN // 0

    static let out = CAIRO_REGION_OVERLAP_OUT // 1

    static let part = CAIRO_REGION_OVERLAP_PART // 2

}

