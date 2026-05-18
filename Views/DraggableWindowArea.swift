//
//  DraggableWindowArea.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 18/05/2026.
//
import SwiftUI
import AppKit

struct DraggableWindowArea: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        DraggableNSView()
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

final class DraggableNSView: NSView {
    override func mouseDown(with event: NSEvent) {
        window?.performDrag(with: event)
    }
}
