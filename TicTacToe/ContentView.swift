//
//  ContentView.swift
//  TicTacToe
//
//  Created by Nathaniael Bolt on 11/19/24.
//

import SwiftUI

/// A class to represent the state of a square with a four-bit integer.
class SquareState: ObservableObject {
    /// A property that holds a four-bit integer (0–15).
    @Published var value: Int {
        didSet {
            // Ensure the value stays within the range of 0 to 15.
            if value < 0 { value = 0 }
            if value > 15 { value = 15 }
        }
    }
    
    init(value: Int) {
        self.value = value.clamped(to: 0...15) // Ensure the initial value is within the valid range.
    }
}

extension Comparable {
    /// A helper method to clamp a value to a given range.
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}

/// A class to represent a 3x3 board of square states.
class BoardStates: ObservableObject, Identifiable {
    /// A 3x3 array of `SquareState` objects.
    @Published var board: [[SquareState]]
    
    init(boardValues: [[Int]]) {
        // Initialize the board with a 3x3 array of `SquareState` objects based on input values.
        self.board = boardValues.map { row in
            row.map { SquareState(value: $0) }
        }
    }
    
    /// Convenience initializer to create an empty board (all 0s).
    convenience init() {
        self.init(boardValues: Array(repeating: Array(repeating: 0, count: 3), count: 3))
    }
}

/// A helper function to generate all possible board configurations for 3^9 combinations.
func generateVictoryPaths() -> [BoardStates] {
    let combinations = (0..<3).flatMap { x in
        (0..<3).flatMap { y in
            (0..<3).flatMap { z in
                (0..<3).flatMap { w in
                    (0..<3).flatMap { v in
                        (0..<3).flatMap { u in
                            (0..<3).flatMap { t in
                                (0..<3).flatMap { s in
                                    (0..<3).map { r in
                                        [
                                            [x, y, z],
                                            [w, v, u],
                                            [t, s, r]
                                        ]
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return combinations.map { BoardStates(boardValues: $0) }
}

// Create the global VictoryPaths array containing all possible board states.
let VictoryPaths: [BoardStates] = generateVictoryPaths()

struct ContentView: View {
    var body: some View {
        Text("VictoryPaths Count: \(VictoryPaths.count)")
            .padding()
    }
}

#Preview {
    ContentView()
}
