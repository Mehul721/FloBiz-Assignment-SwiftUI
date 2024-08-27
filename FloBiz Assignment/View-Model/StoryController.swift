//
//  StoryController.swift
//  FloBiz Assignment
//
//  Created by Mehul Jain on 27/08/24.
//

import SwiftUI
import Combine

class StoryController: ObservableObject {
    @Published var progress: Double = 0
    private var storyTimer: StoryTimer

    init(items: Int, interval: TimeInterval) {
        self.storyTimer = StoryTimer(items: items, interval: interval)
        self.storyTimer.start()
        self.storyTimer.$progress
            .assign(to: &$progress)
    }

    func handleLeftTap() {
        if Int(progress) > 0 {
            resetProgress(for: Int(progress) - 1)
        }
    }

    func handleRightTap(imagesCount: Int) {
        if Int(progress) < imagesCount - 1 {
            resetProgress(for: Int(progress) + 1)
        }
    }

    private func resetProgress(for index: Int) {
        withAnimation {
            storyTimer.resetProgressForNextImage(startAt: index)
        }
    }
}
