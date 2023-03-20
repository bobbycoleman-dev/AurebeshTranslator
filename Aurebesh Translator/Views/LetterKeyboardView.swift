//
//  LetterKeyboardView.swift
//  Aurebesh Translator
//
//  Created by Bob Coleman on 3/20/23.
//

import SwiftUI

struct LetterKeyboardView: View {
    
    private let topRow: [EnglishLetters] = [.q, .w, .e, .r, .t, .y, .u, .i, .o, .p]
    private let middleRow: [EnglishLetters] = [.a, .s, .d, .f, .g, .h, .j, .k, .l]
    private let bottomRow: [EnglishLetters] = [.z, .x, .c, .v, .b, .n, .m]
    
    @Binding var toBeTranslated: String
    
    var body: some View {
        VStack(spacing: 10){
            HStack {
                ForEach(topRow, id: \.rawValue) {letters in
                    letterButton(letter: letters.rawValue)
                }
            }
            
            HStack {
                ForEach(middleRow, id: \.rawValue) {letters in
                    letterButton(letter: letters.rawValue)
                }
            }
            
            HStack {
                Button {
                    HapticManager.shared.tapHaptic()
                    toBeTranslated += "$"
                } label: {
                    ZStack {
                        Rectangle()
                            .border(Color.accentColor, width: 2)
                            .foregroundColor(.clear)
                            .frame(width: 40, height: 55)
                            .cornerRadius(4)
                        Text("$")
                            .font(.title)
                            .textCase(.uppercase)
                            .foregroundColor(.accentColor)
                    }
                }
                
                ForEach(bottomRow, id: \.rawValue) {letters in
                    letterButton(letter: letters.rawValue)
                }
                
                Button {
                    HapticManager.shared.tapHaptic()
                    toBeTranslated.removeLast()
                } label: {
                    ZStack {
                        Rectangle()
                            .border(Color.accentColor, width: 2)
                            .foregroundColor(.clear)
                            .frame(width: 40, height: 55)
                            .cornerRadius(4)
                        Image(systemName: "delete.left")
                            .font(.title2)
                            .textCase(.uppercase)
                            .foregroundColor(.accentColor)
                    }
                }
                .disabled(toBeTranslated.isEmpty)
            }
        }
    }
    
    
    func letterButton(letter: String) -> some View {
        Button {
            HapticManager.shared.tapHaptic()
            toBeTranslated += letter
        } label: {
            ZStack {
                Rectangle()
                    .border(Color.accentColor, width: 2)
                    .foregroundColor(.clear)
                    .frame(width: 31, height: 55)
                    .cornerRadius(4)
                Text(letter)
                    .font(.title)
                    .textCase(.uppercase)
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct LetterKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        LetterKeyboardView(toBeTranslated: .constant("BOBBY COLEMAN"))
    }
}
