//
//  ninja_macApp.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/10.
//

import SwiftUI
import ninjaLib

final class AppDelegate: NSObject, NSApplicationDelegate {
        @AppStorage("save_last_usable_service_ip") var endPoint: String = ""
        let InfuraToken:String = "a3a5c09826a246d0bfbef8084b81df1f"
        let DebugMode:Bool = true
        let NetworkID:Int8 = 5
        
        func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
                return true
        }
        func applicationDidFinishLaunching(_ notification: Notification) {
               let cb =  ServiceCallBack.InitCallBack()
                initConf(endPoint.toGoStr(),
                         InfuraToken.toGoStr(),
                         NetworkID,
                         cb)
                
                setPushParam("".toGoStr(), 3, DebugMode ? 1: 0)
        }
}

@main
struct ninja_macApp: App {
        @NSApplicationDelegateAdaptor(AppDelegate.self)
        var appDelegate
        
        let persistenceController = PersistenceController.shared
        
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
                                MainView()
                                        .environmentObject(wallet)
                                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        }
                }
                .windowStyle(HiddenTitleBarWindowStyle())
        }
}
