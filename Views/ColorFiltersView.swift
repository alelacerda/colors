import SwiftUI

struct ColorFiltersView: View {
    
    @ObservedObject var colors: ColorData
    @Binding var viewState: Views
    @State private var opacity: [CGFloat] = [0,0,0,0,0]
    
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                
                Text("Everyone sees colors differently")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                    .opacity(opacity[0])
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1).delay(0.2)
                        
                        withAnimation(baseAnimation) {
                            opacity[0] = 1
                        }
                    }
                
                Text("About 1 in 20 people are colorblind in some way, so it's important we test our interfaces for as many types of color blindness as we can.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                    .opacity(opacity[1])
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1).delay(1.5)
                        
                        withAnimation(baseAnimation) {
                            opacity[1] = 1
                        }
                    }
                
                Text("Choose below a type of color blindness to see what the interface we designed looks like for someone who has this condition.")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                    .opacity(opacity[2])
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1).delay(4)
                        
                        withAnimation(baseAnimation) {
                            opacity[2] = 1
                        }
                    }
                
                Menu {
                    ForEach(InclusiveColor.BlindnessType.allCases, id: \.self) { type in
                        Button {
                            colors.colorType = type
                        } label: {
                            Text(type.rawValue)
                        }
                    }
                } label: {
                    VStack(spacing: 5){
                        HStack{
                            Text(colors.colorType.rawValue)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color.black)
                                .font(Font.system(size: 20, weight: .medium))
                        }
                        .padding(.horizontal)
                        
                    }
                }.frame(width: 368, height: 60)
                    .background(.white)
                    .cornerRadius(13)
                    .shadow(color: .gray, radius: 10, x: 0, y: 10)
                    .opacity(opacity[3])
                    .onAppear {
                        let baseAnimation = Animation.easeInOut(duration: 1).delay(4.5)
                        
                        withAnimation(baseAnimation) {
                            opacity[3] = 1
                        }
                    }
                
                
            }.frame(maxWidth: 368)
                .padding()
            
            Button {
                withAnimation {
                    viewState = .uiTips
                    colors.colorType = .normal
                }
                
            } label: {
                Text("Continue")
                    .frame(width: 368, height: 60)
                    .foregroundColor(.white)
                    .background(Color("buttonColor"))
                    .cornerRadius(13)
                //.shadow(color: .gray, radius: 60, x: 0, y: 10)
            }.opacity(opacity[4])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(5)
                    
                    withAnimation(baseAnimation) {
                        opacity[4] = 1
                    }
                }
        }
    }
}
