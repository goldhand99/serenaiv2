//
//  StartRegistrationView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 11.04.2025.
//

import Foundation
import SwiftUI



struct StartRegistrationView : View {
    
    @EnvironmentObject var nav: AppNavigationController

    
    
    var body : some View {
        
        ZStack {
            Color.backgroundPrimary
                .ignoresSafeArea()
            
            VStack {
                
                Logo(size: 100, textSize: 18, circleGrid: false)
                    .padding(.top, 20)
                
                VStack(spacing:30){
                    Text("Serenity begins with self-awareness. Let’s take this journey together.")
                        .font(Font.light(size: 28))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 27)
                    
                    
                    Text("By creating an account, you can track your emotions, gain personalized insights, and access guided support whenever you need it.")
                        .font(Font.light(size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 54)
                }.padding(.top,75)
                
                Spacer()
                
                VStack(spacing:20) {
                    
                    Text("Your data stays private. SerenAI is built to support you, not track you.")
                        .font(Font.light(size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 27)
                    
                    ButtonShadowClosure(text: "Continue with email", fontSize: 18, height: 48,action: {
                        nav.goToNext(from: .homepage)
                    }).padding(.horizontal, 32)
                    
                    ButtonShadow(text: "Continue with Apple ID", fontSize: 18, height: 48).padding(.horizontal, 32)
                    
                    SubButtonText(text: "Already have an account?", focusedText: "Continue").padding(.bottom,5)
                    
                }
            
            }
        }

    }
}




