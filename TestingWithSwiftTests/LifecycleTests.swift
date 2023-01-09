//
//  LifecycleTests.swift
//  TestingWithSwiftTests
//
//  Created by Jordan Calhoun on 1/9/23.
//

import XCTest

final class LifecycleTests: XCTestCase {
    
    override class func setUp() {
        print("in class setup")
    }
    
    override class func tearDown() {
        print("in class teardown")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("in setup")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("in tear down")
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        print("Starting test.")
        
        addTeardownBlock {
            print("In first tearDown block.")
        }
        
        print("In middle of test.")

        addTeardownBlock {
            print("in the secon tearDown Block")
        }
        
        print("Finishing test")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
