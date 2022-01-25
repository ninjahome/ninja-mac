//
//  AvatarView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct LatestMsgView: View {
        var lastMsg: CDMsgLatest
        @State var contact:AccountOnChain?
        
        var body: some View {
                HStack{
                        Image(nsImage: getAvatar()).resizable()
                                .frame(width: 35, height: 35)
                                .clipped()
                                .cornerRadius(5)
                        
                        VStack(alignment: .leading){
                                HStack(){
                                        Text(getName())
                                                .font(.title2)
                                        
                                        Spacer()
                                        Text(getTime())
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                }
                                Spacer().frame(height: 5)
                                Text(lastMsg.lastMsg ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                        }
                        .frame(height: 35)
                }
                .padding(EdgeInsets(top: 12, leading: 5, bottom: 12, trailing: 3))
        }
        
        private func getName()->String{
                guard let pid = lastMsg.peerID else{
                        return "unknown"
                }
                guard let acc = AccountOnChain.Cache[pid] else{
                        return pid
                }
                guard let name = acc.name, name.count > 0 else{
                        return pid
                }
                return name
        }
        
        private func getTime()->String{
                guard let date = lastMsg.timestamp else{
                        return "now"
                }
                
                return toLastMsgTime(date: date)
        }
        private func getAvatar()->NSImage{
                let deafult = NSImage(named: "logo")!
                guard let pid = lastMsg.peerID else{
                        return deafult
                }
                guard let acc = AccountOnChain.Cache[pid] else{
                        return deafult
                }
                guard let data = acc.avatar, data.count > 0 else{
                        return deafult
                }
                
                return NSImage.init(data: data) ?? deafult
        }
}

struct AvatarView_Previews: PreviewProvider {
        static var previews: some View {
                LatestMsgView(lastMsg: CDMsgLatest())
        }
}
