//
//  CircularProgressView.swift
//  ninja-mac
//
//  Created by wesley on 2022/1/24.
//

import SwiftUI

struct CircularProgressView: ProgressViewStyle {
        func makeBody(configuration: Configuration) -> some View {
                ZStack {
                        Circle()
                                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3, dash: [10, 5]))
                                .rotationEffect(.degrees(-90))
                                .frame(width: 200)
                        
                        if let fractionCompleted = configuration.fractionCompleted {
                                Text(fractionCompleted < 1 ?
                                     "Completed \(Int((configuration.fractionCompleted ?? 0) * 100))%"
                                     : "Done!"
                                )
                                        .fontWeight(.bold)
                                        .foregroundColor(fractionCompleted < 1 ? .orange : .green)
                                        .frame(width: 180)
                        }
                }
        }
}

struct LinearProgressView: View {
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ProgressView("Downloading…", value: downloadAmount, total: 100)
            .onReceive(timer) { _ in
                if downloadAmount < 100 {
                    downloadAmount += 2
                }
            }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
        static var previews: some View {
                ProgressView("Loading...", value: 100, total: 100)
                        .progressViewStyle(CircularProgressView())
                LinearProgressView()
        }
}
