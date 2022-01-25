//
//  AvatarView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct LatestMsgView: View {
        @State var lastMsg: CDMsgLatest?
        var contact:AccountOnChain?
        
        var body: some View {
                HStack{
                        Image("test").resizable()
                                .frame(width: 35, height: 35)
                                .clipped()
                                .cornerRadius(5)
                        
                        VStack(alignment: .leading){
                                HStack(){
                                        Text(getName())
                                                .font(.title2)
                                        
                                        Spacer()
                                        Text("time")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                }
                                Spacer().frame(height: 5)
                                Text("lastTxt")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                        }
                        .frame(height: 35)
                }
                .padding(EdgeInsets(top: 12, leading: 5, bottom: 12, trailing: 3))
                //                onAppear {
                //                        if let avatar = lastMsg?.peerAvatar{
                //                                if let img = NSImage(data: avatar) {
                //                                        avatarImg = Image(nsImage: img)
                //                                }
                //                        }
                //
                //                        if let txt = lastMsg?.lastMsg{
                //                                lastTxt = txt
                //                        }
                //                        if let txt = lastMsg?.peerName{
                //                                nickName = txt
                //                        }
                //                        if let date = lastMsg?.timestamp{
                //                                time = toChatMsgTime(date: date)
                //                        }
                //                }
        }
        
        private func getName()->String{
//                if
//                guard let name = lastMsg?.peerName, name.count > 0 else{
//                        return lastMsg?.peerID ?? ""
//                }
//                return name
                return "getName"
        }
        private func getAvatar()->NSImage?{
//                if let avatar = lastMsg?.peerAvatar{
//                        if let img = NSImage(data: avatar) {
////                                avatarImg = Image(nsImage: img)
//                        }
//                }
                return nil
        }
}

struct AvatarView_Previews: PreviewProvider {
        static var previews: some View {
                LatestMsgView()
        }
}
