import SwiftUI

struct ColorSlider: View {
    @Binding var value: CGFloat
    var label: String
    var color: Color
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text("\(Int(value))")
                .foregroundColor(.gray)
        }
        
        Slider(value: $value, in: 0...255).accentColor(color)
    }
}
