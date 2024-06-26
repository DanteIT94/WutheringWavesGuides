//
//  CharacterModel.swift
//  WWGuides
//
//  Created by Денис on 25.06.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Character: Identifiable, Codable {
    @DocumentID var id: String?
    
    var name: String?
    var best4CostEchoesTop1Icon: String?
    var best4CostEchoesTop1Info: String?
    var best4CostEchoesTop1Name: String?
    var best4CostEchoesTop2Icon: String?
    var best4CostEchoesTop2Info: String?
    var best4CostEchoesTop2Name: String?
    var bestChar: String?
    var bestTeamsTeam1Char1Icon: String?
    var bestTeamsTeam1Char1Name: String?
    var bestTeamsTeam1Char2Icon: String?
    var bestTeamsTeam1Char2Name: String?
    var bestTeamsTeam1Char3Icon: String?
    var bestTeamsTeam1Char3Name: String?
    var bestTeamsTeam1Info: String?
    var bestTeamsTeam2Char1Icon: String?
    var bestTeamsTeam2Char1Name: String?
    var bestTeamsTeam2Char2Icon: String?
    var bestTeamsTeam2Char2Name: String?
    var bestTeamsTeam2Char3Icon: String?
    var bestTeamsTeam2Char3Name: String?
    var bestTeamsTeam2Info: String?
    var bestWeaponsTop1Image: String?
    var bestWeaponsTop1Info: String?
    var bestWeaponsTop1Name: String?
    var bestWeaponsTop2Image: String?
    var bestWeaponsTop2Info: String?
    var bestWeaponsTop2Name: String?
    var bestWeaponsTop3: String?
    var element: String?
    var fullImage: String?
    var guideImage: String?
    var charIcon: String?
    var pros: String?
    var cons: String?
    var rarity: String?
    var role: String?
    var rotationInfo: String?
    var rotation: String?
    var tier: String?
    
}

extension Character {
    static let defaultCharacters: [Character] = [
        Character(id: "1", name: "Dima", best4CostEchoesTop1Icon: "", best4CostEchoesTop1Info: "", best4CostEchoesTop1Name: "", best4CostEchoesTop2Icon: "", best4CostEchoesTop2Info: "", best4CostEchoesTop2Name: "", bestChar: "", bestTeamsTeam1Char1Icon: "", bestTeamsTeam1Char1Name: "", bestTeamsTeam1Char2Icon: "", bestTeamsTeam1Char2Name: "", bestTeamsTeam1Char3Icon: "", bestTeamsTeam1Char3Name: "", bestTeamsTeam1Info: "", bestTeamsTeam2Char1Icon: "", bestTeamsTeam2Char1Name: "", bestTeamsTeam2Char2Icon: "", bestTeamsTeam2Char2Name: "", bestTeamsTeam2Char3Icon: "", bestTeamsTeam2Char3Name: "", bestTeamsTeam2Info: "", bestWeaponsTop1Image: "", bestWeaponsTop1Info: "", bestWeaponsTop1Name: "", bestWeaponsTop2Image: "", bestWeaponsTop2Info: "", bestWeaponsTop2Name: "", bestWeaponsTop3: "", element: "", fullImage: "", guideImage: "",charIcon: "https://firebasestorage.googleapis.com/v0/b/wwguides-235bd.appspot.com/o/CharIcons%2Faalto_icon.jpeg?alt=media&token=fe0a26de-8444-4a36-80f8-e5e6f7d01ecc", pros: "", cons: "", rarity: "", role: "", rotationInfo: "", rotation: "", tier: ""),
        Character(id: "2", name: "Andrey", best4CostEchoesTop1Icon: "", best4CostEchoesTop1Info: "", best4CostEchoesTop1Name: "", best4CostEchoesTop2Icon: "", best4CostEchoesTop2Info: "", best4CostEchoesTop2Name: "", bestChar: "", bestTeamsTeam1Char1Icon: "", bestTeamsTeam1Char1Name: "", bestTeamsTeam1Char2Icon: "", bestTeamsTeam1Char2Name: "", bestTeamsTeam1Char3Icon: "", bestTeamsTeam1Char3Name: "", bestTeamsTeam1Info: "", bestTeamsTeam2Char1Icon: "", bestTeamsTeam2Char1Name: "", bestTeamsTeam2Char2Icon: "", bestTeamsTeam2Char2Name: "", bestTeamsTeam2Char3Icon: "", bestTeamsTeam2Char3Name: "", bestTeamsTeam2Info: "", bestWeaponsTop1Image: "", bestWeaponsTop1Info: "", bestWeaponsTop1Name: "", bestWeaponsTop2Image: "", bestWeaponsTop2Info: "", bestWeaponsTop2Name: "", bestWeaponsTop3: "", element: "", fullImage: "", guideImage: "",charIcon: "https://firebasestorage.googleapis.com/v0/b/wwguides-235bd.appspot.com/o/CharIcons%2Fbaizhi_icon.jpeg?alt=media&token=243dfd09-abea-44a1-9ab5-7369ef8e1d04", pros: "", cons: "", rarity: "", role: "", rotationInfo: "", rotation: "", tier: "")
    ]
}
