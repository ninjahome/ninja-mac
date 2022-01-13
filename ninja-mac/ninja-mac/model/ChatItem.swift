//
//  ChatItem.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/13.
//

import Foundation
import SwiftUI

struct ChatItem: Hashable, Codable{
        var id: Int
           var name: String
           var time: Int64
           var lastMsg: String

           private var imageName: String
           var image: Image {
               Image(imageName)
           }
}
