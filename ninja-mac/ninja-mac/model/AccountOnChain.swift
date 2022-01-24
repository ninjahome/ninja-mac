//
//  AccountOnChain.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/21.
//

import Foundation
import ninjaLib
import SwiftUI



struct AccountOnChain: Codable {
        
        @AppStorage("cache_account_json_string") static var accountString: String = ""
        
        var nonce: Int64
        var addr: String
        var name: String?
        var avatar:Data?
        var balance:Int64?
        var touch_time:String?
        
        init(){
                nonce = 0
                addr = ""
        }
        
        func ToCoreData(contact:CDContact){
                contact.balance = self.balance ?? 0
                contact.nonce = self.nonce
                contact.addr = self.addr
                contact.name = self.name
                contact.touch_time = toISODate(dateStr: self.touch_time)
                contact.avatar = self.avatar
        }
        
        mutating func FromCoreData(contact:CDContact){
                self.nonce = contact.nonce
                self.addr = contact.addr!
                self.name = contact.name
                self.avatar = contact.avatar
                self.balance = contact.balance
                self.touch_time = contact.touch_time?.ISO8601Format()
        }
        
        public static func  ConvertFromData(data:String)->AccountOnChain?{
                if data.count == 0{
                        return nil
                }
                guard let data = data.data(using: .utf8)else{
                        return nil
                }
                
                let decoder = JSONDecoder()
                do{
                        let account = try decoder.decode(AccountOnChain.self, from: data)
                        return account
                }catch let err{
                        print(err)
                        return nil
                }
        }
        
        public static func GetAccountDetails(uid:String)->AccountOnChain?{
                
                if let coreData = Load(uid: uid){
                        var inst = AccountOnChain()
                        inst.FromCoreData(contact: coreData)
                        return inst
                }
                
                guard let d = accountDetail(uid.toGoStr()) else{
                        return nil
                }
                guard let inst = ConvertFromData(data: String(cString: d)) else{
                        return nil
                }

                let _ = Create(account: inst)
                return inst
        }
        
        public static func UpdateSelfMeata(jsonData:String){
                guard let accountDetails = AccountOnChain.ConvertFromData(data: jsonData) else{
                        //TODO::
                        return
                }
                
                accountString = jsonData
                Wallet.shared.updateAccount(account: accountDetails)
        }
        
//        
//        public static func NewContact(jsonData:String){
//                guard let accountDetails = AccountOnChain.ConvertFromData(data: jsonData) else{
//                        //TODO::
//                        return
//                }
//                
//                
//                guard let cdData = Load(uid:accountDetails.addr) else{
//                        let _ = Create(account: accountDetails)
//                        return
//                }
//                
//                accountDetails.ToCoreData(contact: cdData)
//        }
//        
        public static func  Load(uid:String)->CDContact?{
                let dbCtx = PersistenceController.shared.container.viewContext
                let owner = Wallet.shared.address
                let fetchRequest = CDContact.fetchRequest()
                fetchRequest.fetchLimit = 1
                fetchRequest.predicate = NSPredicate(
                        format: "addr = %@ AND owner =  %@",
                        uid,
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
        
        public static func  Create(account:AccountOnChain)->CDContact?{
                let dbCtx = PersistenceController.shared.container.viewContext
                let newContact = CDContact(context: dbCtx)
                let owner = Wallet.shared.address
                newContact.owner = owner
                account.ToCoreData(contact: newContact)
                PersistenceController.shared.save()
                return newContact
        }
}
