//
//  SlideToStartView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 12/05/2026.
//
import SwiftUI

struct SlideToStartView: View {
    var onComplete: () -> Void

    @State private var dragOffset: CGFloat = 0

    private let barWidth: CGFloat = 220
    private let barHeight: CGFloat = 20
    private let knobSize: CGFloat = 45
    private let sliderHeight: CGFloat = 45

    private var maxOffset: CGFloat {
        barWidth - knobSize
    }

    var body: some View {
        ZStack {
            // Pixelated slider bar only
            sliderBar
                .layerEffect(
                    ShaderLibrary.pixelate(.float(4)),
                    maxSampleOffset: .zero
                )

            // Star knob image, not affected by Metal shader
            starKnob
        }
        .frame(width: barWidth, height: sliderHeight)
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = min(max(value.translation.width, 0), maxOffset)
                }
                .onEnded { _ in
                    if dragOffset >= maxOffset * 0.85 {
                        withAnimation(.easeOut(duration: 0.2)) {
                            dragOffset = maxOffset
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            onComplete()
                        }
                    } else {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            dragOffset = 0
                        }
                    }
                }
        )
    }

    private var sliderBar: some View {
        ZStack(alignment: .leading) {
            // Background track
            Capsule()
                .fill(Color(red: 0.68, green: 0.64, blue: 0.74))
                .frame(width: barWidth, height: barHeight)
                .overlay(
                    Capsule()
                        .stroke(Color.black, lineWidth: 4)
                )

            // Pink filled progress
            Capsule()
                .fill(Color(red: 1, green: 172/255, blue: 250/255))
                .frame(
                    width: max(dragOffset + knobSize / 2, barHeight),
                    height: barHeight
                )
                .overlay(
                    Capsule()
                        .stroke(Color.black, lineWidth: 4)
                )
                .mask(
                    Capsule()
                        .frame(width: barWidth, height: barHeight)
                )
        }
    }

    private var starKnob: some View {
        HStack {
            Image("pixelStar")
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: knobSize, height: knobSize)
                .offset(x: dragOffset)

            Spacer()
        }
        .frame(width: barWidth, alignment: .leading)
    }
}

#Preview {
    SlideToStartView {
        print("Go to next page")
    }
    
    .background(Color.white)
}
