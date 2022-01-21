//
//  Wallet.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import Foundation
import SwiftUI

class Wallet: ObservableObject {
        @Published var address: String = ""
        @Published var account:AccountOnChain = AccountOnChain()
}
