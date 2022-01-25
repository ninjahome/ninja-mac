//
//  Message.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/25.
//

import Foundation

struct MessageManager{
        static let msgQueue = DispatchQueue(label:
                                                "com.ninhome.messagequeue",
                                            attributes: .concurrent)
        
        public static func newPeerMsg(from:String, msg:Data, timpStamp:Int64){
                
                MessageManager.msgQueue.async {
                        
                        if  AccountOnChain.Cache[from] == nil{
                                let aoc = AccountOnChain.GetAccountDetails(uid: from)
                                AccountOnChain.Cache[from] = aoc
                        }
                        
                        
                        let typ =  MsgType(rawValue: msg[0]) ?? .Txt
                        LatestChatManager.shared.Update(from: from,
                                                        msgTyp:typ,
                                                        timpStamp: timpStamp,
                                                        isGrp: false)
                }
        }
        
        public static func newGroupMsg(from:String,groupID:String, msg:Data, timpStamp:Int64){
                
        }
}
