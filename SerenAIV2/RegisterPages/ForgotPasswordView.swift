//
//  ForgotPasswordView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 12.04.2025.
//

import Foundation
import SwiftUI


struct ForgotPasswordView : View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    
    var body : some View {
        
        ZStack {
            Color.backgroundPrimary
                .ignoresSafeArea()
            
            VStack {
                
                Logo(size: 100, textSize: 18, circleGrid: false)
                    .padding(.top, 20)
                
                VStack(spacing:20) {
                    
                    Text("Forgot Password")
                        .font(Font.light(size: 28))
                        .foregroundColor(.white)
                        .underline()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,45)
                    
                    Text("Your data stays private. SerenAI is built to support you, not track you.")
                        .font(Font.light(size: 14))
                        .foregroundColor(Color.backgroundPrimary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 27)

                }.padding(.top,35)
                
                
                VStack(alignment: .center, spacing:50) {
                    CustomTextField(placeholder: "Email", text: $email, isSecure: false)
                    
                    Text("If an account is associated with this email, you will receive a password reset link shortly.")
                        .font(Font.light(size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 27)
                    
                }.padding(.top,20)
                
                ButtonShadow(text: "Login", fontSize: 18, height: 48).padding(.horizontal, 32).padding(.top,45)
                
                
                Spacer()
            }
        }
    }
}
