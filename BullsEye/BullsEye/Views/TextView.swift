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
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionsTextView(text: "Instructions")
            BigtextView(text: "999")
        }
    }
}
