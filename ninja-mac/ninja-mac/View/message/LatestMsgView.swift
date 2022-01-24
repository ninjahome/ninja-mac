//
//  AvatarView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct LatestMsgView: View {
        @Binding var lastMsg: CDMsgLatest?
        @State var avatarImg:Image = Image("test")
        @State var nickName:String = ""
        @State var time:String = ""
        @State var lastTxt:String = ""
        
        var body: some View {
                
                HStack{
                        avatarImg.resizable()
                                .frame(width: 35, height: 35)
                                .clipped()
                                .cornerRadius(5)
                        
                        VStack(alignment: .leading){
                                HStack(){
                                        Text(nickName)
                                                .font(.title2)
                                        
                                        Spacer()
                                        Text(time)
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                }
                                Spacer().frame(height: 5)
                                Text(lastTxt)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                        }
                        .frame(height: 35)
                }
                .padding(EdgeInsets(top: 12, leading: 5, bottom: 12, trailing: 3))
                onAppear {
                        if let avatar = lastMsg?.peerAvatar{
                                if let img = NSImage(data: avatar) {
                                        avatarImg = Image(nsImage: img)
                                }
                        }
                        
                        if let txt = lastMsg?.lastMsg{
                                lastTxt = txt
                        }
                        if let txt = lastMsg?.peerName{
                                nickName = txt
                        }
                        if let date = lastMsg?.timestamp{
                                time = toChatMsgTime(date: date)
                        }
                }
        }
}

struct AvatarView_Previews: PreviewProvider {
        static var previews: some View {
                LatestMsgView( lastMsg: .constant(nil))
        }
}
