//
//  ninja_macApp.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/10.
//

import SwiftUI
import ninjaLib

@main
struct ninja_macApp: App {
        let persistenceController = PersistenceController.shared
        var ss:UserInterfaceAPI={v in
                print("\n",String(cString:v!))
        }
        
        @AppStorage("cache_account_json") var walletJson: String = ""
        
        var body: some Scene {
                
                WindowGroup {
                        if walletJson == ""{
                                ScanQRView()
                                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        }else{
                                LoginView(wJson:$walletJson)
                                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        }
                }
                .windowStyle(HiddenTitleBarWindowStyle())
        }
        
        func Test(){
                createAccount("123".toGoStr())
                //                GroupImage("".toGoStr())
        }
}
