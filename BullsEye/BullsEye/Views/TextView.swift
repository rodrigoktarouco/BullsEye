//
//  TextView.swift
//  BullsEye
//
//  Created by Rodrigo Kroef Tarouco on 25/06/22.
//

import SwiftUI

struct InstructionsTextView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .foregroundColor(Color("FontColor"))
    }
}

struct BigtextView: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .fontWeight(.black)
            .font(.largeTitle)
    }
}

struct SliderLabelTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(Color("FontColor"))
            .frame(width: 35.0)
    }
}

struct ButtonTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("FontColor"))
            .font(.caption)
            .fontWeight(.bold)
            .kerning(1.5)
    }
}


struct BodyTextView: View {
    var text: String
    
    var body: some View {
        Text("You scored \(text)\n 🎉🎉🎉")
            .font(.subheadline)
            .foregroundColor(Color("FontColor"))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(16)
    }
}

struct ButtonAlertTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color("AccentColor")
            )
            .cornerRadius(12)
    }
}

struct ScoreTextView: View {
    var score: Int
    
    var body: some View {
        Text((String(score)))
            .font(.title2)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("FontColor"))
    }
}

struct DateTextView: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .font(.title2)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("FontColor"))
            
    }
}

struct BigBoldText: View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(2.0)
            .foregroundColor(Color("FontColor"))
            .fontWeight(.black)
            .font(.title)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionsTextView(text: "Instructions")
            BigtextView(text: "999")
            BodyTextView(text: "200")
            ButtonAlertTextView(text: "Start new Round")
            ScoreTextView(score: 450)
            DateTextView(date: Date())
            BigBoldText(text: "Leaderboard")
        }.padding()
    }
}
