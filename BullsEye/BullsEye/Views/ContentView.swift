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
        let roundedValue = sliderValue.rounded()
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsHeaderView(game: $game).padding(.bottom, 100)
                HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game, roundedValue: Int(roundedValue))
            }
            SliderView(sliderValue: $sliderValue)
        }
    }
}

struct InstructionsHeaderView: View {    
    @Binding var game: Game
    
    var body: some View {
        VStack(spacing: 8) {
        InstructionsTextView(text: "🎯🎯🎯\nput the bulls eye as close as you can")
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
    }
}

struct HitMeButtonView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var roundedValue: Int
    
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
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 3.0)
        )
        .alert("Hello there!", isPresented: $alertIsVisible) {
            Button("Awesome!") {
                let roundedValue = roundedValue
                let points = game.returnPoints(sliderValue: roundedValue)
                game.startNewRound(points: points)
            }
        } message: {
            Text("The slider's value is \(roundedValue).\n" + "You scored \(game.returnPoints(sliderValue: roundedValue)) points.")
        }
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
