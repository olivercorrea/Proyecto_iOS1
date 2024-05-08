//
//  ViewController.swift
//  Correa1UsoCoreData
//
//  Created by oliver Correa Cabana on 5/05/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
     // Important for the first part hasta la parte 53
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        
        if tarea.importante {
            cell.textLabel?.text = "😃\(tarea.nombre!)"
        }else{
            cell.textLabel?.text = "😔\(tarea.nombre!)"
        }
        
        //cell.textLabel?.text = tarea.nombre
        return cell
    }
    
    //var indexSeleccionado: Int = 0 // Step 73
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //indexSeleccionado = indexPath.row // Step 74: To know if the item shoosen in the array, so we can erase it without problems
        
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var tareas: [Tarea] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        //tareas = crearTareas() // Step 91
    }
    
    /*
    func crearTareas() -> [Tarea] {
        let tarea1 = Tarea()
        tarea1.nombre = "Estudiar para el examen"
        tarea1.importante = false
        
        let tarea2 = Tarea()
        tarea2.nombre = "Hacer los laboratorios"
        tarea2.importante = true
        
        let tarea3 = Tarea()
        tarea3.nombre = "Estudiar para subsa"
        tarea3.importante = false
        
        return [tarea1, tarea2, tarea3]
        
    }
    */
    
    //
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
    }
    
    // Llenar data que tenemos guradada en la base de datos
    func obtenerTareas() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tareas = try context.fetch(Tarea.fetchRequest()) as! [Tarea]
        } catch {
            print("Error al leer entidad de CoreData")
        }
    }
    
    
    // Funcion para determianr los datos a enviar por un segue especificos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /* // Hasta el paso 53
        let siguenteVC = segue.destination as! ViewControllerCrearTarea
        siguenteVC.anteriorVC = self
         */
        /*
        if segue.identifier == "agregarSegue" {
            let siguienteVC = segue.destination as! ViewControllerCrearTarea
            siguienteVC.anteriorVC = self
        } else if(segue.identifier == "tareaSeleccionadaSegue"){
            let siguienteVC = segue.destination as! ViewControllerTareaCompletada //step 62
            siguienteVC.tarea = sender as! Tarea
            siguienteVC.anteriorVC = self // Step 76: Para determinar cual es la vista anterior
        }
         */
        
        
        if(segue.identifier == "tareaSeleccionadaSegue"){ // step 100
            let siguienteVC = segue.destination as! ViewControllerTareaCompletada
            siguienteVC.tarea = sender as! Tarea
            //siguienteVC.anteriorVC = self
        }
        
    }
    
}

