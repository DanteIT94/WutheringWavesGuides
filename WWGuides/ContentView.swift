//
//  ContentView.swift
//  WWGuides
//
//  Created by Денис on 25.06.2024.
//
//

//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = CharacterViewModel()
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVStack(spacing: 20) {
//                    if viewModel.characters.isEmpty {
//                        ForEach(Character.defaultCharacters) { character in
//                            characterRow(character)
//                        }
//                    } else {
//                        ForEach(viewModel.characters) { character in
//                            characterRow(character)
//                        }
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("Characters")
//            .onAppear {
//                print("ContentView appeared")
//                viewModel.fetchCharacters()
//            }
//        }
//    }
//
//    @ViewBuilder
//    private func characterRow(_ character: Character) -> some View {
//        printCharacterInfo(character)
//        return HStack {
//            AsyncImage(url: URL(string: character.iconImage ?? "")) { phase in
//                switch phase {
//                case .empty:
//                    ProgressView()
//                        .frame(width: 50, height: 50)
//                case .success(let image):
//                    image.resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 50, height: 50)
//                        .cornerRadius(8)
//                case .failure:
//                    Image(systemName: "xmark.circle")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 50, height: 50)
//                @unknown default:
//                    EmptyView()
//                        .frame(width: 50, height: 50)
//                }
//            }
//            Text(character.name ?? "Emma")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding(.leading, 10)
//            Spacer()
//        }
//        .padding()
//        .background(Color.gray)
//        .cornerRadius(8)
//        .padding(.horizontal)
//    }
//
//    private func printCharacterInfo(_ character: Character) {
//        print("Rendering character: \(character.name ?? "Emma")")
//    }
//}
//
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.characters.isEmpty ? Character.defaultCharacters : viewModel.characters) { character in
                        CharacterRow(character: character)
                            .frame(height: UIScreen.main.bounds.height / 5)
                    }
                }
                .padding()
            }
            .navigationTitle("Characters")
            .onAppear {
                print("ContentView appeared")
                viewModel.fetchCharacters()
            }
        }
    }
}

struct CharacterRow: View {
    let character: Character

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.iconImage ?? "")) { phase in
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
            VStack(alignment: .leading) {
                Text(character.name ?? "Unknown")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(character.role ?? "Unknown Role")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
