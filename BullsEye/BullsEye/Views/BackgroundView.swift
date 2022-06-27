//
//  BackgroundView.swift
//  BullsEye
//
//  Created by Rodrigo Kroef Tarouco on 27/06/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView()
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
        )
    }
}

struct TopView: View {
    var body: some View {
        HStack {
            RoundedImageViewStroke(systemImage: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemImage: "list.dash")
            
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            FooterInfoView(title: "Score", text: String(game.score))
            Spacer()
            FooterInfoView(title: "Round", text: String(game.round))
        }
    }
}

struct FooterInfoView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            LabelTextView(text: title)
            RoundedTextView(text: text)
        }
        
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
