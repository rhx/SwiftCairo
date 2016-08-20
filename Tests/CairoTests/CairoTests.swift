import XCTest
import CCairo
@testable import Cairo

class CairoTests: XCTestCase {

    func testSurface() {
        let width = 320
        let height = 240
        let surface = imageSurfaceCreate(format: CAIRO_FORMAT_ARGB32, width: width, height: height)
        XCTAssertEqual(cairo_image_surface_get_width(surface.ptr), CInt(width))
        XCTAssertEqual(cairo_image_surface_get_height(surface.ptr), CInt(height))
        XCTAssertEqual(cairo_image_surface_get_stride(surface.ptr), CInt(width*4))
    }

}
extension CairoTests {
    static var allTests : [(String, (CairoTests) -> () throws -> Void)] {
        return [
            ("testSurface", testSurface),
        ]
    }
}
