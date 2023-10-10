import XCTest
@testable import MyFramework

final class MyFrameworkTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MyFramework().text, "Hello, World!")
    }
}
