//
//  SignUpView .swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 12.04.2025.
//

import Foundation
import SwiftUI



struct SignUpView : View {

    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""


    
    
    var body : some View {
        
        ZStack {
            Color.backgroundPrimary.ignoresSafeArea()
            
            
            VStack {

                Logo(size: 100, textSize: 18, circleGrid: false)
                    .padding(.top, 20)
                
                VStack(spacing:20) {
                    
                    Text("Sign Up")
                        .font(Font.light(size: 28))
                        .foregroundColor(.white)
                        .underline()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,45)
                    
                    Text("Your data stays private. SerenAI is built to support you, not track you.")
                        .font(Font.light(size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 27)
                    
                    
                                    
                }.padding(.top,35)
                
           
                VStack(spacing:50) {
                   CustomTextField(placeholder: "Email", text: $email, isSecure: false)
                    CustomTextField(placeholder: "Password", text: $password, isSecure: true)
                    CustomTextField(placeholder: "Confirm Password", text: $confirmPassword, isSecure: true)
                }.padding(.top,20)
                
                
                Spacer()
                
                
                VStack(spacing:30) {
                    SubButtonText(text: "By signing up you accept our", focusedText: "Terms and Conditions",font: Font.light(size: 14))
                    
                    ButtonShadow(text: "Register", fontSize: 18, height: 48).padding(.horizontal, 32)
                   
                    
                    SubButtonText(text: "Already have an account?", focusedText: "Continue").padding(.bottom,5)
                    
                }

            }
        }
        
    }
    
}

struct TextFieldEmail : View {
   
   @State private var email: String = ""
   
   var body : some View {
       
       VStack(alignment: .leading, spacing: 8) {
                   
           TextField("Email", text: $email)
               .foregroundColor(.white)
               .font(Font.regular(size: 18))
               .padding(.bottom, 4).padding(.horizontal,10)
           Rectangle()
               .frame(height: 1)
               .foregroundColor(.white)
       }.padding(.horizontal,54)
       
   }
}




struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 4) {
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundColor(.white)
                    .font(Font.regular(size: 18))
                    .padding(.bottom, 4).padding(.horizontal,20)
            }else {
                TextField(placeholder, text: $text)
                    .foregroundColor(.white)
                    .font(Font.regular(size: 18))
                    .padding(.bottom, 4).padding(.horizontal,20)
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
        }.padding(.horizontal,40)
        
    }

  
}
