//
//  LibWrap.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import Foundation
import ninjaLib

final class LibWrap:NSObject{
        
        static func ActiveWallet(auth:String, Cpher:String)->Error?{
                guard let errMsg = activeWallet(auth.toGoStr(), Cpher.toGoStr()) else{
                        return nil
                }
                return NSError(domain: "Account", code: -1, userInfo: [NSLocalizedDescriptionKey:String(cString: errMsg)])
        }
        
        static func WalletAddr()->String?{
                guard let errMsg = walletAddress() else{
                        return nil
                }
                
                return String(cString: errMsg)
        }
        static func NewWallet(auth:String)->(String,Error?){
                guard let wData = newWallet(auth.toGoStr()) else{
                        return ("",NSError(domain: "Account", code: -1, userInfo: [NSLocalizedDescriptionKey:"create wallet failed"]))
                }
                return (String(cString:wData), nil)
        }
}

