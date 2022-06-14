//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Rodrigo Tarouco on 14/06/22.
//

import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
    
    var game = Game?.self(Game())

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let guess = game!.target + 5
        let score = game!.returnPoints(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game!.target - 5
        let score = game!.returnPoints(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
