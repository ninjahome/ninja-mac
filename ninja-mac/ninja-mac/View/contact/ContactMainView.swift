//
//  Contact.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct ContactMainView: View {
        
        @State var selected: MsgItem? = nil
        
        var body: some View {
                
                HSplitView {
                        
                        ContectMenuView(selected:$selected)
                                .frame(minWidth: 150, idealWidth: 200, maxWidth: 300, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.all, 0.0)
                        
                        detailView.frame(maxWidth: .infinity, maxHeight: .infinity)
                }.background(Color(red: 0.949, green: 0.949, blue: 0.949))
        }
        
        @ViewBuilder var detailView: some View {
                if selected == nil {
                        Text("Nothing is selected")
                } else {
                        Text("\(selected!) is selected")
                }
        }
        
        var highlightOverlay: some View {
                Color(red: 0.949, green: 0.949, blue: 0.949)
                        .opacity(0.8)
                        .cornerRadius(10)
                        .frame(height: 40)
                        .frame(minWidth: 150, maxWidth: 200)
        }
}

struct ContectMenuView:View{
        @State private var searchText:String = ""
        @Binding var selected: MsgItem?
        
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \MsgItem.timestamp, ascending: true)],
                animation: .default)
        private var items: FetchedResults<MsgItem>
        
        @State private var savedGrpExpanded: Bool = false
        @State private var contactExpanded: Bool = false
        var body: some View{
                VStack(spacing:0){
                        search_contact(searchText: $searchText)
                        ScrollView{
                                
                                DisclosureGroup( isExpanded: $savedGrpExpanded) {
//                                        List(selection:$selected){
//                                        ForEach(items, id: \.self){
//                                                item in
//                                                ContactItem()
//                                        }}
//                                        List(
//                                        List("Favorite", selection: $selected){
//                                        Picker("Favorite Color", selection: $selected) {
                                                ForEach(items, id: \.self){
                                                       item in
                                                       ContactItem()
                                               }
//                                            }
                                        
                                }label: {
                                        Label("Saved Group", systemImage: "thermometer")
                                              .font(.headline)
                                    }
                                
                                
                                DisclosureGroup("Contacts", isExpanded: $contactExpanded) {
                                        ForEach(items, id: \.self){
                                                item in
                                                ContactItem()
                                        }
                                }
                        }
                        Spacer()
                }
        }
}

struct Contact_Previews: PreviewProvider {
        static var previews: some View {
                ContactMainView().frame(width: 880, height: 600, alignment: .center)
        }
}
