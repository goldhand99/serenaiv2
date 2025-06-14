//
//  ReportBugView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 21.04.2025.
//

import Foundation
import SwiftUI

struct ReportBugView : View {
    var body: some View {
        JournalPageLayoutInVStack(padding: 20) {
            ReportBugViewContent()
        }
    }
}


struct ReportBugViewContent : View {
    var body: some View {
        VStack {
            Text("Report a bug")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            Text("Better tools make for better care.")
                .font(Font.light(size: 15))
                .padding(.top, 2)
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)

           IssueForm().padding(.top,40)
            Spacer()
        }
    }
}


struct IssueForm: View {
    
    var attachPhotoOn : Bool = true
    var backgroundColor : Color = Color.accent
    var padding : CGFloat = 0
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 20) {
                // Card form content
                VStack(spacing: 20) {
                    TextFieldTitle()
                    TextEditorDescription(color: backgroundColor)
                        .padding(.bottom,padding)
                    if attachPhotoOn  {
                        AttachPhotoButton()
                    }
                }
                .padding()
                .background(backgroundColor)
                .cornerRadius(16)
                .padding(.horizontal)
                .padding(.bottom, 30) // Space for button shadow
            }

            // Floating send button
            
            ButtonShadowUnpadded(text: "Send", fontSize: 18, height: 48)
        }
    }
}





struct TextFieldTitle : View {
    @State private var title: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Title")
                .font(Font.regular(size: 18))
                .foregroundColor(.white)
            
            TextField("Briefly describe the issue", text: $title)
                .foregroundColor(.white)
                .padding(.bottom, 4)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white),
                    alignment: .bottom
                ).padding(.horizontal,10)
        }.padding(.top,20)
    }
}


struct TextEditorDescription : View {
    @State private var description: String = ""
    var color : Color = Color.accent

    var body: some View {
        // Description Input
        VStack(alignment: .leading, spacing: 6) {
            Text("Description")
                .font(Font.regular(size: 18))
                .foregroundColor(.white)
            
            TextEditor(text: $description)
                .frame(height: 100)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.white, lineWidth: 1)
                        .background(color)

                )
                .overlay(
                    Group {
                        if description.isEmpty {
                            Text("Enter a description")
                                .foregroundColor(.white.opacity(0.4))
                                .padding(.horizontal, 8)
                                .padding(.top, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)

                        }
                    }
                ).padding(.horizontal,10)
        }
    }
}


struct AttachPhotoButton : View {
    var body: some View {
        Button(action: {
            // attach photo action
        }) {
            Text("Attach a photo")
                .foregroundColor(.blue)
                .font(Font.medium(size: 14))
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .clipShape(Capsule())
        }
        .padding(.top, 10)
        .padding(.bottom,50)
    }
}
