//
//  utils.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/10.
//

import Foundation
import ninjaLib

extension String {
        var localized: String {
                return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
        }
        func format(parameters: CVarArg...) -> String {
                return String(format: self, arguments: parameters)
        }
        
        func toGoStr() ->GoString {
                let cs = (self as NSString).utf8String
                let buffer = UnsafePointer<Int8>(cs!)
                return GoString(p:buffer, n:strlen(buffer))
        }
}



public let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
}()
