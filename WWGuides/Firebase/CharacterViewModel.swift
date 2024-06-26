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
        firestoreManager.fetchCharacters { [weak self] characters, error in
            if let error = error {
                print("Ошибка получения персонажей: \(error)")
            } else {
                self?.characters = characters ?? []
            }
            
        }
    }
}
