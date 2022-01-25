//
//  ServiceCallBack.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import Foundation
import ninjaLib
import SwiftUI

struct ServiceCallBack{
        @AppStorage("save_last_usable_service_ip") var endPoint: String = ""
        
        
        public static let shared = ServiceCallBack()
        private var callBack:Interface = Interface()
        
        func libLog(_ log :String){
                print("call data json:", log)
        }
        
        func changeNodeIP(newIP:String){
                self.endPoint = newIP
                _ = LibWrap.WSOnline()
        }
        
        public static func InitCallBack()->Interface{
                var callBack:Interface = Interface()
                callBack.logFunc = { bytChar in
                        guard let data = bytChar else{
                                return
                        }
                        
                        let call_data = String( cString: data)
                        ServiceCallBack.shared.libLog(call_data)
                }
                
                callBack.peerMsg = {
                        (from, decoded, time) in
                        guard let sender = from, let d = decoded else{
                                return 0
                        }
                        
                        guard let data = String(cString: d).data(using: .utf8) else{
                                return 0
                        }
                        
                        let pid = String(cString: sender)
                       
                        MessageManager.newPeerMsg(from: pid, msg: data, timpStamp: Int64(time))
                        return 1
                        
                }
                
                callBack.grpMsg = {
                        (from, gid, decoded, time) in
                        guard let sender = from, let groupID = gid, let d = decoded else{
                                return 0
                        }
                        
                        guard let data = String(cString: d).data(using: .utf8) else{
                                return 0
                        }
                        let pid = String(cString: sender)
                        let gid = String(cString: groupID)
                        
                        MessageManager.newGroupMsg(from: pid, groupID: gid, msg: data, timpStamp: Int64(time))
                        return 1
                }
                
                callBack.nodeChanged = { bytChar in
                        guard let data = bytChar else{
                                return
                        }
                        
                        let newIP = String(cString: data)
                        ServiceCallBack.shared.changeNodeIP(newIP: newIP)
                }
                
                callBack.didOnline = {
                        NSLog("-------> online success")
                }
                
                callBack.accountUpdate = {charData in
                        
                        guard let data = charData else{
                                //TODO::
                                return
                        }
                        
                        NSLog("------->self meta update by callback")
                        AccountOnChain.UpdateSelfMeata(jsonData:String(cString: data))
                }
                
                return callBack
        }
}
