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
        @AppStorage("save_last_usable_service_ip") static var endPoint: String = ""
        
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
                        ServiceCallBack.endPoint = newIP
                        _ = LibWrap.WSOnline()
                }
                return callBack
        }
       
}
