//
//  Contact.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI


struct CardInfo: Hashable, Identifiable {
        static func == (lhs: CardInfo, rhs: CardInfo) -> Bool {
                return lhs.id == rhs.id
        }
        
        var id = UUID()
        var isTop:Bool = false
        var name: String = ""
        var image: String = ""
        var children: [CardInfo]?
}

struct ContactMainView: View {
        
        @State private var searchText:String = ""
        @State var selected: MsgItem?
        
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \MsgItem.timestamp, ascending: true)],
                animation: .default)
        private var items: FetchedResults<MsgItem>
        
        @State private var savedGrpExpanded: Bool = false
        @State private var contactExpanded: Bool = false
        
        var body: some View {
                
                HSplitView {
                        VStack(spacing:0){
                                search_contact(searchText: $searchText)
                                
                                List(selection: $selected){
                                        DisclosureGroup(isExpanded: $savedGrpExpanded) {
                                                ForEach(items, id: \.self) { item in
                                                        MessageItemView()
                                                }
                                        }label:{
                                                Image(systemName: "person.3")
                                                Text("Saved Group")
                                        }
                                        DisclosureGroup(isExpanded: $contactExpanded) {
                                                ForEach(items, id: \.self) { item in
                                                        MessageItemView()
                                                }
                                        }label:{
                                                Image(systemName: "person")
                                                Text("Contact")
                                        }
                                }
                                
                                Spacer()
                        }
                        
                        .frame(minWidth: 150, idealWidth: 200, maxWidth: 300, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .padding(.all, 0.0)
                        
                        ContactView(selected:$selected)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
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

struct ContactView: View {
        @Binding var selected: MsgItem?
        @State var alias:String=""
        @State var remark:String="a beautifull singer"
        
        var body: some View {
                VStack{
                        HStack {
                                Image("test")
                                        .resizable().frame(width: 80, height: 80)
                                        .cornerRadius(12)
                                Spacer()
                                Text("NickName")
                        }.padding()
                        
                        Divider()
                        
                        VStack(alignment:.leading){
                                HStack{
                                        Text("address:")
                                        Text("NJ7CovsxYjK3JgMwHVuTv86vHqgmhRpitrgzAj335AkiDi")
                                }.padding()
                                
                                HStack{
                                        Text("balance:")
                                        Text("60.28NCT")
                                }.padding()
                                
                                HStack{
                                        Text("time:")
                                        if let date = selected?.timestamp{
                                                Text( itemFormatter.string(from:date))
                                        }else{
                                                Text( itemFormatter.string(from:Date()))
                                        }
                                }.padding()
                                
                                HStack{
                                        Text("alias:")
                                        TextField("tailor swift", text: $alias)
                                }.padding()
                                
                                
                                HStack{
                                        Text("remark:")
                                        Spacer()
                                        TextEditor(text: $remark)
                                                .frame(height: 80)
                                }.padding()
                                
                                
                        }.padding()
                        
                        Divider()
                        Button(action: addItem) {
                                Text("Message")
                        }.buttonStyle(.bordered)
                        Spacer()
                        
                }.padding()
        }
        
        private func addItem(){
                print("Edit button was tapped")
        }
}

struct Contact_Previews: PreviewProvider {
        @State static var selected: MsgItem?
        static var previews: some View {
                ContactMainView().frame(width: 880, height: 600, alignment: .center)
                ContactView(selected: $selected)
        }
}
