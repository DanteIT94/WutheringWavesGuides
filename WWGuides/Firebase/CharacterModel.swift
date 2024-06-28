//
//  CharacterModel.swift
//  WWGuides
//
//  Created by Денис on 25.06.2024.
//
import Foundation
import FirebaseFirestoreSwift

struct Best4CostEcho: Codable {
    var top1: EchoDetail?
    var top2: EchoDetail?
}

struct EchoDetail: Codable {
    var icon: String?
    var info: String?
    var name: String?
}

struct BestTeams: Codable {
    var team1: TeamDetail?
    var team2: TeamDetail?
}

struct TeamDetail: Codable {
    var char1: TeamMember?
    var char2: TeamMember?
    var char3: TeamMember?
    var info: String?
}

struct TeamMember: Codable {
    var icon: String?
    var name: String?
}

struct BestWeapons: Codable {
    var top1: WeaponDetail?
    var top2: WeaponDetail?
    var top3: WeaponDetail?
}

struct WeaponDetail: Codable {
    var image: String?
    var info: String?
    var name: String?
}

struct ProsCons: Codable {
    var pros: String?
    var cons: String?
}

struct Rotation: Codable {
    var info: String?
    var rotation: String?
}

struct Character: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String?
    var best4CostEchoes: Best4CostEcho?
    var echoesStats: String?
    var bestSubStats: String?
    var bestTeams: BestTeams?
    var bestWeapons: BestWeapons?
    var element: String?
    var fullImage: String?
    var guideImage: String?
    var iconImage: String?
    var prosCons: ProsCons?
    var rarity: String?
    var role: String?
    var rotation: Rotation?
    var tier: String?

    init(id: String?, dictionary: [String: Any]) {
        self.id = id
        self.name = dictionary["name"] as? String

        if let best4CostEchoesDict = dictionary["best4CostEchoes"] as? [String: Any] {
            self.best4CostEchoes = Best4CostEcho(
                top1: (best4CostEchoesDict["top1"] as? [String: Any]).flatMap { EchoDetail(dictionary: $0) },
                top2: (best4CostEchoesDict["top2"] as? [String: Any]).flatMap { EchoDetail(dictionary: $0) }
            )
        }

        self.echoesStats = dictionary["echoesStats"] as? String
        self.bestSubStats = dictionary["bestSubStats"] as? String

        if let bestTeamsDict = dictionary["bestTeams"] as? [String: Any] {
            self.bestTeams = BestTeams(
                team1: (bestTeamsDict["team1"] as? [String: Any]).flatMap { TeamDetail(dictionary: $0) },
                team2: (bestTeamsDict["team2"] as? [String: Any]).flatMap { TeamDetail(dictionary: $0) }
            )
        }

        if let bestWeaponsDict = dictionary["bestWeapons"] as? [String: Any] {
            self.bestWeapons = BestWeapons(
                top1: (bestWeaponsDict["top1"] as? [String: Any]).flatMap { WeaponDetail(dictionary: $0) },
                top2: (bestWeaponsDict["top2"] as? [String: Any]).flatMap { WeaponDetail(dictionary: $0) },
                top3: (bestWeaponsDict["top3"] as? [String: Any]).flatMap { WeaponDetail(dictionary: $0) }
            )
        }

        self.element = dictionary["element"] as? String
        self.fullImage = dictionary["fullImage"] as? String
        self.guideImage = dictionary["guideImage"] as? String
        self.iconImage = dictionary["iconImage"] as? String

        if let prosConsDict = dictionary["prosCons"] as? [String: Any] {
            self.prosCons = ProsCons(
                pros: prosConsDict["pros"] as? String,
                cons: prosConsDict["cons"] as? String
            )
        }

        self.rarity = dictionary["rarity"] as? String
        self.role = dictionary["role"] as? String

        if let rotationDict = dictionary["rotation"] as? [String: Any] {
            self.rotation = Rotation(
                info: rotationDict["info"] as? String,
                rotation: rotationDict["rotation"] as? String
            )
        }

        self.tier = dictionary["tier"] as? String
    }
}

extension EchoDetail {
    init?(dictionary: [String: Any]) {
        guard
            let icon = dictionary["icon"] as? String,
            let info = dictionary["info"] as? String,
            let name = dictionary["name"] as? String
        else {
            return nil
        }
        self.icon = icon
        self.info = info
        self.name = name
    }
}

