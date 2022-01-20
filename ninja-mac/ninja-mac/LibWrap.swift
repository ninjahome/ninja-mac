//
//  LibWrap.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/20.
//

import Foundation
import ninjaLib

final class LibWrap:NSObject{
        
        static func ImportAccount(auth:String, Cpher:String)->Error?{
                guard let errMsg = importAccount(auth.toGoStr(), Cpher.toGoStr()) else{
                        return nil
                }
                return NSError(domain: "Account", code: -1, userInfo: [NSLocalizedDescriptionKey:String(cString: errMsg)])
        }
}
