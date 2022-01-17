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
        
//        struct Ocean: Identifiable, Hashable {
//             let name: String
//             let id = UUID()
//             let stats: [String: String]
//         }
//        class OceanStore: ObservableObject {
//             @Published var oceans = [Ocean]()
//             func loadStats() async -> Void {}
//         }
//        @EnvironmentObject var store: OceanStore
        @State var selected: MsgItem? = nil
        @State private var selectedIdx: Int = 2
  
    var body: some View {
        
            HSplitView{
            VStack{
                searchView(searchText: $searchText)
                Spacer().frame(height: 0)
                    List(items, id: \.self, selection: $selected){
                                item in
                            MessageItemView()
                }
                    
                    //                .refreshable {
//                        await store.loadStats()
//                }
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
                    
                    if selected == nil {
                            Text("Select a Color")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                            
                            VStack{
                                    MessageHeader(userName: $selected)
                                Spacer()
                                MessageBody()
                            }.background(.blue)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
            }
            .onAppear{
                    if items.count > selectedIdx {
                            selected = items[selectedIdx]
                    }
            }
        .background(.yellow)
//        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
    

    private func addItem() {
        withAnimation {
            let newItem = MsgItem(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
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
        MessageView()
    }
}
