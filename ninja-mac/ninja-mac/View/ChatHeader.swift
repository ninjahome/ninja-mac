//
//  ChatHeader.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/14.
//

import SwiftUI

struct ChatHeader: View {
        var body: some View {
                HStack{
                        Text("Nick Name").font(.title2)
                        Spacer()
                        Button {
                                print("Edit button was tapped")
                        } label: {
                                Image(systemName: "ellipsis")
                        }
                        .buttonStyle(.plain)
                }
                .padding()
                .background(.red)
//                .background(Color(red: 0.952, green: 0.952, blue: 0.952))
                .frame(height: 68)
                .ignoresSafeArea()
        }
}

struct ChatHeader_Previews: PreviewProvider {
        static var previews: some View {
                ChatHeader()
        }
}
