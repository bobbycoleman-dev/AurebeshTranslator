//
//  TabView.swift
//  Aurebesh Translator
//
//  Created by Bob Coleman on 3/17/23.
//

import SwiftUI

struct TabScreenView: View {
    var body: some View {
        TabView {
            TranslatorView()
                .tabItem {
                    Image(systemName: "keyboard")
                    Text("Translator")
                }
            
            LetterListView()
                .tabItem {
                    Image(systemName: "textformat")
                    Text("Characters")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabScreenView()
    }
}
