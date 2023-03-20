//
//  HapticManager.swift
//  Aurebesh Translator
//
//  Created by Bob Coleman on 3/20/23.
//

import SwiftUI

struct HapticManager {
    
    static let shared = HapticManager()
    
    private init () {}
    
    func tapHaptic() {
        let impactMed = UIImpactFeedbackGenerator(style: .light)
        impactMed.impactOccurred()
    }
}
