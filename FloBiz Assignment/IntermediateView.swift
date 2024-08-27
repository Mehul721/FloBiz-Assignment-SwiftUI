//
//  IntermediateView.swift
//  FloBiz Assignment
//
//  Created by Mehul Jain on 27/08/24.
//

import SwiftUI

struct IntermediateView: View {
    @State private var showCarousel = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
                           .ignoresSafeArea()
            HStack {
                Button(action: {
                    showCarousel = true
                }) {
                    Text("Open Carousel")
                        .font(.title)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black, Color.gray]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .fullScreenCover(isPresented: $showCarousel) {
            CarouselView(imagesNames: ["butcher", "hughei", "frenchie", "mm"], isPresented: $showCarousel)
                .transition(.move(edge: .bottom)) // Bottom-up animation
                .ignoresSafeArea() // Ensures the view covers the entire screen
        }
    }
}
