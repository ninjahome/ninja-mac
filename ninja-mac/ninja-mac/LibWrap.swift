//
//  LibWrap.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import Foundation
import ninjaLib

final class LibWrap:NSObject{
        static let ErrDomainWallet:String = "wallet"
        static let ErrDomainSocket:String = "websocket"
        
        static func ActiveWallet(auth:String, Cpher:String)->Error?{
                guard let errMsg = activeWallet(auth.toGoStr(), Cpher.toGoStr()) else{
                        return nil
                }
                return NSError(domain: ErrDomainWallet, code: -1, userInfo: [NSLocalizedDescriptionKey:String(cString: errMsg)])
        }
        
        static func WalletAddr()->String?{
                guard let errMsg = walletAddress() else{
                        return nil
                }
                
                return String(cString: errMsg)
        }
        static func NewWallet(auth:String)->(String,Error?){
                guard let wData = newWallet(auth.toGoStr()) else{
                        return ("",NSError(domain: ErrDomainWallet, code: -3, userInfo: [NSLocalizedDescriptionKey:"create wallet failed"]))
                }
                return (String(cString:wData), nil)
        }
        
        static func WSOnline()->NSError?{
                guard let errMsg = online() else{
                        return nil
                }
                return NSError(domain: ErrDomainSocket, code: -2, userInfo: [NSLocalizedDescriptionKey:String(cString: errMsg)])
        }

        static func AccountNonce(nonce:Int64){
                accountNonce(nonce)
        }
        
        static func ConvertBalance(balance:Int64?) -> String{
                let now = Date.now.timeIntervalSince1970
                if let b = balance, TimeInterval(b) > now{
                        let floatB = convertBalance(b)
                        return String.init(format: "%.2f", floatB)
                }
                return "0.00"
        }
}

