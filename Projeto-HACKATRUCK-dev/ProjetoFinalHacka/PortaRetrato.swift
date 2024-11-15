//
//  PortaRetrato.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 14/11/24.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct PortaRetrato: View {
    @State private var orientation = UIDeviceOrientation.portrait
    @Binding var isTabViewShown: Bool
    
    var body: some View {
        Group {
            if orientation.isPortrait {
                Image(.img1)
//                    .onAppear() {
//                        isTabViewShown = true
//                    }
            } else if orientation.isLandscape { //
                Image(.img1)
//                    .onAppear() {
//                        isTabViewShown = false
//                    }
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

//#Preview {
//    PortaRetrato()
//}
