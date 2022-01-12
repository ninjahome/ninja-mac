//
//  ContentView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/10.
//

import SwiftUI
import CoreData

struct ContentView: View {
        @State  var tabIdx = 0
        var body: some View {
                HStack {
                        SideBar(tabIdx:$tabIdx)
                        switch tabIdx{
                        case 0:
                                ChatMessage()
                        case 1:
                                Contact()
                        default:
                                Setting()
                        }
                }.frame(width: 960, height: 720, alignment: .center)
        }
}


struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
                ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
}
