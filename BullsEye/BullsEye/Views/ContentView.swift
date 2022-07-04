//
//  ContentView.swift
//  BullsEye
//
//  Created by Rodrigo Tarouco on 11/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
       ZStack {
         BackgroundView(game: $game)
         VStack {
           InstructionsHeaderView(game: $game)
             .padding(.bottom, alertIsVisible ? 0 : 100)
           if alertIsVisible {
               PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                   .transition(.scale)
           } else {
               HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game).transition(.scale)
           }
         }
         if !alertIsVisible {
             SliderView(sliderValue: $sliderValue)
                 .transition(.scale)
         }
       }
     }
   }

struct InstructionsHeaderView: View {    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionsTextView(text: "🎯🎯🎯\nput the bulls eye as close as you can to")
                .padding(.leading, 30)
                .padding(.trailing, 30)
            BigtextView(text: "\(game.target)")
        }
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelTextView(text: "0")
            Slider(value: $sliderValue, in: 1.0...100.0)
                .foregroundColor(Color("FontColor"))
            SliderLabelTextView(text: "100")
        }
        .padding()
    }
}

struct HitMeButtonView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        Button {
            withAnimation {
                alertIsVisible = true
            }
        } label: {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
                .foregroundColor(Color("FontColor"))
        }
        .padding()
        .background(
            ZStack {
                Color("ButtonBackgroundColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(30), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
        .foregroundColor(.white)
        .cornerRadius(21)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView().preferredColorScheme(.dark)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
        
    }
}
