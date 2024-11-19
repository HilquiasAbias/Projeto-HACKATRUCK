
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

struct PhotoFrameView: View {
    @State private var orientation = UIDeviceOrientation.portrait
    //    @Binding var isTabViewShown: Bool
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        Group {
            if orientation.isPortrait {
                ScrollView(.vertical) {
                    ForEach(userViewModel.users, id: \.self) { m in
                        ForEach(m.moments, id:\.self) { c in
                            VStack {
                                AsyncImage(url: URL(string: c.image)){
                                    image in image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
    //                                    .frame(width: 200, height: 300)
                                } placeholder: {Color.gray}
                            }
                        }
                    }
                }
            } else if orientation.isLandscape { //
                ScrollView() {
                    ForEach(userViewModel.users, id: \.self) { m in
                        ForEach(m.moments, id:\.self) { c in
                            HStack {
                                AsyncImage(url: URL(string: c.image)){
                                    image in image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
    //                                    .frame(width: 200, height: 300)
                                } placeholder: {Color.gray}
                            }
                        }
                    }
                }
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
        .onAppear {
            userViewModel.getUsers()
        }
    }
}

#Preview {
    PhotoFrameView()
}

