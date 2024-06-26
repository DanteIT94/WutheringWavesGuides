//
//  FirebaseManager.swift
//  WWGuides
//
//  Created by Денис on 25.06.2024.
//

import Foundation
import FirebaseFirestore
import Combine

class FirebaseManager: ObservableObject {
    private let db = Firestore.firestore()

    //Функция получения данных с FB
    func fetchCharacters(complition: @escaping ([Character]?, Error?) -> Void) {
        print("Fetching characters from Firestore...")
        db.collection("WWCharacters").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching characters: \(error)")
                complition(nil, error)
            } else {
                let characters = querySnapshot?.documents.compactMap { document -> Character? in
                    print("Fetched document: \(document.documentID)")
                    return try? document.data(as: Character.self)
                }
                print("Successfully fetched characters: \(characters?.count ?? 0)")
                complition(characters, nil)
            }
            
        }
    }
}

