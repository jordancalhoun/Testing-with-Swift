//
//  ThrowigTests.swift
//  TestingWithSwiftTests
//
//  Created by Jordan Calhoun on 1/9/23.
//

import XCTest



// typically, this would be on your own swift code, and imported with @testable import
enum GameError: LocalizedError {
    case notPurchased
    case notInstalled
    case parentalControlDisallowed
}
// this is added so that method 3 gives us a better description of failure
extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}

struct Game {
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlDisallowed
        } else {
            print("\(name) is OK to play!")
        }
    }
}
// end import


final class ThrowigTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    //Method 1, using do blocks like you would in swift
    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        
        do {
            try game.play()
            // this breaks the given-when-then sequence a little because there is no "then"
            XCTFail()
        } catch GameError.notPurchased {
            // this is what we expect to happen
        } catch {
            // threw an error we were expecting
            XCTFail()
        }
    }
    
    // Method 2, using builtin testing methods for throws
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        
        XCTAssertThrowsError(try game.play()) { error in
            // as? is typecasting the error as type GameError
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        
        XCTAssertNoThrow(try game.play())
    }
    
    // Method 3, Making the test itself throw, these are only good for tests that shouldn't throw to pass.
    func testCrashyPlaneDoesntThrow() throws {
        let game = Game(name: "CrashyPlane")
        try game.play()
    }
    
    // practive writting a function
    func testDeadStormRisingThrows() {
        let game = Game(name: "Dead Storm Rising")

        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.parentalControlDisallowed)
        }
    }

}
