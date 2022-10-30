import SwiftUI

struct StartView: View {
    @Binding var viewState: Views
    @State private var opacity: CGFloat = 0
    
    var body: some View {
        
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 368)
                .padding()
                .opacity(opacity)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1.2).delay(1)

                    withAnimation(baseAnimation) {
                        opacity = 1
                    }
                }
            
            Button {
                withAnimation {
                    viewState = .infoView
                }
            } label: {
                Text("Start")
                    .frame(width: 368, height: 60)
                    .foregroundColor(.white)
                    .background(Color("buttonColor"))
                    .cornerRadius(13)
            }
            .disabled(opacity == 0)
            .opacity(opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1.2).delay(1)

                withAnimation(baseAnimation) {
                    opacity = 1
                }
            }
        }
    }
}
