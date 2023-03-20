//
//  NumberKeyBoardView.swift
//  Aurebesh Translator
//
//  Created by Bob Coleman on 3/20/23.
//

import SwiftUI
import CoreHaptics

struct NumberKeyBoardView: View {
    
    @Binding var toBeTranslated: String
    var topRow = EnglishNumbers.allCases
    
    var body: some View {
        HStack {
            ForEach(topRow, id: \.rawValue) {number in
                numberButton(number: number.rawValue)
            }
        }
    }
    
    
    func numberButton(number: String) -> some View {
        Button {
            HapticManager.shared.tapHaptic()
            toBeTranslated += number
        } label: {
            ZStack {
                Rectangle()
                    .border(Color.accentColor, width: 2)
                    .foregroundColor(.clear)
                    .frame(width: 31, height: 40)
                    .cornerRadius(4)
                Text(number)
                    .font(.title)
                    .textCase(.uppercase)
                    .foregroundColor(.accentColor)
            }
        }
        
    }
}

struct NumberKeyBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NumberKeyBoardView(toBeTranslated: .constant("1234"))
    }
}
