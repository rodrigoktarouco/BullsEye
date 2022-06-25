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
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsHeaderView(game: $game)
                SliderView(sliderValue: $sliderValue).padding(.horizontal)
                HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game, roundedValue: Int(roundedValue))
            }
        }
    }
}

struct InstructionsHeaderView: View {    
    @Binding var game: Game
    
    var body: some View {
        InstructionsTextView(text: "🎯🎯🎯\nput the bulls eye as close as you can")
            .padding()
        BigtextView(text: "\(game.target)")
    }
}

struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelTextView(text: "0")
            Slider(value: $sliderValue, in: 1.0...100.0)
                .padding(.horizontal)
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
        .alert("Hello there!", isPresented: $alertIsVisible) {
            Button("Awesome!") {}
        } message: {
            let roundedValue = roundedValue
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
