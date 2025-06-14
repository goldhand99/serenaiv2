//
//  ContentView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 04.04.2025.
//

import SwiftUI

enum AppScreen {
    case homepage
    case presentation
    case registration
    case initialSettings
    case feedpage
//    case payment at the end after 7 days
}

class AppNavigationController: ObservableObject {
    @Published var currentScreen: AppScreen = .homepage
       @Published var navIndex: Int = 0

       // This doesn't need a property wrapper
       let navScreens: [AppScreen] = [
           .homepage, .presentation, .registration, .initialSettings, .feedpage
       ]

    
    
    func goTo(_ screen: AppScreen) {
        currentScreen = screen
    }
    
    func goBack() {
        // Implement a stack if needed
    }
    
    
    //make here an array and increse by one
    
    
    
    func goToNext(from screen: AppScreen) {
        guard navIndex < navScreens.count - 1 else {
            return
        }
        
        navIndex += 1
        currentScreen = navScreens[navIndex]
    }
    
}



struct ContentView: View {
    
    @StateObject var navController = AppNavigationController()

    var body: some View {
        ZStack {
            switch navController.currentScreen {
            case .homepage:
                HomePageView()
                    .environmentObject(navController)
            case .presentation:
                PresentationAppCarouselView()
                    .environmentObject(navController)
            case .registration:
                StartRegistrationView()
                    .environmentObject(navController)
            case .initialSettings:
                EntrySettingsUserCarousel().environmentObject(navController)
                
            case .feedpage:
                EntryFeedPageView().environmentObject(navController)
            }
        }
        .animation(.easeInOut(duration: 0.8), value: navController.currentScreen)

    }
}


#Preview {
    ContentView()
}
