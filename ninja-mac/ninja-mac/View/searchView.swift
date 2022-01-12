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
                HStack{
                        HStack{
                                Image(systemName: "magnifyingglass")
                                
                                TextField(
                                        "searching",
                                        text: $searchText,
                                        onCommit: {
                                                print("onCommit:", self.searchText)
                                        }
                                )                                        .textFieldStyle(PlainTextFieldStyle())
                                
                                if self.searchText != ""{
                                        Button(action: {
                                                self.searchText = ""
                                        }) {
                                                Image(systemName: "xmark.circle.fill")
                                        }
                                }
                        }
//                        .padding()
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        .background(Color(red: 0.925, green: 0.925, blue: 0.925))
//                        .background(.red)
                        .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color(red: 0.925, green: 0.925, blue: 0.925),
                                                lineWidth: 1))
                        
                        Button {
                                print("Edit button was tapped")
                        } label: {
                                Image(systemName: "plus")
                                        .background(.black)
                        }
                }
//                .padding()
//                .frame(height: 30)
                .padding(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
//                .background(Color(red: 0.969, green: 0.969, blue: 0.969))
                                        .background(.red)
        }
}

struct searchView_Previews: PreviewProvider {
        @State static var searchText:String = ""
        static var previews: some View {
                searchView(searchText:$searchText)
        }
}
