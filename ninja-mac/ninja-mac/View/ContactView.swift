//
//  Contact.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/11.
//

import SwiftUI

struct ContactView: View {
        
        @State var selected: Int? = nil
        
        var body: some View {
                
                HSplitView {
                        List(0...60, id: \.self, selection: $selected) { number in
                                HStack {
                                        Text("Select \(number)")
                                        Spacer()
                                }
                                .background((selected == number ? highlightOverlay : nil).offset(x: -10, y: 0))
                                .contentShape(Rectangle())
                                .onTapGesture {
                                        selected = number
                                }
                        }.background(.red)
                                .frame(minWidth:150,idealWidth: 200, maxWidth: 350, maxHeight: .infinity)
                                .listStyle(SidebarListStyle())
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
                ContactView().frame(width: 880, height: 600, alignment: .center)
        }
}
