//
//  PointsView.swift
//  BullsEye
//
//  Created by Rodrigo Kroef Tarouco on 02/07/22.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.returnPoints(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            InstructionsTextView(text: "The Slider's value is")
            BigtextView(text: "\(roundedValue)")
            BodyTextView(text: "\(points)")
            Button {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            } label: {
                ButtonAlertTextView(text: "Start a new round.")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundedCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(999.0)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewInterfaceOrientation(.landscapeLeft)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game).preferredColorScheme(.dark)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
