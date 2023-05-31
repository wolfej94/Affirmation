//
//  UserDefaults.swift
//  Affirmation
//
//  Created by James Wolfe on 13/05/2023.
//

import Foundation

extension UserDefaults {
    
    var name: String? {
        get {
            string(forKey: "name")
        }
        set {
            set(newValue, forKey: "name")
        }
    }
    
}
