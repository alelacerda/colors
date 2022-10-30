//
//  ResultView.swift
//  wwdc
//
//  Created by Alessandra Fernandes Lacerda on 20/04/22.
//

import SwiftUI

struct Result: View {
    
    //@Binding var contrasts: [CGFloat]
    @Binding var colors: [[UIColor]]
    
    var body: some View {
        
        if colors != [[]] {
            
            VStack{
                ForEach(colors, id: \.self) { pair in
                    VStack{
                        HStack{
                            ZStack{
                                Circle().fill(Color(pair[0]))
                                Circle().strokeBorder(Color.black, lineWidth: 1)
                            }
                                .frame(width: 30, height: 30)
                                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                                
                            ZStack{
                                Circle().fill(Color(pair[1]))
                                Circle().strokeBorder(Color.black, lineWidth: 1)
                            }
                                .frame(width: 30, height: 30)
                                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                            
                            Text("\(String(format: "%.2f", UIColor.contrastRatio(between: pair[0], and: pair[1]))) : 1")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        
                        Text(UIColor.contrastRatio(between: pair[0], and: pair[1]) > 4.5 ?
                             "Great job! These colors work perfectly with each other!":
                             "Some user might find it difficult to read with this color scheme, maybe try something different next time.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    }.padding()
                
                }
                
            }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 13)
                    .stroke(Color.black, lineWidth: 1)
            )
        }
        
    }
}
