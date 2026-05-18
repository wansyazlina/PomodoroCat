//
//  WindowAccessor.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 18/05/2026.
//
import SwiftUI
import AppKit

struct WindowAccessor: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let view = NSView()

        DispatchQueue.main.async {
            if let window = view.window {
                window.titleVisibility = .hidden
                window.titlebarAppearsTransparent = true

                window.standardWindowButton(.closeButton)?.isHidden = true
                window.standardWindowButton(.miniaturizeButton)?.isHidden = true
                window.standardWindowButton(.zoomButton)?.isHidden = true

                window.styleMask.insert(.fullSizeContentView)

                // This removes the actual title bar area
                window.styleMask.remove(.titled)

                window.isMovableByWindowBackground = false
                window.backgroundColor = .clear
            }
        }

        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
