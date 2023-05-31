//
//  NameInputViewModel.swift
//  Affirmation
//
//  Created by James Wolfe on 13/05/2023.
//

import SwiftUI

class NameInputViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published var name: String = ""
    
    // MARK: - Utilities
    func submit() {
        withAnimation {
            UserDefaults.standard.name = name
        }
    }
    
}
