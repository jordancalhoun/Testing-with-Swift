//
//  ConverterTests.swift
//  TestingWithSwiftTests
//
//  Created by Jordan Calhoun on 1/2/23.
//

import XCTest
@testable import TestingWithSwift
final class ConverterTests: XCTestCase {
    var sut: Converter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Converter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // this test is testing two things at the same time, which is a bad idea.
    func BADEXAMPLE_testFahrenheigtToCelsius() {
        // given
        let sut = Converter()
        let input1 = 32.0
        let output1 = sut.convertToCelsius(fahrenheit: input1)
        
        // when
        let input2 = 212.0
        let output2 = sut.convertToCelsius(fahrenheit: input2)
        
        // then
        XCTAssertEqual(output1, 0)
        XCTAssertEqual(output2, 100)
    }
    
    func test32FahrenheitIsZeroCelsius() {
        //given
        let input = 32.0
        
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        
        // then
        XCTAssertEqual(celsius, 0, accuracy: 0.000001)
    }
    
    func test212FahrenheihtIs100Celsius() {
        // given
        let input = 212.0
        
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        
        // then
        XCTAssertEqual(celsius, 100, accuracy: 0.000001)
    }

}
