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
    
        var body: some Scene {
                WindowGroup {
                        ContentView()
                                .frame(width: 800, height: 600)
                                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                }
        }
        
        func Test(){
                createAccount("123".toGoStr())
        }
}
