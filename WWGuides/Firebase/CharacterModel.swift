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
    
    var name: String
    var best4CostEchoesTop1Icon: String
    var best4CostEchoesTop1Info: String
    var best4CostEchoesTop1Name: String
    var best4CostEchoesTop2Icon: String
    var best4CostEchoesTop2Info: String
    var best4CostEchoesTop2Name: String
    var bestChar: String
    var bestTeamsTeam1Char1Icon: String
    var bestTeamsTeam1Char1Name: String
    var bestTeamsTeam1Char2Icon: String
    var bestTeamsTeam1Char2Name: String
    var bestTeamsTeam1Char3Icon: String
    var bestTeamsTeam1Char3Name: String
    var bestTeamsTeam1Info: String
    var bestTeamsTeam2Char1Icon: String
    var bestTeamsTeam2Char1Name: String
    var bestTeamsTeam2Char2Icon: String
    var bestTeamsTeam2Char2Name: String
    var bestTeamsTeam2Char3Icon: String
    var bestTeamsTeam2Char3Name: String
    var bestTeamsTeam2Info: String
    var bestWeaponsTop1Image: String
    var bestWeaponsTop1Info: String
    var bestWeaponsTop1Name: String
    var bestWeaponsTop2Image: String
    var bestWeaponsTop2Info: String
    var bestWeaponsTop2Name: String
    var bestWeaponsTop3: String
    var element: String
    var fullImage: String
    var guideImage: String
    var charIcon: String
    var pros: String
    var cons: String
    var rarity: String
    var role: String
    var rotationInfo: String
    var rotation: String
    var tier: String
    
}
