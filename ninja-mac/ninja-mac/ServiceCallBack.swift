//
//  ServiceCallBack.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import Foundation

class ServiceCallBack:NSObject{
        private static let _inst=ServiceCallBack()
        private override init() {
                super.init()
        }
        public static func Inst()->ServiceCallBack{
                return ._inst
        }
        func callbackJson(json:String){
                print("call data json:", json)
        }
}
