//
//  AffirmationApp.swift
//  Affirmation
//
//  Created by James Wolfe on 13/05/2023.
//

import SwiftUI

@main
struct AffirmationApp: App {
    
    // MARK: - Variables
    @AppStorage("name") private var name = ""
    
    // MARK: - Views
    var body: some Scene {
        WindowGroup {
            ZStack {
                Image.background
                    .resizable()
                    .ignoresSafeArea()
                NameInputView()
                    .opacity(name.isEmpty ? 1 : 0)
                AffirmationStackView(name: name)
            }
            .animation(.easeInOut, value: UUID())
        }
    }
    
}
