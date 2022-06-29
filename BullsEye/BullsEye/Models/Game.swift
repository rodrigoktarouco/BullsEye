//
//  Game.swift
//  BullsEye
//
//  Created by Rodrigo Tarouco on 13/06/22.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func returnPoints(sliderValue: Int) -> Int {
        let points = 100 - abs((target - sliderValue))
        switch points {
        case 100:
            return points + 100
        case 98...99:
            return points + 50
        default:
            return points
        }
    }
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
} 
