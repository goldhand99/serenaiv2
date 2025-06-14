//
//  FeedPageView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 16.04.2025.
//

import Foundation
import SwiftUI

struct FeedPageView : View {
    
    var body : some View {
        ZStack() {
            Color.backgroundPrimary.ignoresSafeArea()
            
            ZStack{
                
                ZStack {
                    VStack {
                        Logo(size: 100, textSize: 18, circleGrid: false)
                            .padding(.top, 20)
                        Spacer()
                    }
                    HomeDashboardView().ignoresSafeArea().padding(.top,140)
                }
                ButtonShadowSupportLayout()
                
            }
        }
    }
    
}



struct HomeDashboardView: View {
    var body: some View {
        VStack {
            // Date + Greeting
            DateGreetingSection()
            
            // Mood Scroll Calendar
            MoodCalendarView()
            
            // Quote
            QuoteSection().padding(.top,5)
            
            // Affirmation Player
            AffirmationSection().padding(.horizontal, 15).padding(.top,10)

            
            // Mood Tracker Chart
            VStack(spacing:20){
                Text("Mood tracker")
                    .font(Font.medium(size: 16))
                    .foregroundColor(.white)
                MoodChartViewFeedPage().offset(x:-10)
                HStack {
                    Spacer()
                    Text("See more ->")
                        .font(Font.medium(size: 15))
                        .foregroundColor(.white)
                }.padding(.horizontal,20)
            }.padding(.top,2)
                .padding(.bottom,0)
                .padding(.horizontal,20)

            Spacer()
            BottomNavigationBarView()
        }
        .padding(.horizontal,0)
    }
}


// MARK: - Subviews
struct DateGreetingSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("17 Mar 2025")
                .font(Font.light(size: 14))
                .foregroundColor(.white)
            Text("Good Afternoon,")
                .font(Font.medium(size: 18))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading,20)
    }
}

struct MoodCalendarView: View {
    let days = ["Tue", "Thu", "Thu", "Fri", "Sun", "Sun"]
    let emojis = ["😄", "🙂", "😡", "😍"] // only 4 emojis
    let selectedIndex = 3
    
    var body: some View {
        HStack {
            Text("<")
                .foregroundColor(.white)

            ForEach(days.prefix(7).indices, id: \.self) { index in
                VStack(spacing: 4) {
                    // Day + Date
                    VStack {
                        Text(days[index])
                            .font(Font.light(size: 12))
                            .foregroundColor(.white)
                        
                        Text("\(Int.random(in: 5...19))")
                            .font(Font.light(size: 12))
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 10)
                    .frame(width: 44) // 👈 Fixes the width of the rounded box
                    .background(index == selectedIndex ? Color.backgroundPrimary : Color.clear)
                    .cornerRadius(10)

                    // Emoji
                    if index < emojis.count {
                        Text(emojis[index])
                            .font(.system(size: 22))
                            .padding(.top, 5)
                    } else {
                        Text("🙂")
                            .font(.system(size: 22))
                            .opacity(0)
                            .padding(.top, 5)
                    }
                }
//                .frame(maxWidth: .infinity)
            }

            Text(">")
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.secondary_2)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}
        
        

    
                        

struct QuoteSection: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Peace begins the moment you choose to\nlisten to yourself.")
                .font(Font.regular(size: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            Rectangle()
                .fill(.white)
                .frame(height: 1)
                .padding(.horizontal)
        }
    }
}




struct AffirmationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Today's Heartfelt Affirmations")
                .font(Font.medium(size: 14))
                .foregroundColor(.white).padding(.horizontal,10)

            VStack(alignment: .leading, spacing: 6) {
                
                HStack {
                    Spacer()
                    Text("Nurturing Words to Empower Your Day")
                        .font(Font.regular(size: 14))
                        .foregroundColor(Color.opacedColor)
                    Spacer()
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                
                AudioWaveformBarsView()
                
                HStack {
                    Text("01:30")
                        .font(Font.regular(size: 11))
                        .foregroundColor(.white)
                    Spacer()
                    Text("04:30")
                        .font(Font.regular(size: 11))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 6)
                .padding(.bottom,1)
                
            }
            .padding()
            .background(Color.secondary_2)
            .cornerRadius(20)
        }
    }
}






struct AudioWaveformBarsView: View {
    let barCount = 55
    let maxHeight: CGFloat = 40

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            ForEach(0..<barCount, id: \.self) { index in
                Capsule()
                    .fill(index < barCount / 2 ? Color.accentColor.opacity(0.6) : .white.opacity(0.7))
                    .frame(width: 2, height: CGFloat.random(in: 10...maxHeight))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: maxHeight)
    }
}

