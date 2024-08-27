//
//  StoryTimer.swift
//  FloBiz Assignment
//
//  Created by Mehul Jain on 26/08/24.
//
import SwiftUI
import Foundation
import Combine

class StoryTimer: ObservableObject {
    @Published var progress: Double = 0
    private var interval: TimeInterval
    private var max: Int
    private var cancellable: Cancellable?
    private let publisher: Timer.TimerPublisher

    init(items: Int, interval: TimeInterval) {
        self.max = items
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
    }

    func start() {
        self.cancellable = self.publisher.autoconnect().sink { _ in
            var newProgress = self.progress + (0.1 / self.interval)
            if newProgress >= Double(self.max) {
                newProgress = 0
            }
            self.progress = newProgress
        }
    }

    func resetProgressForNextImage(startAt index: Int) {
        self.progress = Double(index)
    }

    func stop() {
        self.cancellable?.cancel()
    }
}
