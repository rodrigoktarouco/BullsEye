//
//  LeaderBoardView.swift
//  BullsEye
//
//  Created by Rodrigo Kroef Tarouco on 05/07/22.
//

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView()
                LabelView()
                RowView(index: 1, score: 459, date: Date())
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
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                BigBoldText(text: "Leaderboard")
                Spacer()
                Button {
                    
                } label: {
                    RoundedImageViewFilled(systemImage: "xmark")
                }
            }.padding()
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
    static var previews: some View {
        LeaderBoardView()
        LeaderBoardView()
            .previewInterfaceOrientation(.landscapeLeft)
        LeaderBoardView().preferredColorScheme(.dark)
        LeaderBoardView()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