struct BottomNavigationBarView: View {
    var body: some View {
        HStack(spacing: 40) { // Manual spacing instead of Spacer()
            
            // Left Tab
            VStack(spacing: 4) {
                Image(systemName: "book")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                Text("Journal")
                    .font(Font.regular(size: 12))
                    .foregroundColor(Color.opacedColor)
            }

            // Center Button (lifted)
            VStack(spacing: 4) {
                MediumCircleButton(systemIcon: "square")
                Text("Start SerenAI")
                    .font(Font.regular(size: 12))
                    .foregroundColor(.white)
            }
            .offset(y: -30)

            // Right Tab
            VStack(spacing: 4) {
                Image(systemName: "gearshape")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                Text("Settings")
                    .font(Font.regular(size: 12))
                    .foregroundColor(Color.opacedColor)
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 0)
        .background(
            Rectangle()
                .fill(Color.secondary_2)
                .clipShape(
                    .rect(
                        topLeadingRadius: 120,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 120
                    )
                )
            )
    }
}



struct MediumCircleButton: View {
    let systemIcon: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 75, height: 75)
                .shadow(radius: 4)
            
            RoundedSquareRadioButton(strokeColor: Color.backgroundPrimary)
        }
    }
}



struct MoodChartViewFeedPage: View {
    let moodData: [(time: String, moodLevel: Int, emoji: String)] = [
        ("08:00", 1, "😁"),
        ("10:00", 0, "😄"),
        ("13:00", 2, "🙂"),
        ("14:00", 4, "😡"),
        ("15:00", 3, "😢"),
        ("18:00", 2, "😐")
    ]
    
    let moodLabels = ["Happy", "Calm", "Uncertain", "Sad", "Angry"]
    
    let chartPadding: CGFloat = 50 // for Y-axis labels

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width - chartPadding
            let height = geo.size.height - 30 // leave space for time labels

            let stepX = width / CGFloat(moodData.count - 1)
            let stepY = height / CGFloat(moodLabels.count - 1)

            ZStack {
                // Horizontal Y-axis lines + labels
                ForEach(0..<moodLabels.count, id: \.self) { i in
                    let y = CGFloat(i) * stepY
                    Group {
                        // Mood level label
                        Text(moodLabels[i])
                            .font(Font.medium(size: 12))
                            .foregroundColor(.white)
                            .position(x: chartPadding/3 , y: y)

                        // Guideline
                        Path { path in
                            path.move(to: CGPoint(x: chartPadding, y: y))
                            path.addLine(to: CGPoint(x: chartPadding + width, y: y))
                        }
                        .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [4]))
                    }
                }

                //Draw the path
                Path { path in
                    var points: [CGPoint] = moodData.enumerated().map { index, data in
                        let x = chartPadding + CGFloat(index) * stepX
                        let y = CGFloat(data.moodLevel) * stepY
                        return CGPoint(x: x, y: y)
                    }

                    // 💡 Pad start and end to ensure smoothness
                    if let first = points.first, let last = points.last {
                        points.insert(first, at: 0)
                        points.append(last)
                    }

                    guard points.count >= 4 else { return }

                    path.move(to: points[1])

                    for i in 1 ..< points.count - 2 {
                        let p0 = points[i - 1]
                        let p1 = points[i]
                        let p2 = points[i + 1]
                        let p3 = points[i + 2]

                        // Catmull-Rom to Bézier conversion
                        let control1 = CGPoint(
                            x: p1.x + (p2.x - p0.x) / 6,
                            y: p1.y + (p2.y - p0.y) / 6
                        )
                        let control2 = CGPoint(
                            x: p2.x - (p3.x - p1.x) / 6,
                            y: p2.y - (p3.y - p1.y) / 6
                        )

                        path.addCurve(to: p2, control1: control1, control2: control2)
                    }
                }
                .stroke(Color.white, lineWidth: 2)


                // Emoji points
                ForEach(Array(moodData.enumerated()), id: \.offset) { index, data in
                    let x = chartPadding + CGFloat(index) * stepX
                    let y = CGFloat(data.moodLevel) * stepY

                    Text(data.emoji)
                        .font(.system(size: 24))
                        .position(x: x, y: y)
                }

                // X-axis time labels
                VStack {
                    Spacer()
                    
                    HStack(spacing: 0) {
                        ForEach(moodData.indices, id: \.self) { i in
                            
                            Text(moodData[i].time)
                                .font(.custom(Font.font_regular, size: 11))
                                .foregroundColor(.white)
                                .frame(width: stepX, alignment: .center)
                            
                        }

                    }
                    .padding(.leading, chartPadding/2)
                }
            }
        }
        .frame(height: 150)
        .padding(.horizontal, 48)
    }
}
