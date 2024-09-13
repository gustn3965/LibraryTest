import XCTest
@testable import NetworkTest

final class NetworkTestTests: XCTestCase {

    
    func testExample() throws {
     
        
        let printer = TestPrinter()
        
        performAsyncTest {
            let result = await printer.getNumberString()
            print(result)
            
            XCTAssertTrue(result.first == "5")
        }
    }
    
    func testMain() throws {
        
        performClosureTest { expect in
            
            print("??")
            
            XCTAssert(true)
        }
    }
    
    func testMain2() async throws {
        
        performClosureTest { expect in
            
            print("??")
            
            XCTAssert(true)
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
