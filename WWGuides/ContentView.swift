//
//  ContentView.swift
//  WWGuides
//
//  Created by Денис on 25.06.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.characters) { character in
                        HStack {
                            AsyncImage(url: URL(string: character.charIcon)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                case .failure:
                                    Image(systemName: "xmark.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                @unknown default:
                                    EmptyView()
                                        .frame(width: 50, height: 50)
                                }
                            }
                            Text(character.name)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationTitle("Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    ContentView()
}

