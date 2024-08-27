//
//  Home.swift
//  FloBiz Assignment
//
//  Created by Mehul Jain on 26/08/24.
//

import SwiftUI

struct Home: View {
    var imagesNames: [String] = ["butcher", "hughei", "frenchie", "mm"]
    @ObservedObject var storyTimer: StoryTimer = StoryTimer(items: 4, interval: 3.0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                
                Image(self.imagesNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    
                    .contentShape(Rectangle())
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: self.storyTimer.progress)

                
                HStack(alignment:.center, spacing: 4) {
                    ForEach(self.imagesNames.indices, id: \.self) { index in
                        LoadingRectangle(progress: min(max(CGFloat(self.storyTimer.progress) - CGFloat(index), 0.0), 1.0))
                            .frame(width: nil, height: 2.5, alignment: .leading)
                            .animation(.linear, value: self.storyTimer.progress)
                    }
                }
                .padding(.vertical,2)
            }
            
            .onTapGesture { location in
                handleTap(location: location, geometry: geometry)
            }
        }
        .onAppear { self.storyTimer.start() }
    }
    
    private func handleTap(location: CGPoint, geometry: GeometryProxy) {
        let midX = geometry.size.width / 2
        if location.x > midX {
            
            if Int(self.storyTimer.progress) < self.imagesNames.count - 1 {
                withAnimation {
                    self.storyTimer.resetProgressForNextImage(startAt: Int(self.storyTimer.progress) + 1)
                }
            }
        } else {
            // Tap on the left side
            if Int(self.storyTimer.progress) > 0 {
                withAnimation {
                    self.storyTimer.resetProgressForNextImage(startAt: Int(self.storyTimer.progress) - 1)
                }
            }
        }
    }
}
