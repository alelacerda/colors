import SwiftUI

struct ColorPickerView: View {
    
    @Binding var viewState: Views
    @ObservedObject var colors: ColorData
    @State private var opacity: [CGFloat] = [0,0,0,0]
    @Binding var isEditing: Bool
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            
            Text("Choose a color and tap the UI element you want to paint")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
//                            .frame(width: 368)
                .padding(.bottom)
                .opacity(opacity[0])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(0.5)

                    withAnimation(baseAnimation) {
                        opacity[0] = 1
                    }
                }

            Text("When you're done, check the constrast results of your design!")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
//                            .frame(width: 368)
                .padding(.bottom)
                .opacity(opacity[1])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(2)

                    withAnimation(baseAnimation) {
                        opacity[1] = 1
                    }
                }
            
            
            VStack(alignment: .center) {
                Text("Color")
                    .font(.title)
                    .fontWeight(.semibold)
                    .opacity(opacity[2])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(3)

                    withAnimation(baseAnimation) {
                        opacity[2] = 1
                    }
                }
                Spacer()
                
                ColorSlider(value: $colors.redValue, label: "RED", color: Color(red: 255, green: 0, blue: 0))
                ColorSlider(value: $colors.greenValue, label: "GREEN", color: Color(red: 0, green: 255, blue: 0))
                ColorSlider(value: $colors.blueValue, label: "BLUE", color: Color(red: 0, green: 0, blue: 255))
                
                Spacer()
                
                HStack{
                    Spacer()
                    Rectangle()
                        .fill(Color(red: colors.redValue/255, green: colors.greenValue/255, blue: colors.blueValue/255, opacity: 1))
                        .frame(width: 114, height: 36)
                        .cornerRadius(13)

                    Spacer()
                }
                
            }
            .padding()
            
                .frame(width: 368, height: 400)
                .background(Color.white)
                .opacity(opacity[2])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1).delay(3)

                    withAnimation(baseAnimation) {
                        opacity[2] = 1
                    }
                }
                .cornerRadius(13)
                .shadow(color: .gray, radius: 10, x: 0, y: 10)
                
                //.padding()
            
            Button {
                isEditing = false
                withAnimation {
                    viewState = .contrastResults
                }
                
            } label: {
                Text("Check contrast results")
                    .frame(width: 368, height: 60)
                    .foregroundColor(.white)
                    .background(Color("buttonColor"))
                    .cornerRadius(13)
                    .padding(.top)
            }
            .disabled(opacity[3] == 0 ? true : false)
            .opacity(opacity[3])
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1).delay(4)

                withAnimation(baseAnimation) {
                    opacity[3] = 1
                }
            }
        }
        .frame(width: 368)
            .padding()

        
            

    }
}
