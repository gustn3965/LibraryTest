import XCTest
//@testable import NetworkAppTest
@testable import NetworkLibrary

final class NetworkAppTestTests: XCTestCase {
    func testExample() throws {
     
        
        let printer = Printer()
        
        performAsyncTest {
            let result = await printer.getNumberString()
            print(result)
            
            XCTAssertTrue(result.first == "5")
        }
    }
}


extension XCTestCase {
    func performAsyncTest(testBlock: @escaping () async -> Void) {
        let expectation = self.expectation(description: "Async test")
        
        Task {
            await testBlock()
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func performClosureTest(testBlock: @escaping (XCTestExpectation) -> Void) {
        let expectation = self.expectation(description: "Async test")
        testBlock(expectation)
        waitForExpectations(timeout: 5, handler: nil)
    }
}
