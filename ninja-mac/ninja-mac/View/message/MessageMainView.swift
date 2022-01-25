//
//  ChatMessage.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct MessageMainView: View {
        
        @State private var searchText:String = ""
        
        @Environment(\.managedObjectContext) private var viewContext
        @EnvironmentObject var wallet:Wallet
        
        @FetchRequest(
            entity: CDMsgLatest.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \CDMsgLatest.peerID, ascending: true),
            ],
            predicate: NSPredicate(format: "owner == %@", "NJ5Y3w9m9Bhxw9phnGhm3TRoBanF3mr91TQNjciMnAEuFg")
        )private var items: FetchedResults<CDMsgLatest>
//        var items: [CDMsgLatest] = []
        
        @State var selected: CDMsgLatest? = nil
        @State private var selectedIdx: Int = 0
        @State var indexPathToSetVisible: IndexPath?
        
        var body: some View {
                
                HSplitView{
                        VStack(spacing:0){
                                searchView(searchText: $searchText)
                                Divider()
                                List(selection: $selected){
                                        ForEach(items, id: \.self){
                                                item in
                                                LatestMsgView(lastMsg:item)
                                        }
                                }.background(.red)
                                .listStyle(.plain)
                                .ignoresSafeArea()
                        }
                        .frame(minWidth: 150, idealWidth: 200, maxWidth: 300, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.all, 0.0)
                        
                        
                        if selected == nil{
                                Text("").frame(maxWidth: .infinity, maxHeight: .infinity)
                        }else{
                                VStack(spacing:0){
                                        
                                        MessageHeader(latestMsg: $selected)
                                        Divider()
                                        MessageBody()
                                        MessageInput()
                                                .frame(minHeight: 150, idealHeight: 200, maxHeight: 300)
                                }
                                .ignoresSafeArea()
                                .padding(.all, 0.0)
                        }
                }
                .onAppear{
                        if items.count > selectedIdx {
                                selected = items[selectedIdx]
                        }
                }
        }
        
        
        private func addItem() {
                withAnimation {
                        let newItem = CDMsgItem(context: viewContext)
                        newItem.timestamp = Date()
                        
                        do {
                                try viewContext.save()
                        } catch {
                                let nsError = error as NSError
                                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                }
        }
        
        private func deleteItems(offsets: IndexSet) {
                withAnimation {
                        offsets.map { items[$0] }.forEach(viewContext.delete)
                        
                        do {
                                try viewContext.save()
                        } catch {
                                let nsError = error as NSError
                                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                }
        }
}


struct ChatMessage_Previews: PreviewProvider {
        static var previews: some View {
                Group {
                        MessageMainView()
                }
        }
}
