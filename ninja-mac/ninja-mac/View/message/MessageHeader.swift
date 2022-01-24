//
//  ChatHeader.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/14.
//

import SwiftUI

struct MessageHeader: View {
        
        @Binding  var userName:MsgLatest?;
        
        var body: some View {
                HStack(){
                        
                        Text("\(getTime(msg:userName))")
                                .font(.custom("HelveticaNeue", size: 15))
                        Spacer()
                        Button(action: addItem) {
                                Image(systemName: "ellipsis")
                                        .font(.custom("", size: 20))
                                
                        }
                        .buttonStyle(.borderless)
                }
                .frame(height:60)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .background(Color(red: 0.952, green: 0.952, blue: 0.952))
                
        }
        
        private func getTime(msg:MsgLatest?)-> String{
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
        @State static var name:MsgLatest?
        static var previews: some View {
                MessageHeader(userName: $name)
        }
}
