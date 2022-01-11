//
//  AvatarView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct AvatarView: View {
        @State var name = ""
        var body: some View {
                Image(name)
                        .clipShape(Circle())
                        .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                    .shadow(radius: 7)
        }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}
