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

// Generate 3^9 elements
let ValidMoves: [GameState] = {
    let totalElements = Int(pow(3.0, 9.0)) // Calculate 3^9
    return (0..<totalElements).map { index in
        // Example initialization: use index to vary properties
        GameState(boardState: UInt8(index % 256), victoryDistance: UInt8((index / 256) % 256))
    }
}()

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

// Example usage: Print some elements of ValidMoves
#Preview {
    print("First GameState: BoardState = \(ValidMoves[0].BoardState), VictoryDistance = \(ValidMoves[0].VictoryDistance)")
    print("Last GameState: BoardState = \(ValidMoves[ValidMoves.count - 1].BoardState), VictoryDistance = \(ValidMoves[ValidMoves.count - 1].VictoryDistance)")
    return ContentView()
}
