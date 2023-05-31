//
//  String+Localized.swift
//  Affirmation
//
//  Created by James Wolfe on 13/05/2023.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
