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
                HStack(alignment:.top) {
                        SideBar(tabIdx:$tabIdx)
                                .frame(width: 60)
                                .background(Color(red: 0.904, green: 0.88, blue: 0.909))
                        Spacer().frame(width: 0)
                        switch tabIdx{
                        case 0:
                                ChatMessage()
                        case 1:
                                ContactView()
                        default:
                                SettingView()
                        }
                        Spacer()
                }
                .frame(minWidth: 600, idealWidth: 800, minHeight: 480, idealHeight: 600)
                .background(Color(red: 0.969, green: 0.969, blue: 0.969))
                .padding(.all, 0.0)
        }
}


struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
                ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).background(.black)
        }
}
