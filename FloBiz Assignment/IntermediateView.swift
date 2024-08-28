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
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(20)
                }}}
        .fullScreenCover(isPresented: $showCarousel) {
            CarouselView(imagesNames: ["butcher", "hughei", "frenchie", "mm"], isPresented: $showCarousel)
                .transition(.move(edge: .bottom))
                .ignoresSafeArea()
        }
        }
        
    }
