//
//  SupportPageFeedView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 27.04.2025.
//

import Foundation
import SwiftUI



struct SupportPageFeedView : View {
    var body: some View {
        SupportPageLayoutInVStack(padding: 0) {
            SupportPageFeedContent()
        }
    }
}


struct SupportPageFeedContent : View {
    var body: some View {
        VStack {
            Text("You're not alone.")
                .font(Font.semiBold(size: 24))
                .padding(.top, 0)
                .foregroundColor(.white)
            Text("Choose the support you need right now.")
                .font(Font.light(size: 15))
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top, 2)
                        
            SupportPageFeedSection()

        }
    }
}


struct SupportPageFeedSection : View {
    var body: some View {
        ScrollView{
            EmergencyCarousel().padding(.top)
            Divider().background(Color.white).padding(.horizontal,20).padding(.top)
            ProgrammingSection()
            Spacer()
        }
    }
}

struct EmergencyCarousel : View {
    
    let exercises: [ExerciseData] = [
        ExerciseData(
            title: "Sensory Grounding",
            description: "Step-by-step 5–4–3–2–1 sensory prompts to reconnect with the present moment.",
            buttonText: "Try",
            color: Color(hex: "#4B4375") // dark bluish purple
        ),
        ExerciseData(
            title: "Deep Breathing",
            description: "Guided breath visual or audio to regulate nervous system.",
            buttonText: "Breathe",
            color: Color(hex: "#9B3CB5") // bright purple
        ),
        ExerciseData(
            title: "Short Mood Reset",
            description: "A 1-minute “pause & reframe” micro-exercise (CBT/ACT-inspired).",
            buttonText: "Reset",
            color: Color(hex: "#4B4375") // dark bluish purple (same as Sensory Grounding)
        )
    ]

    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        VStack {
            
            Text("Self-regulation processes")
                .font(Font.medium(size: 16))
                .padding(.top, 0)
                .foregroundColor(.white)
            
            
            ZStack {
                ForEach(exercises.indices, id: \.self) { index in
                    ZStack {
                        ExerciseCard(title: exercises[index].title, description: exercises[index].description, buttonText: exercises[index].buttonText, color: exercises[index].color)
                        .padding()
                    }
                    .cornerRadius(18)
                    .shadow(radius: 5)
                    .scaleEffect(1.0 - abs(distance(index)) * 0.2)
                    .opacity(1.0 - abs(distance(index)) * 0.3)
                    .offset(x: myXOffset(index), y: myYOffset(index))
                    .zIndex(1.0 - abs(distance(index)) * 0.1)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width / 300 // smaller sensitivity
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            let dragThreshold: CGFloat = 50 // How much you need to drag to trigger switch
                            
                            if value.translation.width < -dragThreshold {
                                // Swipe left → next card
                                snappedItem = (snappedItem - 1).remainder(dividingBy: Double(exercises.count))
                            } else if value.translation.width > dragThreshold {
                                // Swipe right → previous card
                                snappedItem = (snappedItem + 1).remainder(dividingBy: Double(exercises.count))
                            }
                            
                            draggingItem = snappedItem // lock dragging to snapped
                        }
                    }
            )
            
            HStack(spacing: 8) {
                ForEach(exercises.indices, id: \.self) { index in
                    Circle()
                        .fill(currentIndex == index ? Color.primary : Color.primary.opacity(0.3))
                        .frame(width: 8, height: 8)
                }
            }
            
        }
        
    }
    
    var currentIndex: Int {
        let index = Int(-snappedItem).modulo(exercises.count)
        return index
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(exercises.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(exercises.count) * distance(item)
        return sin(angle) * 200
    }
    
    func myYOffset(_ item: Int) -> Double {
        let d = distance(item)
        return -abs(d) * 35 // shift more based on how far from center
    }
}


struct ExerciseData {
    var title: String
    var description: String
    var buttonText : String
    var color : Color
}


struct ExerciseCard : View {
    
    var title: String
    var description: String
    var buttonText : String
    let color: Color
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack(alignment: .center,spacing:10) {
                
                Text(title)
                    .font(Font.semiBold(size: 18))
                    .foregroundColor(.white)
                    .padding(.top,15)
                    .padding(.horizontal,10)

                
                Text(description)
                    .font(Font.regular(size: 16))
                    .foregroundColor(.white)
                    .padding(.bottom,20)
                    .padding(.horizontal,10)


                
            }.frame(maxWidth: UIScreen.main.bounds.width/1.7)
                .frame(height: 160)
            .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(color)
                        .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
            )


            Text(buttonText)
                .font(Font.bold(size: 15))
                .foregroundColor(.white)
                .padding(.horizontal, 15)
                .padding(.vertical, 6)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .offset(y: 10)
        }
    }
}




