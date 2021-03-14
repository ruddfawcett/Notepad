import Notepad
import XCTest

class ThemeTests: XCTestCase {
  func testBuiltinBundleResources() {
    for builtin in Theme.BuiltIn.allCases {
        XCTAssertNotNil(builtin.theme())
    }
  }
}
