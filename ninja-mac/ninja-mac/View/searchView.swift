//
//  searchView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/12.
//

import SwiftUI

struct searchView: View {
        @Binding var searchText:String
        
        var body: some View {
                HStack(){
                        HStack{
                                Image(systemName: "magnifyingglass")
                                
                                TextField(
                                        "searching",
                                        text: $searchText,
                                        onCommit: {
                                                print("onCommit")
                                        })
                                        .foregroundColor(.gray)
                                        .disableAutocorrection(true)
                                        .cornerRadius(2)
                                        .buttonStyle(.plain)
                                
                                if self.searchText != ""{
                                        Button(action: {
                                                self.searchText = ""
                                        }) {
                                                Image(systemName: "xmark.circle.fill")
                                        }
                                }
                                
                        }
                        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                        .foregroundColor(.primary)
                        .background(.secondary)
                        .cornerRadius(4.0)
                        
                        Button {
                                print("Edit button was tapped")
                        } label: {
                                Image(systemName: "plus")
                        }
                }
                .padding(.all, 0.0)
                .background(.green)
        }
}

struct searchView_Previews: PreviewProvider {
        @State static var searchText:String = ""
        static var previews: some View {
                searchView(searchText:$searchText)
        }
}
