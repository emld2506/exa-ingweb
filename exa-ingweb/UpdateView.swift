//
//  UpdateView.swift
//  exa-ingweb
//
//  Created by CCDM24 on 28/11/22.
//

import SwiftUI

struct UpdateView: View {
    var viga : Viga
    var cdManager: DataManager
    var body: some View {
        HStack{
            TextField("Clave de obra: ", text : viga.clv_obra).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Longitud: ", text : viga.longitud).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Material: ", text : viga.material).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Peso: ", text : viga.peso).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Actualizar"){
                cdManager.actualizarViga(viga: viga)
            }
        }.padding()
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView(viga: Viga(), cdManager: DataManager())
    }
}
