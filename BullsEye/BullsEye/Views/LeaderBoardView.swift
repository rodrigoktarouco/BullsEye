//
//  LeaderBoardView.swift
//  BullsEye
//
//  Created by Rodrigo Kroef Tarouco on 05/07/22.
//

import SwiftUI

struct LeaderBoardView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            RowView()
        }
    }
}

struct RowView: View {
    var body: some View {
        HStack {
            LeaderBoardRoundedTextView(text: "1").padding(.horizontal, 0)
            Spacer()
            LeaderBoardTextView(text: "DOG")
            Spacer()
            LeaderBoardTextView(text: "459")
            Spacer()
            LeaderBoardTextView(text: "4")
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedCornerRadius ).strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
        )
    }
}

struct LeaderBoardRoundedTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
            .kerning(-0.2)
            .frame(width: Constants.General.roundedViewWidth, height: Constants.General.roundedViewHeight)
            .background(
                Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct LeaderBoardTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("FontColor"))
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
