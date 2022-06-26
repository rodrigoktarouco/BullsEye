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
        Image(systemName: systemImage)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(
                Circle().fill(Color("ButtonFilledBackgroundColor"))
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

