//
//  QRCodeView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/21.
//
import Foundation
import SwiftUI

struct QRCodeView: View {
        @Binding var isVisible: Bool
        var txtContent : String
        
        var body: some View {
                VStack{
                genrateQRImage(data: Data(txtContent.utf8))
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        Button("OK") {
                                self.isVisible = false
                        }
                }.padding()
        }
        
        
}

struct QRCodeView_Previews: PreviewProvider {
        static var previews: some View {
                QRCodeView(isVisible: .constant(true), txtContent: "https://blog.devgenius.io/camera-preview-and-a-qr-code-scanner-in-swiftui-48b111155c66")
        }
}
