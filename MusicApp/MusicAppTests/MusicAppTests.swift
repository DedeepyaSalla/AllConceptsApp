//
//  MusicAppTests.swift
//  MusicAppTests
//
//  Created by dedeepya reddy salla on 12/05/23.
//

import XCTest
@testable import MusicApp

final class MusicAppTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        
    }
    
    lazy var testData: [Int] = {
        return (0..<123456789).map { Int($0) }
    }()
    
    func testForEachLoop() {
        measure {
            var evenNumbers: [Int] = []
            evenNumbers = testData.filter { number in number % 2 == 0}
            //.forEach { number in evenNumbers.append(number) }
        }
    }
    
    func testForLoop() {
        measure {
            var evenNumbers: [Int] = []
            for number in testData {
                if number % 2 == 0 {
                    evenNumbers.append(number)
                }
            }
        }
    }
    
    func test_Finalfunction() {
        let greetings = Greetings()
        self.measure {
            for i in 0...10000 {
                //print("count--", i)
                _ = greetings.finalFunction(x: 10)
            }
        }
    }
    
    func test_NonFinalfunction() {
        let greetings = Greetings()
        self.measure {
            for i in 0...100000 {
                //print("count--", i)
                _ = greetings.notFinalFunction(x: 10)
            }
        }
    }
    
    func test_printFunction() {
        let greetings = Greetings()
        self.measure {
            for i in 0...100000 {
                _ = greetings.printFunction(x: 10)
            }
        }
    }
    
    func test_TDD() {
        let greetings = Greetings()
        
        let val1 = greetings.greetMsg(firstName: nil, lastName: nil)
        XCTAssertNil(val1)
        //return firstname
        let val2 = greetings.greetMsg(firstName: "firstName", lastName: nil)
        XCTAssertEqual(val2, "Hi firstName")
        //return lastname
        let val3 = greetings.greetMsg(firstName: nil, lastName: "lastName")
        XCTAssertEqual(val3, "Hello lastName")
        //return two names
        let val4 = greetings.greetMsg(firstName: "fisrtName", lastName: "lastName")
        XCTAssertEqual(val4, "Good to see you fisrtName lastName")
        
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
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
