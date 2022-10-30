import SwiftUI

struct ContentView: View {
    @StateObject var colors = ColorData()
    
    @State var isEditing: Bool = false
    
    @State var viewState: Views = .start
    
    @State var colorPickerDone: Bool = false
    
    var body: some View {
       ZStack{
           Color.white.ignoresSafeArea()
           
           if viewState == .start {
               
               StartView(viewState: $viewState)
               
           } else if viewState == .infoView {
               
               InfoView(viewState: $viewState, isEditing: $isEditing)
               
           } else {

               HStack {
                   
                   if viewState == .contrastResults {
                       
                       ResultsView(viewState: $viewState, colors: colors)
                       
                   }
                   
                   DesignView(colors: colors, isEditing: $isEditing)
                   
                   if viewState == .colorPicker {
      
                       ColorPickerView(viewState: $viewState, colors: colors,  isEditing: $isEditing)

                   } else if viewState == .colorFilters {
                       
                       ColorFiltersView(colors: colors, viewState: $viewState)
                       
                   } else if viewState == .uiTips {
                     
                       UITipsView(viewState: $viewState, colors: colors)
                       
                   }
                   
               }
               
           }
       }

    }
}

enum Views{
    case start
    case infoView
    case colorPicker
    case contrastResults
    case colorFilters
    case uiTips
}
