//
//  UpdateView.swift
//  exa-ingweb
//
//  Created by CCDM24 on 28/11/22.
//

import SwiftUI

struct UpdateView: View {
    @State var viga : Viga
    @State var clv_obra = ""
    @State var longitud = ""
    @State var material = ""
    @State var peso = ""
    var cdManager: DataManager
    var body: some View {
        VStack{
            TextField("Clave de obra: ", text : $clv_obra).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Longitud: ", text : $longitud).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Material: ", text : $material).textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Peso: ", text : $peso).textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Actualizar"){
                viga.clv_obra = clv_obra
                viga.longitud = longitud
                viga.material = material
                viga.peso = peso
                cdManager.actualizarViga(viga: viga)
            }
        }.padding()
            .onAppear{
                clv_obra = viga.clv_obra ?? ""
                longitud = viga.longitud ?? ""
                material = viga.material ?? ""
                peso = viga.peso ?? ""
            }
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView(viga: Viga(), cdManager: DataManager())
    }
}
