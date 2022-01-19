//
//  Wallet.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/19.
//

import Foundation

struct Wallet: Identifiable, Decodable {
                var id: String
                var address: String
                var crypto: String
                var version: String
}
