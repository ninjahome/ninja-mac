//
//  Contact.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct ContactMainView: View {
        @State private var searchText:String = ""
        @State var selected: Int? = nil
        
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \MsgItem.timestamp, ascending: true)],
                animation: .default)
        private var items: FetchedResults<MsgItem>
        
        struct ToggleStates {
                var oneIsOn: Bool = false
                var twoIsOn: Bool = true
        }
        @State private var toggleStates = ToggleStates()
        @State private var topExpanded: Bool = true
        
        var body: some View {
                
                HSplitView {
                        VStack{
                                search_contact(searchText: $searchText)
                                DisclosureGroup("SavedGroup", isExpanded: $topExpanded) {
                                        
                                        List(selection: $selected){
                                                ForEach(items, id: \.self){
                                                        item in
                                                        MessageItemView()
                                                }
                                        }
                                        .listStyle(.plain)
                                        .ignoresSafeArea()
                                }
                                
                                //                                List(selection: $selected){
                                //                                        ForEach(items, id: \.self){
                                //                                                item in
                                //                                                MessageItemView()
                                //                                        }
                                //                                }
                                //                                .listStyle(.plain)
                                //                                .ignoresSafeArea()
                                
                        }
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

struct Contact_Previews: PreviewProvider {
        static var previews: some View {
                ContactMainView().frame(width: 880, height: 600, alignment: .center)
        }
}
