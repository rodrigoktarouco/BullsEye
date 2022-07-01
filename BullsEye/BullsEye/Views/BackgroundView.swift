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
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
                
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    var body: some View {
        HStack {
            Button {
                game.restart()
            } label: {
                RoundedImageViewStroke(systemImage: "arrow.counterclockwise")
            }
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
            BodyTextView(text: title)
            RoundedTextView(text: text)
        }
        
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(
                        RadialGradient(colors: [Color("CircleColor").opacity(opacity), Color("CircleColor").opacity(0)], center: .center, startRadius: 100, endRadius: 300),
                        style: StrokeStyle(lineWidth: 20.0)
                    )
                    .frame(width: size, height: size)
                    .padding()
            }
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
