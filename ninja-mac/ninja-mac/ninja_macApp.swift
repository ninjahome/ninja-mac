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
        
        @AppStorage("username") var username: String = ""
        
        var body: some Scene {
                
                WindowGroup {
                        if username==""{
                                LoginView()
                                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        }else{
                        MainView()
                                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        }
                }.windowStyle(HiddenTitleBarWindowStyle())
        }
        
        func Test(){
                createAccount("123".toGoStr())
//                GroupImage("".toGoStr())
        }
}
