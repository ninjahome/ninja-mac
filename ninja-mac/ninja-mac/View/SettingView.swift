//
//  Setting.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct SettingView: View {
        @Namespace var topID
        @Namespace var bottomID
        @State var showIndicator:Bool = false
        var body: some View {
                ScrollViewReader { proxy in
                        ScrollView(.vertical, showsIndicators: showIndicator) {
                            Button("Scroll to Bottom") {
                                withAnimation {
                                    proxy.scrollTo(bottomID)
                                }
                            }
                            .id(topID)

                            VStack(spacing: 0) {
                                ForEach(0..<100) { i in
                                    color(fraction: Double(i) / 100)
                                        .frame(height: 32)
                                }
                            }

                            Button("Top") {
                                    showIndicator = !showIndicator
                                withAnimation {
                                    proxy.scrollTo(topID)
                                }
                            }
                            .id(bottomID)
                        }
                }
        }

        func color(fraction: Double) -> Color {
            Color(red: fraction, green: 1 - fraction, blue: 0.5)
        }
}



struct Setting_Previews: PreviewProvider {
        static var previews: some View {
                SettingView()
        }
}
