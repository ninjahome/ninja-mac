//
//  QRCodeView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/21.
//
import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
        @Binding var isVisible: Bool
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        var txtContent : String
        
        var body: some View {
                VStack{
                genrateQRImage(_url: txtContent)
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        Button("OK") {
                                self.isVisible = false
                        }
                }.padding()
        }
        
        func genrateQRImage(_url:String) -> Image {
                
                let data = Data(txtContent.utf8)
                
                filter.setValue(data, forKey: "inputMessage")
                
                if let qrCodeImage = filter.outputImage {
                        
                        if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent){
                                let nsImg = NSImage(cgImage: qrCodeCGImage, size: NSSize(width: 400,height: 400))
                                return    Image(nsImage: nsImg)
                        }
                }
                
                return Image(systemName: "xmark")
        }
}

struct QRCodeView_Previews: PreviewProvider {
        static var previews: some View {
                QRCodeView(isVisible: .constant(true), txtContent: "https://blog.devgenius.io/camera-preview-and-a-qr-code-scanner-in-swiftui-48b111155c66")
        }
}
