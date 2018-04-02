//
//  Sign.swift
//  RPS
//
//  Created by Andrew Jabbour on 4/2/18.
//  Copyright © 2018 Andrew Jabbour. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum Sign{
    case rock, paper, scissors
}

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

func getGameState(mySign: Sign, oppSign: Sign) -> GameState {
    switch mySign {
    case .rock:
        switch oppSign {
        case .rock: return .draw
        case .paper: return .lose
        case .scissors: return .win
        }
    case .paper:
        switch oppSign {
        case .rock: return .win
        case .paper: return .draw
        case .scissors: return .lose
        }
    case .scissors:
        switch oppSign {
        case .rock: return .lose
        case .paper: return .win
        case .scissors: return .draw
        }
    }
}
