//
//  PuraceImageViewerModifier.swift
//  
//
//  Created by Juan Hurtado on 26/06/22.
//

import Foundation
import SwiftUI

struct PuraceImageViewerModifier: ViewModifier {
    let url: URL?
    @Binding var isVisible: Bool
    
    init(url: URL?, isVisible: Binding<Bool>) {
        self.url = url
        self._isVisible = isVisible
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isVisible {
                PuraceImageViewer(url: url, isVisible: $isVisible)
            }
        }
    }
}

public extension View {
    func imageViewer(url: URL?, isVisible: Binding<Bool>) -> some View {
        modifier(PuraceImageViewerModifier(url: url, isVisible: isVisible))
    }
}
