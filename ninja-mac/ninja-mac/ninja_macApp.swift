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
        func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
                return true
        }
        func applicationDidFinishLaunching(_ notification: Notification) {
                initConf(endPoint.toGoStr(), InfuraToken.toGoStr(),5) {
                        bytChar in
                        guard let data = bytChar else{
                                return
                        }
                        
                        let call_data = String( cString: data)
                        ServiceCallBack.Inst().callbackJson(json: call_data)
                }
        }
}

@main
struct ninja_macApp: App {
        @NSApplicationDelegateAdaptor(AppDelegate.self)
        var appDelegate
        
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
                                MainView()
                                        .environmentObject(wallet)
                                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        }
                }
                .windowStyle(HiddenTitleBarWindowStyle())
        }
}
