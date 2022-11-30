import SwiftUI

struct ContentView: View {
    var cdManager: DataManager
    var body: some View {
        TabView{
            SaveView(cdManager: cdManager)
                .tabItem(){
                    Image(systemName: "square.and.pencil")
                    Text("Registrar")
            }
            
            ListView(cdManager: cdManager, vArray: [Viga].init())
                .tabItem(){
                    Image(systemName: "folder")
                    Text("Inventario")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cdManager: DataManager())
    }
}
