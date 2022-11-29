import Foundation
import CoreData

class DataManager {
    let persistentContainer : NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores(completionHandler: {
            (desc, error) in
            if let error = error {
                fatalError("Falló la inicialización de Core Data \(error.localizedDescription)")
            }
            
        })
    }
    
    func guardarViga (clv_obra: String, clv_viga: String, longitud: String, material: String, peso: String){
        let viga = Viga(context: persistentContainer.viewContext)
        viga.clv_obra = clv_obra
        viga.clv_viga = clv_viga
        viga.longitud = longitud
        viga.material = material
        viga.peso = peso
        
        do{
            try persistentContainer.viewContext.save()
            print("Viga guardada")
        }
        catch{
            print("Fallo al guardar \(error.localizedDescription)")
        }
    }
    
    func listaVigas() -> [Viga]{
        let fetchReq : NSFetchRequest<Viga> = Viga.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchReq)
        }
        catch{
            return []
        }
    }
    
    func borrarViga(viga: Viga){
        persistentContainer.viewContext.delete(viga)
        
        do{
            try persistentContainer.viewContext.save()
        }
        catch{
            persistentContainer.viewContext.rollback()
            print("Fallo al intentar borrar \(error.localizedDescription)")
        }
    }
    
    func actualizarViga(viga: Viga){
        let fetchReq : NSFetchRequest<Viga> = Viga.fetchRequest()
        let predicate = NSPredicate(format: "clv_viga = %@", viga.clv_viga ?? "")
        fetchReq.predicate = predicate
        
        do{
            let datos = try persistentContainer.viewContext.fetch(fetchReq)
            let v = datos.first
            v?.clv_obra = viga.clv_obra
            v?.material = viga.material
            v?.longitud = viga.longitud
            v?.peso = viga.peso
            try persistentContainer.viewContext.save()
            print("Viga actualizada")
        }
        catch{
            persistentContainer.viewContext.rollback()
            print("Fallo al intentar actualizar \(error.localizedDescription)")
        }
    }
    
}
