//
//  ListView.swift
//  exa-ingweb
//
//  Created by CCDM24 on 28/11/22.
//

import SwiftUI

struct ListView: View {
    @State var cdManager: DataManager
    @State var vArray: [Viga]
    
    var body: some View {
        VStack{
            NavigationView{

                List{
                    ForEach(vArray, clv_viga: \.self){
                        viga in
                        VStack{
                            NavigationLink(destination: UpdateView(viga: viga, cdManager : cdManager)){
                                Text(viga.clv_obra ?? "")
                                Text(viga.clv_viga ?? "")
                                Text(viga.longitud ?? "")
                                Text(viga.material ?? "")
                                Text(viga.peso ?? "")
                            }
                        }.padding()
                    }.onDelete(perform: {
                        indexSet in
                        indexSet.forEach({ index in
                            let vigaDel = vArray[index]
                            cdManager.borrarViga(viga: vigaDel)
                            vArray = cdManager.listaVigas()
                        })
                    })
                }
            }.padding
                .onAppear{
                    cdManager = DataManager()
                    listaElementos()}
        }
            
    }
    
    func listaElementos(){
        vArray = cdManager.listaVigas()
    }
    
}





struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(cdManager: DataManager())
    }
}
