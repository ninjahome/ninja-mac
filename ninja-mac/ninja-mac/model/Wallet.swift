//
//  Wallet.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import Foundation

class Wallet: ObservableObject {
        @Published var address: String = ""
        var acc:AccountOnChain? = nil
        
        
}
