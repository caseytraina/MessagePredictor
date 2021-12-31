//
//  ContentView.swift
//  MessagePredictor
//
//  Created by Casey Traina on 1/31/21.
//
import SwiftUI

struct ContentView: View {
//    @State var progressValue: CGFloat
    @State var total = CGFloat(100.0)
    @State var progress = progressValue
    
    var body: some View {

        VStack{
            
            HStack{
                Spacer()
                Text("1")
                    .font(Font.custom("SF Compact Rounded", size: 70.0))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
                Text("Please")
                    .font(Font.custom("SF Compact Rounded", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                Button(action: FindFile) {
                    Text("Select the File")
                        .font(Font.custom("SF Compact Rounded", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .underline()
                        .multilineTextAlignment(.center)
//                    ProgressBar(circleProgress: circleProgressVal)
//                        .padding(.horizontal)
                    
                }
                .padding(.trailing)
                .border(Color.clear, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .background(Color.clear)
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("2")
                    .font(Font.custom("SF Compact Rounded", size: 70.0))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
                Button(action: openDB) {
                    Text("Open the Database")
                        .font(Font.custom("SF Compact Rounded", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .underline()
                        .multilineTextAlignment(.center)
                    
                }
                .border(Color.clear, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .background(Color.clear)
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            HStack{
                Spacer()
                Text("3")
                    .font(Font.custom("SF Compact Rounded", size: 70.0))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
                Button(action: handleData) {
                    Text("Sort the Messages")
                        .font(Font.custom("SF Compact Rounded", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .underline()
                        .multilineTextAlignment(.center)
                    
                }
                .border(Color.clear, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .background(Color.clear)
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("4")
                    .font(Font.custom("SF Compact Rounded", size: 70.0))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
                Button(action: preprocess) {
                    Text("Process the Messages")
                        .font(Font.custom("SF Compact Rounded", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .underline()
                        .multilineTextAlignment(.center)
                    
                }
                .border(Color.clear, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .background(Color.clear)
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            HStack{
                Spacer()
                Text("5")
                    .font(Font.custom("SF Compact Rounded", size: 70.0))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.trailing)
                Text("Finally")
                    .font(Font.custom("SF Compact Rounded", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                Button(action: classify) {
                    Text("Create the Generator")
                        .font(Font.custom("SF Compact Rounded", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .underline()
                        .multilineTextAlignment(.center)
                    
                }
                .border(Color.clear, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .background(Color.clear)
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            
        }
        .frame(width: 800.0, height: 600.0)
        .background(Color(hue: 0.575, saturation: 0.591, brightness: 0.966))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(/*progressValue: CGFloat(progress)*/)
            .padding(.all)
            .environment(\.sizeCategory, .medium)
    }
}

