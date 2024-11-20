//
//  ContentView.swift
//  TicTacToe
//
//  Created by Nathaniael Bolt on 11/19/24.
//

import SwiftUI

// Define the GameState class
class GameState {
    var BoardState: UInt8
    var VictoryDistance: UInt8

    init(boardState: UInt8, victoryDistance: UInt8) {
        self.BoardState = boardState
        self.VictoryDistance = victoryDistance
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// Example usage of the GameState class
#Preview {
    let exampleGameState = GameState(boardState: 0x0F, victoryDistance: 0x03) // Example values
    print("BoardState: \(exampleGameState.BoardState), VictoryDistance: \(exampleGameState.VictoryDistance)")
    return ContentView()
}
