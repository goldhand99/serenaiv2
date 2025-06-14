//
//  SensorySupportPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 30.04.2025.
//

import Foundation
import SwiftUI


struct SensorySupportPageView : View {
    
    
    var body: some View {
        SupportPageLayoutInVStack(padding: 20) {
          SensorySupportContent()
        }
    }
}


struct SensorySupportContent : View {
    var body: some View {
        
        VStack() {
            
            Text("Notice 5 thigns")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            Text("Reconnect with your senses throughout your five senses")
                .font(Font.light(size: 15))
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top, 2)
            VStack(){
                
                Text("Choose your start")
                    .font(Font.bold(size: 16))
                    .foregroundColor(.white).padding(.bottom,30)
                
                
                GroundingOptionsView()
                ButtonShadow(text:"Start full grounding",fontSize: 20, height: 50).padding(.top)
                    .padding(.horizontal,50)
            }.padding(.top,20)
            Spacer()
        }
    }
}



import SwiftUI

struct SenseOption: Identifiable {
    let id = UUID()
    let title: String
    let systemIcon: String
}

struct GroundingOptionsView: View {
    private let senses: [SenseOption] = [
        .init(title: "See", systemIcon: "eye"),
        .init(title: "Touch", systemIcon: "hand.raised"),
        .init(title: "Hear", systemIcon: "ear"),
        .init(title: "Smell", systemIcon: "nose"),
        .init(title: "Taste", systemIcon: "cup.and.saucer")
    ]

    var body: some View {
        VStack(spacing: 16) {
            ForEach(senses) { sense in
                SenseButton(title: sense.title, systemIcon: sense.systemIcon)
            }
        }
        .padding(.horizontal, 24)
    }
}

struct SenseButton: View {
    let title: String
    let systemIcon: String

    var body: some View {
        HStack(spacing: 12) {
            
            Image(systemName: systemIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(8) // Adds space around the icon inside the background
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.3))
                )

            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .semibold))

            Spacer()
        }
        .padding(.vertical,10)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, minHeight: 50)
        .background(Color.accent) // Adjust to your color scheme
        .cornerRadius(30)
    }
}
