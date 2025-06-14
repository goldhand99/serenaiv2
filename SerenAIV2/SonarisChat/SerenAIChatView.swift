//
//  SerenAIChatView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 18.04.2025.
//

import Foundation
import SwiftUI


//The view responsible for the chat view


    
struct SerenAIChatView : View {
    
    var body : some View {
        PresentationSerenAIUsageLayout(padding:0) {
            ContentChatPageView()
        }
    }
    
}
    




    
struct ContentChatPageView: View {
    @State private var messageText = ""
    @State private var showAttachmentMenu = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                // Chat messages
                    VStack(spacing: 16) {
                        Spacer()
                        UserBubble(text: "Haven’t felt so exhausted in a long time. I don’t know what and where I could go, and more especially it’s continuously stressing me out this situation. Please I really need your help.", time: "14:21")
                        
                        BotBubble(text: "I hear you, and I want you to know that you're not alone in this. Feeling exhausted and uncertain can be overwhelming, but you don’t have to go through it alone. Let's take a deep breath together.", time: "14:21")
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)

                
                // Message input bar
                ChatInputBar(messageText: $messageText, showAttachmentMenu: $showAttachmentMenu)
                    .padding(.bottom, 6)
            }

            // Overlay attachment menu ABOVE the input bar
            if showAttachmentMenu {
                AttachmentMenu {
                    showAttachmentMenu = false
                }
                .padding(.bottom, 60) // 👈 lift it just above input bar
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: showAttachmentMenu)
            }
        }


    }
}

struct UserBubble: View {
    let text: String
    let time: String

    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text(text)
                    .font(Font.regular(size: 16))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.primary.opacity(0.3))
                    .cornerRadius(16)
                Text(time)
                    .font(Font.regular(size: 10))
                    .foregroundColor(.white.opacity(0.6))
            }
        }
    }
}

struct BotBubble: View {
    let text: String
    let time: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(text)
                    .font(Font.regular(size: 16))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.secondaryApp)
                    .cornerRadius(16)
                Text(time)
                    .font(Font.regular(size: 10))
                    .foregroundColor(.white.opacity(0.6))
            }
            Spacer()
        }
    }
}
struct ChatInputBar: View {
    @Binding var messageText: String
    @Binding var showAttachmentMenu: Bool

    var body: some View {
        HStack(spacing: 10) {
            // Attachment button
            Button(action: {
                showAttachmentMenu = true
            }) {
                ZStack {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.accent)

                    Image(systemName: "plus")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }
            }

            ZStack(alignment: .leading) {
                // Custom placeholder
                if messageText.isEmpty {
                    Text("Speak freely...")
                        .font(Font.regular(size: 15))
                        .foregroundColor(.gray) // 👈 Your custom color
                        .padding(.horizontal, 14)
                }

                TextField("", text: $messageText)
                    .font(Font.regular(size: 15))
                    .padding(10)
                    .foregroundColor(.black)
            }
            .background(Color.opacedColor)
            .cornerRadius(20)

            // Send button
            Button(action: {
                // send message
            }) {
                Image(systemName: "paperplane.fill")
                    .rotationEffect(.degrees(45))
                    .font(.system(size: 20))
                    .padding(10)
                    .background(Color.accent)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 20)
    }
}


struct AttachmentMenu: View {
    var onClose: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            AttachmentOption(icon: "photo", title: "Attach Photos", onTap: onClose)
            AttachmentOption(icon: "camera", title: "Take Photo", onTap: onClose)
            AttachmentOption(icon: "paperclip", title: "Attach Files", onTap: onClose)
        }
        .padding()
        .background(Color.secondary_2)
        .cornerRadius(14)
        .padding(.horizontal, 50)
        .padding(.bottom, 110)
        .transition(.move(edge: .bottom))
        .zIndex(1)
    }
}

struct AttachmentOption: View {
    let icon: String
    let title: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundColor(.white)
                Text(title)
                    .foregroundColor(.white)
                    .font(Font.regular(size: 14))
                Spacer()
            }
        }
    }
}


    
