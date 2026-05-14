//
//  ButtonView.swift
//  PomodoroCat
//

import SwiftUI

struct ButtonView: View {
    
    var body: some View {
        
        ZStack {
            
            // Background
            Color.black
                .ignoresSafeArea()
            
            // Pixel Button
            Button {
                print("Pomodoro Started")
                
            } label: {
                
                Text("START FOCUS")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 18)
                    .background(
                        
                        ZStack {
                            
                            // Main Button Background
                            Rectangle()
                                .fill(Color(red: 0.15, green: 0.15, blue: 0.15))
                            
                            // Inner Highlight
                            Rectangle()
                                .stroke(Color.gray, lineWidth: 2)
                                .padding(4)
                            
                            // Outer Pixel Border
                            Rectangle()
                                .stroke(Color.white, lineWidth: 4)
                        }
                    )
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    ButtonView()
}
