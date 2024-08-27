//
//  StoryProgressView.swift
//  FloBiz Assignment
//
//  Created by Mehul Jain on 27/08/24.
//

import SwiftUI

struct StoryProgressView: View {
    var imagesNames: [String]
    @Binding var progress: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Image(imagesNames[Int(progress)])
                    .resizable()
                    .ignoresSafeArea(edges: .all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .contentShape(Rectangle())
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: progress)
                
                HStack(alignment: .center, spacing: 4) {
                    ForEach(imagesNames.indices, id: \.self) { index in
                        LoadingRectangle(progress: min(max(CGFloat(progress) - CGFloat(index), 0.0), 1.0))
                            .frame(height: 2.5)
                            .animation(.linear, value: progress)
                    }
                }
                .padding(.vertical, 2)
            }
        }
    }
}
