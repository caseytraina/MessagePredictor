//
//  ProgressBar.swift
//  MessagePredictor
//
//  Created by Casey Traina on 5/31/21.
//

import SwiftUI

struct ProgressBar: View {
    
    @State var circleProgress: CGFloat
    
    var body: some View {
        VStack{
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 10)
                .frame(width: 100, height: 100)
            Circle()
                .trim(from: 0.0, to: circleProgress)
                .stroke(Color.black, lineWidth: 10)
                .frame(width: 100-20, height: 100-20)
                .rotationEffect(Angle(degrees: -90))
            Text("\(Int(self.circleProgress*100))%")
                .font(.custom("SF Compact Rounded", size: 20.0))
                .foregroundColor(Color.white)
        }
        Button(action: {self.startLoading()}) {
            Text("Start timer")
        }
        }
        
    }
    
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                self.circleProgress += 0.01
                if self.circleProgress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(circleProgress: 0.5)
    }
}
