//
//  ChatMessage.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct MessageView: View {
        
        @State private var searchText:String = ""
        
        @Environment(\.managedObjectContext) private var viewContext
        
        @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \MsgItem.timestamp, ascending: true)],
                animation: .default)
        
        private var items: FetchedResults<MsgItem>
        
        @State var selected: MsgItem? = nil
        @State private var selectedIdx: Int = 0
        @State var indexPathToSetVisible: IndexPath?
        var body: some View {
                
                HSplitView{
                        VStack{
                                searchView(searchText: $searchText)
                                Spacer().frame(height: 0)
                                List(selection: $selected){
                                        ForEach(items, id: \.self){
                                                item in
                                                MessageItemView()
                                        }
                                }
                                //                .toolbar{
                                //                    ToolbarItem {
                                //                        Button(action: addItem) {
                                //                            Label("Add Item", systemImage: "plus")
                                //                        }
                                //                    }
                                //                }
                                //.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -15))
                                .listStyle(.plain)
                                .ignoresSafeArea()
                        }
                        .frame(minWidth: 150, idealWidth: 200, maxWidth: 300, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.all, 0.0)
                        
                        VStack(spacing:0){
                                
                                MessageHeader(userName: $selected)
                                MessageBody()
                                
                                MessageInput()
                                .frame(minHeight: 150, idealHeight: 200, maxHeight: 350)
                                
                                Spacer().frame(height:3)
                        }
                        .ignoresSafeArea()
                        .background(.blue)
                        .padding(.all, 0.0)
                }
                .onAppear{
                        if items.count > selectedIdx {
                                selected = items[selectedIdx]
                        }
                }
        }
        
        
        private func addItem() {
                withAnimation {
                        let newItem = MsgItem(context: viewContext)
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

private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
}()


struct ChatMessage_Previews: PreviewProvider {
        static var previews: some View {
                Group {
                        MessageView()
                        MessageView()
                }
        }
}
