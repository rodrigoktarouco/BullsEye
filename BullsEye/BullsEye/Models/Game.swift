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
        return points
    }
} 
