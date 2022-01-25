//
//  ChatHeader.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/14.
//

import SwiftUI

struct MessageHeader: View {
        
        @Binding  var latestMsg:CDMsgLatest?;
        
        var body: some View {
                HStack(){
                        
                        Text("\(getPeerName(msg:latestMsg))")
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
        
        private func getPeerName(msg:CDMsgLatest?)-> String{
                guard let uid = msg?.peerID else {
                        return ""
                }
                guard let onlineData = AccountOnChain.Cache[uid] else{
                        return uid
                }
                guard let name = onlineData.name, name.count > 0 else{
                        return uid
                }
                return name
        }
        
        private func addItem(){
                print("Edit button was tapped")
        }
}

struct ChatHeader_Previews: PreviewProvider {
        @State static var name:CDMsgLatest?
        static var previews: some View {
                MessageHeader(latestMsg: $name)
        }
}
