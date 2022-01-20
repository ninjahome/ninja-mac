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
        @StateObject var wallet:Wallet = Wallet()
        var body: some Scene {
                
                WindowGroup {
                        if wallet.address == ""{
                                if walletJson == ""{
                                        AccountImport(wJson: $walletJson, wallet: wallet)
                                                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                                }else{
                                        LoginView(wJson:$walletJson, wallet: wallet)
                                                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                                }
                        }
                        else{
                                MainView().environmentObject(wallet)
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
