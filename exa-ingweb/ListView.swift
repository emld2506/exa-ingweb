//
//  ListView.swift
//  exa-ingweb
//
//  Created by CCDM24 on 28/11/22.
//

import SwiftUI

struct ListView: View {
    let cdManager: DataManager
    var vigaArray: Viga[]
    var body: some View {
        VStack{
            List{
                ForEach(vigaArray, id: \.self){
                    viga in
                    VStack{
                        Text(viga.clv_obra ?? "")
                        Text(viga.clv_viga ?? "")
                        Text(viga.longitud ?? "")
                        Text(viga.material ?? "")
                        Text(viga.peso ?? "")
                    }
                }.onDelete(perform: {
                    indexSet in
                    indexSet.forEach({ index in
                        let vigaDel = vigaArray[index]
                        cdManager.borrarViga(viga: vigaDel)
                        listaVigas()
                    })
                })
            }
        }.padding()
            .onAppear(perform: listaVigas())
    }
}

func listaVigas(){
    vigaArray = cdManager.listaVigas()
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(cdManager: DataManager())
    }
}
