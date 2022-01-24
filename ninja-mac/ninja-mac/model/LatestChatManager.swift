//
//  ChatItem.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/13.
//

import Foundation
import SwiftUI

enum MsgType :UInt8{
        case Txt = 1, Location, Image,  Voice,  File
        var Desc:String {
                switch self{
                case .Txt:
                        return "Text"
                case .Location:
                        return "Location"
                case .Image:
                        return "Image"
                case .Voice:
                        return "Voice"
                case .File:
                        return "File"
                }
        }
}

struct LatestChatManager{
        
        let defaultAvatar =  NSImage(named: "logo")?.tiffRepresentation//TODO::to test
        public static let shared:LatestChatManager = LatestChatManager()
        let dbCtx =  PersistenceController.shared.container.viewContext
        
        func  Create(from:String, msgTyp:MsgType, timpStamp:Int64, isGrp:Bool) -> CDMsgLatest{
                let newItem = CDMsgLatest(context: dbCtx)
                defer{
                        PersistenceController.shared.save()
                }
                newItem.isGrp = isGrp
                newItem.lastMsg = msgTyp.Desc
                newItem.peerID = from
                newItem.owner = Wallet.shared.address
                newItem.timestamp = Date.init(timeIntervalSince1970: TimeInterval(timpStamp))
                guard let onlineData = AccountOnChain.GetAccountDetails(uid: from) else{
                        newItem.peerAvatar = defaultAvatar
                        newItem.peerName = from
                        return newItem
                }
                newItem.peerAvatar = onlineData.avatar
                newItem.peerName = onlineData.name
                return newItem
        }
        
        public func Update(from:String, msgTyp:MsgType, timpStamp:Int64, isGrp:Bool){
                
                if from.count == 0{
                        return
                }
                
                guard let obj = Load(pid: from) else{
                        let _ = Create(from: from, msgTyp: msgTyp, timpStamp: timpStamp, isGrp: isGrp)
                        return
                }
                
                obj.lastMsg  = msgTyp.Desc
                obj.timestamp = Date.init(timeIntervalSince1970: TimeInterval(timpStamp))
        }
        
        func Load(pid:String)->CDMsgLatest?{
                
                let owner = Wallet.shared.address
                let fetchRequest = CDMsgLatest.fetchRequest()
                fetchRequest.fetchLimit = 1
                fetchRequest.predicate = NSPredicate(
                        format: "peerID = %@ AND owner =  %@",
                        pid,
                        owner
                )
                
                do{
                        let object = try dbCtx.fetch(fetchRequest).first
                        return object
                }catch let err{
                        NSLog("------>LatestChatManager save err=>\(err)")
                        return nil
                }
        }
}
