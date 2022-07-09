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
    var leaderBoardEntries = [LeaderBoardEntry]()
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderBoardEntries.append(LeaderBoardEntry(points: 100, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(points: 34, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(points: 53, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(points: 34, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(points: 34, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(points: 76, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(points: 89, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(points: 12, date: Date()))
        }
    }
    
    
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
        addToLeaderBoard(points: points)
    }
    
    mutating func addToLeaderBoard(points: Int) {
        leaderBoardEntries.append(LeaderBoardEntry(points: points, date: Date()))
        leaderBoardEntries.sort { $0.points > $1.points }
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
} 
