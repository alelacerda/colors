//
//  ResultsView.swift
//  wwdc
//
//  Created by Alessandra Fernandes Lacerda on 23/04/22.
//

import SwiftUI

struct ResultsView: View {
    
    @Binding var viewState: Views
    @ObservedObject var colors: ColorData
    //@State var contrasts: [CGFloat] = []
    @State var colorPairs: [[UIColor]] = [[]]
    @State var buttonIsPressed: [Bool] = [false, false, false, false, false]
    @State private var opacity: [CGFloat] = [0, 0, 0, 0]
    
    var body: some View {
        HStack{
            VStack{
                Text("Results")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .opacity(opacity[0])
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1).delay(0.2)
                        
                        withAnimation(baseAnimation) {
                            opacity[0] = 1
                        }
                    }
                HStack{
                    Image(systemName: "info.circle")
                        .font(.title2)
                    Text("As a general rule, contrast between background and text should be of at least 4.5:1 for the text to be readable.")
                        .font(.body)
                        .padding()
                }.opacity(opacity[1])
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1).delay(0.7)
                        
                        withAnimation(baseAnimation) {
                            opacity[1] = 1
                        }
                    }
                
                Text("Click on a result to see the details")
                    .padding()
                    .opacity(opacity[2])
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1).delay(2.5)
                        
                        withAnimation(baseAnimation) {
                            opacity[2] = 1
                        }
                    }
                
                Result(colors: $colorPairs)
                
                Spacer()
                
                Button {
                    withAnimation {
                        viewState = .colorFilters
                    }
                    
                } label: {
                    Text("Continue")
                        .frame(width: 368, height: 60)
                        .foregroundColor(.white)
                        .background(Color("buttonColor"))
                        .cornerRadius(13)
                }.opacity(opacity[3])
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1).delay(4)
                        
                        withAnimation(baseAnimation) {
                            opacity[3] = 1
                        }
                    }
            }.frame(width: 368, height: 664)
            
            
            VStack{
                
                Button {
                    
                    buttonIsPressed = [true, false, false, false, false]
                    
                    colorPairs = [[colors.backgroundColor,colors.coolTitleColor], [colors.backgroundColor, colors.coolSubtitleColor]]
                    
                } label: {
                    Image(systemName: colors.contrast(between: colors.backgroundColor, and: colors.coolTitleColor) > 4.5 &&
                          colors.contrast(between: colors.backgroundColor, and: colors.coolSubtitleColor) > 4.5 ?
                          "checkmark.circle.fill" : "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(buttonIsPressed[0] ? .black : Color("buttonColor"))
                }.padding(.top, 80)
                
                Spacer()
                Button {
                    
                    buttonIsPressed = [false, true, false, false, false]
                    
                    colorPairs = [[colors.backgroundColor,colors.cardColor], [colors.cardColor, colors.cardTitleColor]]
                    
                } label: {
                    Image(systemName: colors.contrast(between: colors.backgroundColor, and: colors.cardColor) > 4.5 &&
                          colors.contrast(between: colors.cardColor, and: colors.cardTitleColor) > 4.5 ?
                          "checkmark.circle.fill" : "x.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .foregroundColor(buttonIsPressed[1] ? .black : Color("buttonColor"))
                }.padding(.top, 40)
                Spacer()
                Button {
                    
                    buttonIsPressed = [false, false, true, false, false]
                    
//                    contrasts = [UIColor.contrastRatio(between: colors.backgroundColor, and: colors.coolTextTitleColor)]
                    colorPairs = [[colors.backgroundColor, colors.coolTextTitleColor]]
                    
                } label: {
                    Image(systemName: colors.contrast(between: colors.backgroundColor, and: colors.coolTextTitleColor) > 4.5 ?
                          "checkmark.circle.fill" : "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(buttonIsPressed[2] ? .black : Color("buttonColor"))
                }
                
                
                Button {
                    
                    buttonIsPressed = [false, false, false, true, false]
                    
//                    contrasts = [UIColor.contrastRatio(between: colors.backgroundColor, and: colors.coolTextColor)]
                    
                    colorPairs = [[colors.backgroundColor, colors.coolTextColor]]
                    
                } label: {
                    Image(systemName: colors.contrast(between: colors.backgroundColor, and: colors.coolTextColor) > 4.5 ?
                          "checkmark.circle.fill" : "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(buttonIsPressed[3] ? .black : Color("buttonColor"))
                }.padding(.top, 20)
                
                Spacer()
                Button {
                    
                    buttonIsPressed = [false, false, false, false, true]
                    
//                    contrasts = [UIColor.contrastRatio(between: colors.buttonColor, and: colors.buttonTextColor),
//                                 UIColor.contrastRatio(between: colors.backgroundColor, and: colors.buttonColor)]
                    
                    colorPairs = [[colors.buttonColor, colors.buttonTextColor], [colors.backgroundColor, colors.buttonColor]]
                    
                } label: {
                    Image(systemName: colors.contrast(between: colors.backgroundColor, and: colors.buttonColor) > 4.5 &&
                          colors.contrast(between: colors.buttonColor, and: colors.buttonTextColor) > 4.5 ?
                          "checkmark.circle.fill" : "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(buttonIsPressed[4] ? .black : Color("buttonColor"))
                }.padding(.bottom, 25)
                
                
            }.frame(height: 664)
            
            
        }
        
    }
}
