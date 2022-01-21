//
//  ServiceCallBack.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import Foundation
import ninjaLib
import SwiftUI

class ServiceCallBack:NSObject{
        @AppStorage("save_last_usable_service_ip") var endPoint: String = ""
        @EnvironmentObject var  wallet:Wallet
        
        private static let _inst = ServiceCallBack()
        private var callBack:Interface = Interface()
        
        private override init() {
                super.init()
        }
        
        public static func Inst()->ServiceCallBack{
                return ._inst
        }
        
        
        func libLog(_ log :String){
                print("call data json:", log)
        }
        
        func changeNodeIP(newIP:String){
                self.endPoint = newIP
                _ = LibWrap.WSOnline()
        }
        
        func metaUpdate(data:Data){
                guard let acc = ConvertFromData(data: data) else{
                        return
                }
        }
        
        public static func InitCallBack()->Interface{
                var callBack:Interface = Interface()
                callBack.logFunc = { bytChar in
                        guard let data = bytChar else{
                                return
                        }
                        
                        let call_data = String( cString: data)
                        ServiceCallBack._inst.libLog(call_data)
                }
                
                callBack.peerMsg = {
                        (from, decoded, _, time) in
                        return 1
                }
                
                callBack.nodeChanged = { bytChar in
                        guard let data = bytChar else{
                                return
                        }
                        
                        let newIP = String(cString: data)
                        ServiceCallBack._inst.changeNodeIP(newIP: newIP)
                }
                
                callBack.didOnline = {
                        NSLog("-------> online success")
                }
                
                callBack.accountUpdate = {jsonData in
                        guard let data = jsonData else{
                                //TODO::
                                return
                        }
//                        let data3 = Data(bytes: data,count: strlen(data))
//                        guard let data2 = String(cString: data).data(using: .utf8) else{
//                                //TODO::
//                                return
//                        }
                        ServiceCallBack._inst.metaUpdate(data: Data(bytes: data,count: strlen(data)))
                        
                       
                }
                return callBack
        }
        
}
