import SwiftUI

struct InfoView: View {
    @Binding var viewState: Views
    @Binding var isEditing: Bool
    @State private var opacity: [CGFloat] = [0,0,0,0,0]
    
    var body: some View {
        
        VStack {

            Text("Hey, we need your help!")
                .font(.body)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[0])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1.2).delay(0.2)

                    withAnimation(baseAnimation) {
                        opacity[0] = 1
                    }
                }

            Text("We're developing a really cool app and we  want to reach as many cool people as we can, but for that our app needs to be accessible for all users.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[1])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1.2).delay(1.5)

                    withAnimation(baseAnimation) {
                        opacity[1] = 1
                    }
                }

            Text("We need to choose the right colors for our interface, making sure they have enough contrast between each other.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[2])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1.2).delay(5.5)

                    withAnimation(baseAnimation) {
                        opacity[2] = 1
                    }
                }

            Text("Can you help us out?")
                .font(.body)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .opacity(opacity[3])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1.2).delay(8.5)

                    withAnimation(baseAnimation) {
                        opacity[3] = 1
                    }
                }
            
            Button {
                isEditing = true
                withAnimation {
                    viewState = .colorPicker
                }
                
            } label: {
                Text("Let's go!")
                    .font(.body)
                    .frame(width: 368, height: 60)
                    .foregroundColor(.white)
                    .background(Color("buttonColor"))
                    .cornerRadius(13)
            }.opacity(opacity[4])
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1.2).delay(9.5)

                    withAnimation(baseAnimation) {
                        opacity[4] = 1
                    }
                }
        }.frame(width: 368)
            
        
        

    }
}
