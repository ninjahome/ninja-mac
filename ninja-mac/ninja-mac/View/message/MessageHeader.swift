//
//  ChatHeader.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/14.
//

import SwiftUI

struct MessageHeader: View {
        @Binding  var userName:MsgItem?;
        var body: some View {
                HStack{
                        Text("\(itemFormatter.string(from: userName?.timestamp ?? Date()))").font(.title2)
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
        private let itemFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .full
            return formatter
        }()
}

//struct ChatHeader_Previews: PreviewProvider {
//        @State static var name:MsgItem="test"
//        static var previews: some View {
//                MessageHeader(userName: $name)
//        }
//}
