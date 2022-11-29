//
//  ListView.swift
//  exa-ingweb
//
//  Created by CCDM24 on 28/11/22.
//

import SwiftUI

struct ListView: View {
    var cdManager: DataManager
    var vArray: [Viga]
    
    var body: some View {
        VStack{
            List{
                ForEach(vArray, clv_viga: \.self){
                    viga in
                    VStack{
                        Text(viga.clv_obra ?? "")
                        Text(viga.clv_viga ?? "")
                        Text(viga.longitud ?? "")
                        Text(viga.material ?? "")
                        Text(viga.peso ?? "")
                        Spacer()
                        HStack{
                            
                        }
                    }
                }.onDelete(perform: {
                    indexSet in
                    indexSet.forEach({ index in
                        let vigaDel = vArray[index]
                        cdManager.borrarViga(viga: vigaDel)
                        vArray = cdManager.listaVigas()
                    })
                })
            }
        }.padding().onAppear(perform: listaElementos())
            
    }
    
    mutating func listaElementos() -> Void {
        self.vArray = cdManager.listaVigas()
    }
    
}





struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(cdManager: DataManager(), vArray: [Viga].init())
    }
}
