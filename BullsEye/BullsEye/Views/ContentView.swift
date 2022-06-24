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
        VStack {
            Text("🎯🎯🎯\nput the bulls eye as close as you can".uppercased())
                .kerning(2.0)
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
                .padding()
            Text("\(game.target)")
                .kerning(-1.0)
                .fontWeight(.black)
                .font(.largeTitle)
            HStack {
                Text("1")
                    .font(.headline)
                Slider(value: $sliderValue, in: 1.0...100.0).padding(.horizontal)
                Text("100")
                    .font(.headline)
            }.padding(.horizontal)
            Button {
                withAnimation {
                    alertIsVisible = true
                }
            } label: {
                Text("Hit me".uppercased())
                    .bold()
                    .font(.title3)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(21)
            .alert("Hello there!", isPresented: $alertIsVisible) {
                Button("Awesome!") {}
            } message: {
                let roundedValue = Int(sliderValue.rounded())
                Text("The slider's value is \(roundedValue).\n" + "You scored \(game.returnPoints(sliderValue: roundedValue)) points.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
    }
}
