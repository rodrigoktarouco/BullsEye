//
//  LeaderBoardView.swift
//  BullsEye
//
//  Created by Rodrigo Kroef Tarouco on 05/07/22.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView( leaderBoardIsShowing: $leaderBoardIsShowing)
                ScrollView {
                    VStack(spacing: 10) {
                        LabelView()
                        ForEach(game.leaderBoardEntries.indices) { indice in
                            let leaderBoardEntry = game.leaderBoardEntries[indice]
                            RowView(index: indice, score: leaderBoardEntry.points, date: leaderBoardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            LeaderBoardRoundedTextView(text: String(index))
            Spacer()
            ScoreTextView(score: score)
                .frame(maxWidth: Constants.LeaderBoard.leaderBoardScoreWidth)
            Spacer()
            DateTextView(date: date)
                .frame(maxWidth: Constants.LeaderBoard.leaderBoardDateWidth)
        }
        .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
        .background(
            RoundedRectangle(cornerRadius: .infinity).strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Environment (\.horizontalSizeClass) var horizontalSizeclass
    @Environment (\.verticalSizeClass) var verticalSizeClass
    @Binding var leaderBoardIsShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                BigBoldText(text: "Leaderboard")
                Spacer()
                Button {
                    withAnimation {
                        leaderBoardIsShowing = false
                    }
                } label: {
                    RoundedImageViewFilled(systemImage: "xmark")
                }
            }.padding(.top)
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            ButtonTextView(text: "Score").frame(width: Constants.LeaderBoard.leaderBoardScoreWidth)
            Spacer()
            ButtonTextView(text: "Date").frame(width: Constants.LeaderBoard.leaderBoardDateWidth)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private let leaderBoardIsShowing = Binding.constant(false)
    static private let game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewInterfaceOrientation(.landscapeLeft)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game).preferredColorScheme(.dark)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
