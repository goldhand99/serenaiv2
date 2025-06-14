//
//  SerenAIPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 18.04.2025.
//

import Foundation
import SwiftUI



//The view responsible for the talking audio

struct SerenAIPageView : View {
    
    var body : some View {
        PresentationSerenAIUsageLayout(padding: 120) {
            ContentSerenAIPageView()
        }
    }

    
}



struct ContentSerenAIPageView : View {
    
    var body : some View {
        VStack{
            Spacer()
            Text("I’m here to listen. Take your time.")
                .foregroundColor(.white)
                .font(Font.light(size: 28))
                .padding(.horizontal,15)

            Spacer()
            MenuSerenAITheraphist()
        }
    }
}




struct MenuSerenAITheraphist: View {
    var body : some View {
        VStack {
            HStack(spacing: 5) {
                SmallCircleButton(systemIcon: "ellipsis.message").padding(.top,75)
                
                VStack(spacing: 30) {
                    MediumCircleButton(systemIcon: "square")
                    Text("05:00")
                        .foregroundColor(.white)
                        .font(.custom(Font.font_regular, size: 14))
                        .opacity(0)
                }
                
                SmallCircleButton(systemIcon: "gearshape").padding(.top,75)
            }.padding(.bottom,10)
        }
    }
}


