import SwiftUI

struct UITipsView: View {
    
    @Binding var viewState: Views
    @ObservedObject var colors: ColorData
    @State private var opacity: [CGFloat] = [0,0,0,0,0,0,0,0,0]
    
    var body: some View {
        
        VStack{
            Text("You did a great job!")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .opacity(opacity[0])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(0.2)

                    withAnimation(baseAnimation) {
                        opacity[0] = 1
                    }
                }
            
            Text("Here are some tips on how to improve even more your future designs:")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .opacity(opacity[1])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(1.2)

                    withAnimation(baseAnimation) {
                        opacity[1] = 1
                    }
                }
            
            
            Text("Don’t rely solely on color to differentiate between objects or communicate important information.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[2])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(2.5)

                    withAnimation(baseAnimation) {
                        opacity[2] = 1
                    }
                }
            
            Text("Use strongly contrasting colors to improve readability.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[3])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(4)

                    withAnimation(baseAnimation) {
                        opacity[3] = 1
                    }
                }
            
            Text("Consider choosing a limited color palette.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[4])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(6)

                    withAnimation(baseAnimation) {
                        opacity[4] = 1
                    }
                }
            
            Text("Test your app’s color scheme under a variety of lighting conditions.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[5])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(8)

                    withAnimation(baseAnimation) {
                        opacity[5] = 1
                    }
                }
            
            Text("Avoid using the same color for interactive and noninteractive elements.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[6])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(10)

                    withAnimation(baseAnimation) {
                        opacity[6] = 1
                    }
                }
            
            Text("Keep it simple.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[7])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(12)

                    withAnimation(baseAnimation) {
                        opacity[7] = 1
                    }
                }
            
            Button {
                withAnimation {
                    viewState = .start
                    
                    colors.backgroundColor = .white
                    colors.coolTitleColor = .black
                    colors.coolSubtitleColor = .gray
                    colors.cardColor = .lightGray
                    colors.cardTitleColor = .white
                    colors.coolTextTitleColor = .black
                    colors.coolTextColor = .black
                    colors.buttonColor = .gray
                    colors.buttonTextColor = .white
                    
                    colors.redValue = 0
                    colors.greenValue = 0
                    colors.blueValue = 0
                }
                
            } label: {
                Text("Return to start")
                    .frame(width: 368, height: 60)
                    .foregroundColor(.white)
                    .background(Color("buttonColor"))
                    .cornerRadius(13)
                    //.shadow(color: .gray, radius: 10, x: 0, y: 10)
            }
            .opacity(opacity[8])
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1).delay(14)

                withAnimation(baseAnimation) {
                    opacity[8] = 1
                }
            }
        }.frame(width: 368)
            .padding()
        
        

    }
}
