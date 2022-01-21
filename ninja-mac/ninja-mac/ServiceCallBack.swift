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
        @ObservedObject var wallet:Wallet = Wallet()
        @AppStorage("cache_account_json_string") var accountString: String = ""
        
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
        public static func InitWallet(wallet:Wallet){
                _inst.wallet = wallet
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
                
                callBack.accountUpdate = {charData in
                        
                        guard let data = charData else{
                                //TODO::
                                return
                        }
                        
                        let jsonStr = String(cString: data)
                        guard let accountDetails = ConvertFromData(data: jsonStr) else{
                                //TODO::
                                return
                        }
                        ServiceCallBack._inst.accountString = jsonStr
                        DispatchQueue.main.async {
                                ServiceCallBack._inst.wallet.account = accountDetails
                        }
                }
                
                return callBack
        }
}
