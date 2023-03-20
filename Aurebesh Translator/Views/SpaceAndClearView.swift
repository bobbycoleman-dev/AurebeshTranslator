//
//  SpaceAndClearView.swift
//  Aurebesh Translator
//
//  Created by Bob Coleman on 3/20/23.
//

import SwiftUI

struct SpaceAndClearView: View {
    
    let space = " "
    @Binding var toBeTranslated: String
    
    var body: some View {
        HStack {
            Button {
                HapticManager.shared.tapHaptic()
                toBeTranslated += space
            } label: {
                ZStack {
                    Rectangle()
                        .border(Color.accentColor, width: 2)
                        .foregroundColor(.clear)
                        .frame(width: 250, height: 40)
                        .cornerRadius(4)
                    Text("Space")
                        .font(.largeTitle)
                        .textCase(.uppercase)
                        .foregroundColor(.accentColor)
                }
            }
            
            Button {
                HapticManager.shared.tapHaptic()
                toBeTranslated.removeAll()
            } label: {
                ZStack {
                    Rectangle()
                        .border(Color.accentColor, width: 2)
                        .foregroundColor(.clear)
                        .frame(width: 90, height: 40)
                        .cornerRadius(4)
                    Text("clear")
                        .font(.title2)
                        .textCase(.uppercase)
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

struct SpaceAndClearView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceAndClearView(toBeTranslated: .constant("BOBBY COLEMAN"))
    }
}
