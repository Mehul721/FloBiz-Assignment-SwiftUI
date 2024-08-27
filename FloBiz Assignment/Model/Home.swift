//
//  Home.swift
//  FloBiz Assignment
//
//  Created by Mehul Jain on 26/08/24.
//

import SwiftUI

struct Home: View {
    @StateObject private var storyController: StoryController

    init() {
        _storyController = StateObject(wrappedValue: StoryController(items: 4, interval: 3.0))
    }

    var body: some View {
        StoryProgressView(imagesNames: ["butcher", "hughei", "frenchie", "mm"], progress: $storyController.progress)
            .onTapGesture { location in
                handleTap(location: location)
            }
    }

    private func handleTap(location: CGPoint) {
        let screenWidth = UIScreen.main.bounds.width
        let midX = screenWidth / 2
        if location.x > midX {
            storyController.handleRightTap(imagesCount: 4)
        } else {
            storyController.handleLeftTap()
        }
    }
}
