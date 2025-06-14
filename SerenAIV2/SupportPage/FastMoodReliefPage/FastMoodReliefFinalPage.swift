//
//  FastMoodReliefFinalPage.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 30.04.2025.
//

import Foundation
import SwiftUI

struct FastMoodReliefFinalPage : View {
    var body: some View {
        SupportPageLayoutInVStack(padding: 20) {
            FastMoodReliefContent()
        }
    }
}



struct FastMoodReliefContent : View {
    var body : some View {
        VStack(){
            HeaderText()
            Spacer()
            NeedSelectorView()
            Spacer()
            ThoughtReplacer()
            Spacer()
            ButtonShadow(text: "Exit with calm", fontSize: 18, height: 50)
                .padding(.horizontal,40)
//            Spacer()
        }.padding(.horizontal,20)

    }
}


struct HeaderText : View {
    
    @State var title : String = ""
    
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("If your emotion had one message \n What would it be?")
                .font(Font.semiBold(size: 17))
                .foregroundColor(Color.white.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,20)
            
            TextField("Briefly describe the issue", text: $title)
                .font(Font.light(size: 13))
                .foregroundColor(.white)
                .padding(.bottom, 4)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white),
                    alignment: .bottom
                ).padding(.horizontal,20)
                .padding(.top)
                .padding(.bottom)
            
            
        }
        .padding()
        .background(Color.backgroundPrimary)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.5), radius: 4,x: 0,y: 4)
    }
}



struct NeedSelectorView: View {
    private let needs = [
        ("Rest"),
         ("Space"),
         ("Support"),
         ("Clarity")
    ]
    @State var selectedButton : String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("What is one thing you need right now?")
                .font(Font.medium(size: 17))
                .padding(.top, 0)
                .foregroundColor(.white)
                .fixedSize()
            

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(needs, id: \.self) { emotion in
                    NeedButton(
                        title: emotion,
                        isSelected: selectedButton == emotion
                    ) {
                        selectedButton = emotion
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}


struct NeedButton: View {
    let title: String
    let isSelected: Bool
    let action : () -> Void
    
    @State private var isPressed: Bool = false
    
    
    var body: some View {
        Text(title)
            .font(Font.bold(size: 15))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 45)
            .background(!isSelected ? Color.backgroundPrimary : Color.secondary_2)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 4)
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: isSelected)
            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPressed)
            .onTapGesture {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                    action()
                }
            }
    }
}




struct ThoughtReplacer : View {
    
    let thoughtsReplaced = [("I am strongness",Color(hex:"#30BF50")), ("I feel invincible",Color(hex:"#9B30BF"))]
    
    var body : some View {
        
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            
            
            Text("Eliminate thought")
                .font(Font.regular(size: 17))
                .padding(.top, 0)
                .foregroundColor(.white)
         
            PillText(color:.opacedColor ,text: "Fear of followed")
            
            Text("Replace it with")
                .font(Font.regular(size: 17))
                .padding(.top, 0)
                .foregroundColor(.white)
            
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(thoughtsReplaced, id: \.0) { text, color in
                    PillText(
                        color: color,
                        text: text
                    ).frame(maxWidth: .infinity, minHeight: 70)
                }
            }
            
            
            Text("Use your headphones for maximum resulsts, \n Tap on each new affirmation, and replace it in the mind.")
                .font(Font.regular(size: 12))
                .foregroundColor(.opacedColor)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            
        }
        .padding()
        .background(Color.secondary_2)
        .cornerRadius(20)

        
    }
    
}


struct PillText : View {
    
    var color : Color = .white
    var text : String = ""
    
    
    
    var body: some View {
        Text(text)
            .font(Font.bold(size: 15))
            .foregroundColor(.white)
            .padding(.horizontal,20)
            .padding(.vertical,10)
            .background(
                Capsule()
                    .fill(color)
            )

       
    }
}
