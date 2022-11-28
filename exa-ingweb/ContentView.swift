import SwiftUI

struct ContentView: View {
    let cdManager: DataManager
    var body: some View {
        TabView{
            tabItem(label: "Registro" -> SaveView){
                
            }
            
            tabItem(label: "Datos" -> ListView){
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cdManager: DataManager())
    }
}
