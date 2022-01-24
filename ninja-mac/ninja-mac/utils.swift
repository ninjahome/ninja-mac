//
//  utils.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/10.
//

import Foundation
import ninjaLib
import AppKit
import CoreImage.CIFilterBuiltins
import SwiftUI
import UniformTypeIdentifiers

extension String {
        var localized: String {
                return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
        }
        func format(parameters: CVarArg...) -> String {
                return String(format: self, arguments: parameters)
        }
        
        func toGoStr() ->GoString {
                let cs = (self as NSString).utf8String
                let buffer = UnsafePointer<Int8>(cs!)
                return GoString(p:buffer, n:strlen(buffer))
        }
}



public let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
}()

func pickFile(types:[UTType])->URL?{
        
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.allowsMultipleSelection = false;
        dialog.canChooseDirectories = false;
        dialog.allowedContentTypes        = types
        
        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
                return dialog.url
        }
        
        return nil
        
}
public func genrateQRImage(data:Data) -> Image {
        
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
                
                if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent){
                        let nsImg = NSImage(cgImage: qrCodeCGImage, size: NSSize(width: 400,height: 400))
                        return    Image(nsImage: nsImg)
                }
        }
        
        return Image(systemName: "xmark")
}

func parseQR(image:CIImage) -> String?{
        let detector = CIDetector(ofType: CIDetectorTypeQRCode,
                                  context: nil,
                                  options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
        
        let features = detector?.features(in: image) ?? []
        
        return features.compactMap { feature in
                return (feature as? CIQRCodeFeature)?.messageString
        }[0]
}

func toISODate(dateStr:String?)->Date?{
        guard let str = dateStr else{
                return nil
        }
        let utcISODateFormatter = ISO8601DateFormatter()
        return utcISODateFormatter.date(from: str)
}

func toChatMsgTime(date:Date)->String{
        
        let calendar = Calendar.current
        
        let format = DateFormatter()
        if calendar.isDateInToday(date){
                format.dateFormat = "HH:mm:ss"
                return format.string(from: date)
        }
        format.dateFormat = "MM-dd HH:mm"
        return format.string(from: date)
}