extension TeamDetail {
    init?(dictionary: [String: Any]) {
        guard
            let char1Dict = dictionary["char1"] as? [String: Any],
            let char2Dict = dictionary["char2"] as? [String: Any],
            let char3Dict = dictionary["char3"] as? [String: Any],
            let info = dictionary["info"] as? String
        else {
            return nil
        }
        self.char1 = TeamMember(dictionary: char1Dict)
        self.char2 = TeamMember(dictionary: char2Dict)
        self.char3 = TeamMember(dictionary: char3Dict)
        self.info = info
    }
}

extension TeamMember {
    init?(dictionary: [String: Any]) {
        guard
            let icon = dictionary["icon"] as? String,
            let name = dictionary["name"] as? String
        else {
            return nil
        }
        self.icon = icon
        self.name = name
    }
}

extension WeaponDetail {
    init?(dictionary: [String: Any]) {
        guard
            let image = dictionary["image"] as? String,
            let info = dictionary["info"] as? String,
            let name = dictionary["name"] as? String
        else {
            return nil
        }
        self.image = image
        self.info = info
        self.name = name
    }
}

extension Rotation {
    init?(dictionary: [String: Any]) {
        guard
            let info = dictionary["info"] as? String,
            let rotation = dictionary["rotation"] as? String
        else {
            return nil
        }
        self.info = info
        self.rotation = rotation
    }
}

extension ProsCons {
    init?(dictionary: [String: Any]) {
        guard
            let pros = dictionary["pros"] as? String,
            let cons = dictionary["cons"] as? String
        else {
            return nil
        }
        self.pros = pros
        self.cons = cons
    }
}

extension Character {
    static let defaultCharacters: [Character] = [
        Character(
            id: UUID().uuidString,
            dictionary: [
                "name": "Default Character 1",
                "best4CostEchoes": [
                    "top1": ["icon": "", "info": "", "name": ""],
                    "top2": ["icon": "", "info": "", "name": ""]
                ],
                "echoesStats": "",
                "bestSubStats": "",
                "bestTeams": [
                    "team1": [
                        "char1": ["icon": "", "name": ""],
                        "char2": ["icon": "", "name": ""],
                        "char3": ["icon": "", "name": ""],
                        "info": ""
                    ],
                    "team2": [
                        "char1": ["icon": "", "name": ""],
                        "char2": ["icon": "", "name": ""],
                        "char3": ["icon": "", "name": ""],
                        "info": ""
                    ]
                ],
                "bestWeapons": [
                    "top1": ["image": "", "info": "", "name": ""],
                    "top2": ["image": "", "info": "", "name": ""],
                    "top3": ["image": "", "info": "", "name": ""]
                ],
                "element": "",
                "fullImage": "",
                "guideImage": "",
                "iconImage": "",
                "prosCons": ["pros": "", "cons": ""],
                "rarity": "",
                "role": "",
                "rotation": ["info": "", "rotation": ""],
                "tier": ""
            ]
        ),
        Character(
            id: UUID().uuidString,
            dictionary: [
                "name": "Default Character 2",
                "best4CostEchoes": [
                    "top1": ["icon": "", "info": "", "name": ""],
                    "top2": ["icon": "", "info": "", "name": ""]
                ],
                "echoesStats": "",
                "bestSubStats": "",
                "bestTeams": [
                    "team1": [
                        "char1": ["icon": "", "name": ""],
                        "char2": ["icon": "", "name": ""],
                        "char3": ["icon": "", "name": ""],
                        "info": ""
                    ],
                    "team2": [
                        "char1": ["icon": "", "name": ""],
                        "char2": ["icon": "", "name": ""],
                        "char3": ["icon": "", "name": ""],
                        "info": ""
                    ]
                ],
                "bestWeapons": [
                    "top1": ["image": "", "info": "", "name": ""],
                    "top2": ["image": "", "info": "", "name": ""],
                    "top3": ["image": "", "info": "", "name": ""]
                ],
                "element": "",
                "fullImage": "",
                "guideImage": "",
                "iconImage": "",
                "prosCons": ["pros": "", "cons": ""],
                "rarity": "",
                "role": "",
                "rotation": ["info": "", "rotation": ""],
                "tier": ""
            ]
        )
    ]
}
