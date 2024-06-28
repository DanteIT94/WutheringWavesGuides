//
//  FirebaseManager.swift
//  WWGuides
//
//  Created by Денис on 25.06.2024.
//
//
//
//import Foundation
//import FirebaseFirestore
//import Combine
//
//class FirebaseManager: ObservableObject {
//    private let db = Firestore.firestore()
//
//    func fetchCharacters(completion: @escaping ([Character]?, Error?) -> Void) {
//        print("Fetching characters from Firestore...")
//        db.collection("WWCharacters").getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error fetching characters: \(error.localizedDescription)")
//                completion(nil, error)
//            } else {
//                let characters = querySnapshot?.documents.compactMap { document -> Character? in
//                    print("Fetched document: \(document.documentID)")
//                    return try? document.data(as: Character.self)
//                }
//                print("Successfully fetched characters: \(characters?.count ?? 0)")
//                completion(characters, nil)
//            }
//        }
//    }
//}

import Foundation
import FirebaseDatabase
import Combine

class FirebaseManager: ObservableObject {
    private let db = Database.database().reference()

    func fetchCharacters(completion: @escaping ([Character]?, Error?) -> Void) {
        print("Fetching characters from Firebase Realtime Database...")
        db.child("WWCharacters").observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value as? [String: Any] else {
                print("Error fetching characters: Snapshot was nil or not convertible")
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Data conversion error"]))
                return
            }
            let characters = value.compactMap { (key, value) -> Character? in
                guard let characterData = value as? [String: Any] else { return nil }
                return Character(id: key, dictionary: characterData)
            }
            print("Successfully fetched characters: \(characters.count)")
            completion(characters, nil)
        }
    }
}
