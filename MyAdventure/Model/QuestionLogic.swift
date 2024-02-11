//
//  QuestionLogic.swift
//  MyAdventure
//
//  Created by Maor Niv on 2/10/24.
//

import Foundation

struct AdventureChoice {
    let title: String
    let outcome: String
    let successful: Bool
}
    
    class AdventureModel {
        let layer1choices = [
            AdventureChoice(title:"Go left.", outcome:"You run into a small security guard",successful: true),
            AdventureChoice(title:"Go right.", outcome:"There is a huge bodygaurd fully armed",successful: true)
        ]
        
        let layer2choices = [AdventureChoice(title:"Hit him.",outcome:"You escape for the mean time but you have to move quickly",successful: true),AdventureChoice(title:"Spray Him.",outcome:"His eyes hurt he leaps at you but misses",successful: true),
        ]
        
        let layer3choices = [AdventureChoice(title:"Leave through the lobby.",outcome:"You escape!",successful: true), AdventureChoice(title:"Leave through the back door.",outcome:"There are a bunch of cops!",successful: false),
        ]
        
        func getChoices(forLayer layer: Int) -> [AdventureChoice] {
            switch layer {
            case 1:
                return layer1choices
            case 2:
                return layer2choices
            case 3:
                return layer3choices
            default:
                return []
            }
        }
    }
