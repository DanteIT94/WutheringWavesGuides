//
//  CharacterViewModel.swift
//  WWGuides
//
//  Created by Денис on 26.06.2024.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    private var firestoreManager = FirebaseManager()
    
    func fetchCharacters() {
        print("Calling fetchCharacters in CharactersViewModel...")

        firestoreManager.fetchCharacters { [weak self] characters, error in
            if let error = error {
                print("Ошибка получения персонажей: \(error)")
            } else {
                print("Characters fetched: \(characters?.count ?? 0)")
                self?.characters = characters ?? []
            }
            
        }
    }
}
