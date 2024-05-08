//
//  ViewControllerTareaCompletada.swift
//  UsoCoreData
//
//  Created by Joshua Tapia on 17/10/23.
//

import UIKit

class ViewControllerTareaCompletada: UIViewController {
    
    var tarea = Tarea()
//    var anteriorVC: ViewController?
    

    @IBOutlet weak var tareaLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if tarea.importante {
            tareaLabel.text = "😇\(tarea.nombre!)"
        }else{
            tareaLabel.text = tarea.nombre
        }
    }
    @IBAction func completarTarea(_ sender: Any) {
//        anteriorVC!.tareas.remove(at: anteriorVC!.indexSeleccionado)
//        anteriorVC!.tableView.reloadData()
//        navigationController?.popViewController(animated: true)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editaTarea(_ sender: Any) {
        performSegue(withIdentifier: "editarTareaSegue", sender: tarea)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editarTareaSegue" {
            let siguienteVC = segue.destination as! ViewControllerEditarTarea
            siguienteVC.tarea = sender as! Tarea
        }
    }
}
