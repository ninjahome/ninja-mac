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
                        Text("\(getTime(msg:userName))").font(.title2)
                        Spacer()
                         Button(action: addItem) {
                                 Image(systemName: "ellipsis")
                         }
                        .buttonStyle(.borderless)
//                        .background(.red)
                        
                }
                .padding()
                .background(Color(red: 0.952, green: 0.952, blue: 0.952))
                .frame(height: 68)
                .ignoresSafeArea()
        }
        private let itemFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .full
            return formatter
        }()
        
        private func getTime(msg:MsgItem?)-> String{
                guard let date = msg?.timestamp else{
                        return "no title"
                }
                
                return itemFormatter.string(from: date)
        }
        
        private func addItem(){
                print("Edit button was tapped")
        }
}

struct ChatHeader_Previews: PreviewProvider {
        @State static var name:MsgItem?
        static var previews: some View {
                MessageHeader(userName: $name)
        }
}
