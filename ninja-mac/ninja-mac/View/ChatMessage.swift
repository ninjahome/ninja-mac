//
//  ChatMessage.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct ChatMessage: View {
        
        @State private var searchText:String = ""
        
        @Environment(\.managedObjectContext) private var viewContext
        
        @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
                animation: .default)
        private var items: FetchedResults<Item>
        
        var body: some View {
                NavigationView {
                        
                        searchable(text: $searchText)
                        
                        List {
                                ForEach(items) { item in
                                        NavigationLink {
                                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                                        } label: {
                                                Text(item.timestamp!, formatter: itemFormatter)
                                        }
                                }
                                .onDelete(perform: deleteItems)
                        }
                        .toolbar {
                                ToolbarItem {
                                        Button(action: addItem) {
                                                Label("Add Item", systemImage: "plus")
                                        }
                                }
                        }
                        Text("Select an item")
                                .font(.title)
                                .padding(.all)
                }.frame(width: 900, height: 720)
        }
        private func addItem() {
                withAnimation {
                        let newItem = Item(context: viewContext)
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
                ChatMessage()
        }
}
