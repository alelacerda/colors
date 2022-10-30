import SwiftUI

struct DesignView: View {
    @ObservedObject var colors: ColorData
    
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //header - fixo
            HStack{
                Text("9:40")
                Spacer()
                Image(systemName: "battery.50")
                
            }.padding()
            
            HStack{
                VStack(alignment: .leading){
                    Text("Cool title")
                        .font(.largeTitle)
                        .foregroundColor(Color(colors.coolTitleColor.inclusiveColor(for: colors.colorType)))
                        .onTapGesture {
                            if isEditing {
                                colors.coolTitleColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                            }
                            
                            
                        }
                    
                    Text("Even cooler subtitle")
                        .font(.subheadline)
                        .foregroundColor(Color(colors.coolSubtitleColor.inclusiveColor(for: colors.colorType)))
                        .onTapGesture {
                            if isEditing {
                                colors.coolSubtitleColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                            }
                        }
                }
                
                Spacer()
                
            }.padding()
            RoundedRectangle(cornerRadius: 13)
                .fill(Color(colors.cardColor.inclusiveColor(for: colors.colorType)))
                .frame(width: 292, height: 185)
                .onTapGesture {
                    if isEditing {
                        colors.cardColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                    }
                }
                .overlay(alignment: .bottomLeading, content: {
                    Text("Nice Card")
                        .padding()
                        .font(.title)
                        .foregroundColor(Color(colors.cardTitleColor.inclusiveColor(for: colors.colorType)))
                        .onTapGesture {
                            if isEditing {
                                colors.cardTitleColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                            }
                        }
                    
                })
                .padding()
            
            VStack{
                HStack{
                    Text("Cool Text")
                        .font(.title2)
                        .foregroundColor(Color(colors.coolTextTitleColor.inclusiveColor(for: colors.colorType)))
                        .onTapGesture {
                            if isEditing {
                                colors.coolTextTitleColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                            }
                        }
                    Spacer()
                    
                        .foregroundColor(.gray)
                }
                
                Text("This is a cool text about cool stuff, like the person designing this app right now, or maybe the future users of this cool app. Can it get any cooler than this?")
                    .font(.body)
                    .foregroundColor(Color(colors.coolTextColor.inclusiveColor(for: colors.colorType)))
                    .onTapGesture {
                        if isEditing {
                            colors.coolTextColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                            
                        }
                    }
            }.padding()
            
            
            
            
            
            Spacer()
            
            ZStack(alignment: .center){
                
                Rectangle()
                    .fill(Color(colors.buttonColor.inclusiveColor(for: colors.colorType)))
                    .cornerRadius(13)
                    .frame(width: 290, height: 66)
                    .onTapGesture {
                        if isEditing {
                            colors.buttonColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                        }
                    }
                Text("Press me!")
                    .foregroundColor(Color(colors.buttonTextColor.inclusiveColor(for: colors.colorType)))
                    .onTapGesture {
                        if isEditing {
                            colors.buttonTextColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                        }
                    }
            }.padding()
            
        }
        .frame(width: 324, height: 664, alignment: .center)
        .background(Color(colors.backgroundColor.inclusiveColor(for: colors.colorType))
            .shadow(color: .gray, radius: 20, x: 0, y: 10)
            .onTapGesture {
                if isEditing {
                    colors.backgroundColor = UIColor(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, alpha: 1)
                }
            }
        )
        
    }
}
