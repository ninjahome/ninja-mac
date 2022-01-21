//
//  AccountOnChain.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/21.
//

import Foundation
struct AccountOnChain: Codable {
        var nonce: Int64
        var addr: String
        var name: String
        var avatar:Data?
        var balance:Int64?
        var touch_time:String
}

func ConvertFromData(data:Data)->AccountOnChain?{
        let decoder = JSONDecoder()
        do{
                let account = try decoder.decode(AccountOnChain.self, from: data)
                print(account)
                return account
        }catch let err{
                print(err)
                return nil
        }
}
