//
//  Wallet.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import Foundation
import SwiftUI

class Wallet: ObservableObject {
        public static var shared:Wallet = Wallet()
        @Published var address: String = ""
        @Published var account:AccountOnChain = AccountOnChain()
        
        
        func isVip() ->Bool {
                        if let b = self.account.balance{
                                return TimeInterval(b) > Date.now.timeIntervalSince1970
                        }else{
                                return false
                        }
        }
        func updateAccount(account:AccountOnChain){
                DispatchQueue.main.async {
                        self.account = account
                }
        }
}
