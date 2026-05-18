//
//  WindowControls.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 18/05/2026.
//
import SwiftUI

struct WindowControls: View {
    var body: some View {
        HStack(spacing: 8) {
            Button("×") {
                NSApplication.shared.terminate(nil)
            }

            Button("−") {
                NSApplication.shared.keyWindow?.miniaturize(nil)
            }
        }
        .buttonStyle(.plain)
        .font(.custom("Silkscreen", size: 16))
        .padding(6)
        .foregroundStyle(Color.black) //color of the button font
        .background(Color(red: 1.0, green: 0.85, blue: 0.9)) // lighter pink// color of button bg
        .border(Color.black, width: 2)
    }
}

