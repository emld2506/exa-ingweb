//
//  SaveView.swift
//  exa-ingweb
//
//  Created by CCDM24 on 28/11/22.
//

import SwiftUI

struct SaveView: View {
    let cdManager: DataManager
    @State var clv_obra = ""
    @State var clv_viga = ""
    @State var longitud = ""
    @State var material = ""
    @State var peso = ""
    
    var body: some View {
        VStack{
            TextField("Clave de obra: ", text : $clv_obra).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Clave de viga: ", text : $clv_viga).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Longitud: ", text : $longitud).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Material: ", text : $material).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Peso: ", text : $peso).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Guardar"){
                dcManager.guardarViga(clv_obra: clv_obra, clv_viga: clv_viga, longitud: longitud, material: material, peso: peso)
                clv_viga = ""
                clv_obra = ""
                longitud = ""
                material = ""
                peso = ""
            }
            
        }
    }
}



struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView(cdManager: DataManager())
    }
}
