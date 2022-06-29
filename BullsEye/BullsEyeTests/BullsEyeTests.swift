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
    
    func testeNewRound() {
        game?.startNewRound(points: 100)
        XCTAssertEqual(game?.score, 100)
        XCTAssertEqual(game?.round, 2)
    }
    
    func testScoreExact() {
        let guess = game!.target
        let score = game!.returnPoints(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() {
        let guess = game!.target + 2
        let score = game!.returnPoints(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testeRestart() {
        game?.startNewRound(points: 100)
        XCTAssertNotEqual(game?.score, 0)
        XCTAssertNotEqual(game?.round, 1)
        game?.restart()
        XCTAssertEqual(game?.score, 0)
        XCTAssertEqual(game?.round, 1)
        
    }

}
