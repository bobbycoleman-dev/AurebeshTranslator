//
//  LetterListView.swift
//  Aurebesh Translator
//
//  Created by Bob Coleman on 3/17/23.
//

import SwiftUI

struct LetterListView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                Section {
                    LazyVGrid(columns: columns) {
                        ForEach(AurebeshLetters.allCases, id: \.rawValue) { letter in
                            VStack {
                                Image(letter.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                Text(letter.rawValue)
                                    .bold()
                                    .font(.title)
                            }
                        }
                    }
                } header: {
                    Text("Letters")
                        .font(.title)
                }
                
                Section {
                    LazyVGrid(columns: columns) {
                        ForEach(EnglishNumbers.allCases, id: \.rawValue) { letter in
                            VStack {
                                Image(letter.rawValue)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                Text(letter.rawValue)
                                    .bold()
                                    .font(.title)
                            }
                        }
                    }
                } header: {
                    Text("Numbers")
                        .font(.title)
                }
            }
            .padding()
        }
    }
}

struct LetterListView_Previews: PreviewProvider {
    static var previews: some View {
        LetterListView()
    }
}
