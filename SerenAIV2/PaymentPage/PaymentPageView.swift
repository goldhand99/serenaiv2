//
//  PaymentPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 13.04.2025.
//

import Foundation
import SwiftUI



struct PaymentPageView: View {
    var body : some View {
        
        ZStack {
            Color.backgroundPrimary.ignoresSafeArea()
            
            VStack {
                
                Logo(size: 100, textSize: 18, circleGrid: false)
                    .padding(.top, 20)
                

                Text("Pick a subscription")
                    .font(Font.light(size: 28))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,25)
                    .padding(.top,10)
                
                Spacer()
                
                SubscriptionCardView(priceMonth: "13", priceYear: "109", membershipName: "Serenity Starter Plan", membershipSubtext: "For those who want to begin their self care journey", features: ["AI Theraphist","Smart Journaling","Mood Tracking","Emergency techniques"]).tag(0).padding(.horizontal,30)
                
//                HStack {
//                    
//                    TabView(){
//                        SubscriptionCardView(priceMonth: "13", priceYear: "109", membershipName: "Serenity Starter Plan", membershipSubtext: "For those who want to begin their self care journey", features: ["AI Theraphist","Smart Journaling","Mood Tracking","Emergency techniques"]).tag(0).padding(.horizontal,30)
//                        
//                        SubscriptionCardView(priceMonth: "119", priceYear: "1100", membershipName: "Serenity Guided Support Plan", membershipSubtext: "For those seeking gentle support, with the reassurance of a professional guiding hand.", features: ["Everything in Starter Plan","1 Psychology Session/Month","Direct Chat with theraphist"]).tag(1).padding(.horizontal,30)
//                        
//                        SubscriptionCardView(priceMonth: "426", priceYear: "4022", membershipName: "Serenity Comprehensive Care Plan", membershipSubtext: "For those looking for consistent guidance, personalized care, and a dedicated space to heal and grow.", features: ["Everything in Guided Plan","4 Psychology Session/Month","1 Monthly Life Coach Session"]).tag(1).padding(.horizontal,30)
//                        
//                    }.tabViewStyle(.page)
//                        .padding(.top,0)
//                }.padding(.top,-20)

                
                
                PeriodSeparatorView()
                Spacer()
                NotificationToggleView().padding(.horizontal,30)
                ButtonShadow(text: "Start 1-week free trial", fontSize: 18, height: 48).padding(.horizontal, 32)
                    .padding(.bottom,0)
                TextBottomPayment()
            }
        }
    }
}


struct SubscriptionCardView : View {
    
    let priceMonth : String
    let priceYear : String
    let membershipName : String
    let membershipSubtext : String
    let features : [String]
    
    
    
    var body : some View {
        
            
            VStack(alignment: .leading,spacing: 20) {
                
                BottomPrice(priceMonth: priceMonth, priceYear: priceYear).padding(.horizontal,15)
                    .padding(.top,20)
                
                TextPriceCard(membershipName: membershipName, membershipSubtext: membershipSubtext).padding(.leading,15)
                
                CardPlan(features: features).padding(.bottom,20)
            }
                .background(Color.secondary_2)
                .cornerRadius(20)
        
        
  

    }
}


struct BottomPrice : View {
    
    let priceMonth : String
    let priceYear : String
    
    var body: some View {
        
        HStack(alignment: .bottom) {
            
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("$\(priceMonth)")
                    .font(Font.semiBold(size: 28))
                    .foregroundColor(.white)
                
                Text("/month")
                    .font(Font.regular(size: 12))
                    .foregroundColor(Color.opacedColor)
                    .baselineOffset(2)
            }
            
            Spacer()
            
            Text("$\(priceYear)/year")
                .font(Font.regular(size: 12))
                .foregroundColor(Color.opacedColor)
        }
    }
}

struct TextPriceCard : View {
    
    let membershipName : String
    let membershipSubtext : String
    
    
    var body: some View {
        VStack(alignment:.leading,spacing:10) {
            Text(membershipName)
                .font(Font.regular(size: 18))
                .foregroundColor(.white)
            
            Text(membershipSubtext)
                .font(Font.light(size: 12))
                .foregroundColor(Color.opacedColor)
                .baselineOffset(2)
        }
    }
}

struct CardPlan : View {
    let features : [String]
           
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // Title
            Text("This plan gets")
                .font(Font.medium(size: 14))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            // Features List Box
            VStack(alignment: .leading, spacing: 20) {
                ForEach(features, id: \.self) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                        
                        Text(feature)
                            .font(Font.medium(size: 14))
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
            }
            .padding(.vertical, 12)
                     .padding(.horizontal, 15)
                     .background(Color.secondaryApp)
                     .cornerRadius(20)
                     .padding(.horizontal, 35)
        }
    }
}


struct CircleDotaPaymentView : View {
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(.white)
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(.white.opacity(0.3))
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(.white.opacity(0.3))
        }
    }
}


struct PeriodSeparatorView : View {
    
    var body : some View {
        HStack(spacing: 0) {
            Text("monthly")
                .font(Font.medium(size: 12))
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 18)
                .background(Color.secondary_2)
                .clipShape(Capsule())
            
            
            
            Text("yearly")
                .font(Font.medium(size: 12))
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 18)
                .clipShape(Capsule())
            
        }
        .padding(6)
        .background(Color.secondaryApp)
        .clipShape(Capsule())
    }
    
}


struct NotificationToggleView : View {
    
    @State private var notifyUser: Bool = false

    
    var body: some View {
        HStack {
            Text("Notify me at the end of the trial")
                .font(Font.medium(size: 14))
                .foregroundColor(.white)
            Spacer()
            Toggle("", isOn: $notifyUser)
                .labelsHidden()
        }
        .padding(.vertical,10)
        .padding(.horizontal,20)
        .background(Color.secondaryApp)
        .cornerRadius(20)
    }
}


struct TextBottomPayment : View {
    var body: some View {
        VStack(spacing: 4) {
            Text("7 days free")
                .font(Font.light(size: 14))
                .foregroundColor(.white)
            Text("then 109 USD for year (13 USD per month)")
                .font(Font.light(size: 14))
                .foregroundColor(.white)
        }
        .multilineTextAlignment(.center)
        .padding(.top)
    }
}