struct ProgrammingSection: View {
    @State private var isLocked: Bool = false // Toggle for locked/unlocked state

    var body: some View {
        ZStack(alignment:.top) {
            // Main content behind
            VStack {
                Text("Professional Support")
                    .font(Font.medium(size: 16))
                    .padding(.top, 10)
                    .foregroundColor(.white)

                VStack(spacing: 32) {
                    CalendarSectionView()
                        .padding(.horizontal, 20)
                    TimeSlotsView()
                        .padding(.horizontal, 20)
                    BookedSessionsCarousel()
                        .padding(.horizontal, 20)
                    LiveChatButtonView()
                        .padding(.horizontal, 20)
                }
                .blur(radius: isLocked ? 4 : 0) // 👈 Blur background if locked
            }

            // Lock overlay
            if isLocked {
                VStack(spacing: 12) {
                    Text("Available with Serenity Premium plans")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.secondary_2)
                        )
                }
                .padding(.top, 80)
            }
            
            
            
        }
    }
}
struct CalendarSectionView: View {
    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) { // <-- Added alignment
            Text("Book therapist session")
                .font(Font.regular(size: 16))
                .foregroundColor(.white)
                .padding(.leading, 10) // <-- Slight leading padding to align nicely with inner card

            VStack(spacing: 8) {
                Text(monthTitle(for: selectedDate))
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)

                CalendarGrid(selectedDate: $selectedDate)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 8)
            }
            .padding(10)
            
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.secondary.opacity(0.3))
            )
        }.padding(.top,10)
    }

    func monthTitle(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL"
        return formatter.string(from: date)
    }
}



struct CalendarGrid: View {
    @Binding var selectedDate: Date
    private let calendar = Calendar.current
    private let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

    private var currentMonthDates: [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: selectedDate) else { return [] }
        
        var dates = [Date]()
        var current = monthInterval.start
        
        while current < monthInterval.end {
            dates.append(current)
            current = calendar.date(byAdding: .day, value: 1, to: current)!
        }
        
        return dates
    }

    var body: some View {
        VStack(spacing: 4) {
            // Weekdays
            HStack(spacing: 4) {
                ForEach(days, id: \.self) { day in
                    Text(day.prefix(3)) // only first 3 letters
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.7))
                        .frame(maxWidth: .infinity)
                }
            }

            // Dates
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 4) {
                ForEach(currentMonthDates, id: \.self) { date in
                    Button(action: {
                        selectedDate = date
                    }) {
                        Text("\(calendar.component(.day, from: date))")
                            .font(.caption)
                            .foregroundColor(isSameDay(date1: selectedDate, date2: date) ? .white : .white.opacity(0.7))
                            .frame(width: 28, height: 28)
                            .background(
                                Circle()
                                    .fill(isSameDay(date1: selectedDate, date2: date) ? Color.blue : Color.clear)
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }

    func isSameDay(date1: Date, date2: Date) -> Bool {
        calendar.isDate(date1, inSameDayAs: date2)
    }
}


struct TimeSlotsView: View {
    let timeSlots = ["14:15", "15:15", "16:15", "17:15"]
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(timeSlots, id: \.self) { time in
                Text(time)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.opacity(0.7))
                    )
            }
        }
    }
}

struct BookedSessionsCarousel: View {
    let sessions = [
        SessionData(date: "Tue 5", time: "17:15", doctor: "Dr. Pop Lorenzo", status: "Finished live"),
        SessionData(date: "Thu 7", time: "15:30", doctor: "Dr. Alex Smith", status: "Upcoming"),
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Booked sessions")
                .font(Font.regular(size: 16))
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(sessions, id: \.self) { session in
                        SessionCard(session: session)
                    }
                }
            }
        }
    }
}

struct SessionCard: View {
    let session: SessionData

    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    // Time and date
                    VStack(alignment: .leading, spacing: 4) {
                        Text(session.time)
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(session.date)
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Spacer()
                    
                    // Doctor
                    Text(session.doctor)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                
                // Cancel Button at the bottom
                Button(action: {
                    // Handle cancel
                }) {
                    Text("Cancel")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(Color.gray.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hex: "#292D5D").opacity(0.7))
            )
            
            // Remind Me Button at the top right
            Button(action: {
                // Handle remind
            }) {
                Text("Remind me")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding([.top, .trailing], 8)
            .offset(y:-20)
        }.padding(.top,25)
    }
}



//(Color(hex: "#292D5D")

struct LiveChatButtonView: View {
    var body: some View {
        Button(action: {
            // Join live chat action
        }) {
            HStack {
                Text("Join live chat with therapist")
                Image(systemName: "arrow.right")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
            )
        }
        .padding(.horizontal, 20)
    }
}

// MARK: - Data Model
struct SessionData: Hashable {
    let date: String
    let time: String
    let doctor: String
    let status: String
}










