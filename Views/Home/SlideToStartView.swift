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
    private let barHeight: CGFloat = 18
    private let knobSize: CGFloat = 42

    var body: some View {
        ZStack(alignment: .leading) {
            // Track/bar
            Capsule()
                .fill(Color.black.opacity(0.2))
                .frame(width: barWidth, height: barHeight)
                .overlay(
                    Capsule()
                        .stroke(Color.black, lineWidth: 2)
                )

            // Filled progress
            Capsule()
                .fill(Color.black)
                .frame(width: dragOffset + knobSize / 2, height: barHeight)

            // Slider knob
            Circle()
                .fill(Color.white)
                .frame(width: knobSize, height: knobSize)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 3)
                )
                .overlay(
                    Text(">")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .foregroundStyle(.black)
                )
                .offset(x: dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let maxOffset = barWidth - knobSize
                            dragOffset = min(max(value.translation.width, 0), maxOffset)
                        }
                        .onEnded { _ in
                            let maxOffset = barWidth - knobSize

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
        .frame(width: barWidth, height: knobSize)
    }
}

#Preview {
    SlideToStartView {
        print("Go to next page")
    }
    .padding()
}
