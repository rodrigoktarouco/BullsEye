//
//  RoundedViews.swift
//  BullsEye
//
//  Created by Rodrigo Kroef Tarouco on 26/06/22.
//

import SwiftUI

struct RoundedImageViewStroke: View {
    
    var systemImage: String
    
    var body: some View {
        Image(systemName: systemImage)
            .font(.title)
            .foregroundColor(Color("FontColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemImage: String
    
    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .font(.title)
                .foregroundColor(Color("ButtonFilledTextColor"))
                .frame(width: 56, height: 56)
                .background(
                    Circle().fill(Color("ButtonFilledBackgroundColor"))
            )
            
        }
    }
}

struct RoundedTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title2)
            .bold()
            .kerning(-0.2)
            .frame(width: 68.0, height: 56.0)
            .overlay(
                RoundedRectangle(cornerRadius: 21).strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
                   
                    
            )
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
            RoundedImageViewStroke(systemImage: "list.dash")
            RoundedImageViewStroke(systemImage: "list.dash").preferredColorScheme(.dark)
            RoundedImageViewStroke(systemImage: "arrow.counterclockwise")
            RoundedImageViewStroke(systemImage: "arrow.counterclockwise").preferredColorScheme(.dark)
            RoundedImageViewFilled(systemImage: "list.dash")
        RoundedImageViewFilled(systemImage: "list.dash")
            .preferredColorScheme(.dark)
    }
}

