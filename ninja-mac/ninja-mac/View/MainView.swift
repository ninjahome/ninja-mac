//
//  ContentView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/10.
//

import SwiftUI
import CoreData

struct MainView: View {
        
        @State  var tabIdx = 0
        @EnvironmentObject var wallet:Wallet
        
        var body: some View {
                HStack(alignment:.top) {
                        SideBar(tabIdx:$tabIdx)
                                .frame(width: 60)
                                .background(Color(red: 0.904, green: 0.88, blue: 0.909))
                        Spacer().frame(width: 0)
                        switch tabIdx{
                        case 0:
                                MessageMainView()
                        case 1:
                                ContactMainView()
                        default:
                                SettingView()
                        }
                        Spacer()
                }
                .frame(minWidth: 800, idealWidth: 960, minHeight: 720, idealHeight: 800)
                .background(Color(red: 0.969, green: 0.969, blue: 0.969))
                .padding(.all, 0.0)
                .onAppear{
                        LibWrap.AccountNonce(nonce: wallet.account.nonce)
                        let err = LibWrap.WSOnline()
                        if let e = err{
                                print(e.localizedDescription)
                        }
                }
        }
}

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
                MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).background(.black)
        }
}
