//
//  Font.swift
//  Affirmation
//
//  Created by James Wolfe on 13/05/2023.
//

import SwiftUI

extension Font {
    
    enum Baskerville: String {
        
        // MARK: - Cases
        case regular = "Baskerville-Regular"
        case italic = "Baskerville-Italic"
        case semibold = "Baskerville-Semibold"
        case semiboldItalic = "Baskerville-SemiboldItalic"
        case bold = "Baskerville-Bold"
        case boldItalic = "Baskerville-BoldItalic"
        
    }
    
    static func baskerville(_ weight: Baskerville, size: CGFloat) -> Font {
        return .custom(weight.rawValue, size: size)
    }
    
}
