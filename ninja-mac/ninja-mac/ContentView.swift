//
//  ContentView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/10.
//

import SwiftUI
import CoreData

struct ContentView: View {
        
    var body: some View {
            HStack {
                    ChatMessage()
            }.frame(width: 800, height: 600, alignment: .center)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
