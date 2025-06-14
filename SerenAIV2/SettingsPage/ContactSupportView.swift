//
//  ContactSupportView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 22.04.2025.
//

import Foundation
import SwiftUI


struct ContactSupportView : View {
    var body: some View {
        JournalPageLayoutInVStack(padding: 20) {
            ContactSupportContent()
        }
    }
}


struct ContactSupportContent : View {
    var body: some View {
        VStack(){
            Text("Contact Support")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            Text("When in doubt, reach out. We’re here.")
                .font(Font.light(size: 15))
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top, 2)
                        
            SupportContactSection().padding(.top,40)

            Spacer()
        }
    }
}

struct SupportContactSection: View {
    var body: some View {
        VStack(spacing: 32) {
            CustomerSupportCard()
            SocialSupportCard()
            SupportQuote()
        }
        .padding(.horizontal)
    }
}


struct CustomerSupportCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Customer Support")
                .font(.semiBold(size: 16))
                .foregroundColor(.white)

            SocialRow(icon: "phone.fill", title: "Contact Number", subtitle: "Available from 9 June 2025", btnText: "Call Us ",needsBlur: true)
            SocialRow(icon: "envelope.fill", title: "Email Address", subtitle: "support@seren.ai", btnText: "Email Us")
        }
        .padding()
        .background(Color.secondaryApp)
        .cornerRadius(16)
       
    }
}



struct SocialSupportCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Social Media")
                .font(.semiBold(size: 16))
                .foregroundColor(.white)

            SocialRow(icon: "", title: "Instagram", subtitle: "@serenai", btnText: "Instagram Us ")
            SocialRow(icon: "", title: "Twitter/X", subtitle: "@serenai", btnText: " Tweet/X Us ")
            SocialRow(icon: "", title: "Facebook", subtitle: "@serenai", btnText: "Facebook Us ")
                .padding(.bottom,15)
        }
        .padding()
        .background(Color.accent)
        .cornerRadius(16)
       
    }
}






struct SocialRow: View {
    var icon: String
    var title: String
    var subtitle: String
    var btnText: String
    var needsBlur : Bool = false

    var body: some View {
        HStack() {
            SupportDetailRow(icon: icon, title: title, subtitle: subtitle)
            Spacer()
            ButtonShadowUnpadded(text: btnText, fontSize: 14, height: 36).frame(width: 175)
                .blur(radius: needsBlur ? 3.0 : 0)
        }
    }
}


struct SupportDetailRow: View {
    var icon: String
    var title: String
    var subtitle: String

    var body: some View {
        Label {
            VStack(alignment: .leading) {
                Text(title).font(.regular(size: 14)).foregroundColor(.white)
                Text(subtitle).font(.light(size: 13)).foregroundColor(.gray)
            }
        } icon: {
            Image(systemName: icon).foregroundColor(.white)
        }
    }
}


struct SupportQuote: View {
    var body: some View {
        Text("Support is strength. You don’t have to hold it all alone.")
            .font(.custom("Inter18pt-ExtraLightItalic", size: 16))
            .italic()
            .foregroundColor(.white.opacity(0.85))
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
}
