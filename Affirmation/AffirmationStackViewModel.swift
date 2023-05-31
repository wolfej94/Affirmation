//
//  AffirmationStackViewModel.swift
//  Affirmation
//
//  Created by James Wolfe on 13/05/2023.
//

import SwiftUI

class AffirmationStackViewModel: ObservableObject {
    
    // MARK: - Variables
    private var timer: Timer?
    let name: String
    @Published var greeting: String = ""
    @Published var selectedAffirmation: String?
    @Published var affirmations: [String] = ["I am a good man", "I do not smell", "I am cool"]
    @Published var isFavourited: Bool = false
    @Published var topCardOffset: CGSize = .zero
    
    // MARK: - Initializers
    init(name: String) {
        self.name = name
        self.timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: { [weak self] _ in
            self?.updateGreeting()
        })
        self.updateGreeting()
    }
    
    // MARK: - Utilities
    func updateGreeting() {
        switch Calendar.current.component(.hour, from: .init()) {
        case 5..<12:
            greeting = .init(format: "AffirmationStackView.MorningGreeting.Text".localized, name)
        case 12..<17:
            greeting = .init(format: "AffirmationStackView.AfternoonGreeting.Text".localized, name)
        default:
            greeting = .init(format: "AffirmationStackView.EveningGreeting.Text".localized, name)
        }
    }
    
    func selectAffirmation() {
        withAnimation {
            selectedAffirmation = affirmations.last
        }
    }
    
    func share() {
        withAnimation(.easeInOut) {
            selectedAffirmation = nil
        }
    }
    
    func favourite() {
        withAnimation {
            isFavourited = !isFavourited
        }
    }
    
}
