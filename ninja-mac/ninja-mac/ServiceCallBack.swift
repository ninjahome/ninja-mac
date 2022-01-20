//
//  ServiceCallBack.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import Foundation
import ninjaLib

class ServiceCallBack:NSObject{
        
        private static let _inst = ServiceCallBack()
        private static var callBack:Interface = Interface()
        
        private override init() {
                super.init()
                self.InitCallBack()
        }
        
        public static func Inst()->ServiceCallBack{
                return ._inst
        }
        
        
        func libLog(_ log :String){
                print("call data json:", log)
        }
        
        func InitCallBack(){
                
                ServiceCallBack.callBack.logFunc = { bytChar in
                        guard let data = bytChar else{
                                return
                        }
                        
                        let call_data = String( cString: data)
                        ServiceCallBack._inst.libLog(call_data)
                }
                
                ServiceCallBack.callBack.peerMsg = {
                        (from, decoded, _, time) in
                        return 1
                }
        }
        
        public static func CallBack()->Interface{
                return ServiceCallBack.callBack
        }
       
}
