//
//  ContentView.swift
//  Aurebesh Translator
//
//  Created by Bob Coleman on 3/17/23.
//

import SwiftUI
import WrappingHStack

struct TranslatorView: View {
    
    @State private var toBeTranslated: String = ""
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Spacer()
                
                WrappingHStack(alignment: .leading, spacing: .constant(20)) {
                    WrappingHStack(convert(toBeTranslated), id: \.self) { character in
                        AurebeshCharacterView(character: character)
                    }
                }
                .padding()
                
                Spacer()
                
                ToBeTranslatedView(toBeTranslated: $toBeTranslated)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .border(Color.accentColor, width: 2)
                    .padding(.horizontal)
                
                NumberKeyBoardView(toBeTranslated: $toBeTranslated)
                
                LetterKeyboardView(toBeTranslated: $toBeTranslated)
                
                SpaceAndClearView(toBeTranslated: $toBeTranslated)
                
            }
        }
    }
    
    
    func convert(_ string: String) -> [String] {
        var result = [String]()
        let specialCharacterPattern = "^(CH|AE|EO|KH|NG|OO|SH|TH)"
        var currentIndex = string.startIndex
        while currentIndex < string.endIndex {
            let isSpecial = string[currentIndex...].range(of: specialCharacterPattern, options: .regularExpression) != nil
            var temp = String(string[currentIndex])
            currentIndex = string.index(after: currentIndex)
            if isSpecial {
                temp.append(string[currentIndex])
                currentIndex = string.index(after: currentIndex)
            }
            result.append(temp)
        }
        return result
    }
    
}


struct TranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView()
    }
}




struct ToBeTranslatedView: View {
    
    @Binding var toBeTranslated: String
    
    var body: some View {
        Text("\(toBeTranslated)")
            .font(.title)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .foregroundColor(.accentColor)
    }
}

struct AurebeshCharacterView: View {
    
    var character: String
    
    var body: some View {
        Image(character)
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .padding(.bottom, 10)
    }
}
