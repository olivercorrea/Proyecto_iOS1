//
//  ViewControllerTareaCompletada.swift
//  Correa1UsoCoreData
//
//  Created by oliver Correa Cabana on 5/05/24.
//

import UIKit

class ViewControllerTareaCompletada: UIViewController {
    
    //var tarea = Tarea()
    var tarea:Tarea? = nil
    //var anteriorVC = ViewController() // step 75
    
    
    @IBOutlet weak var tareaLabel: UILabel!
    
    @IBAction func completarTarea(_ sender: Any) {
        
        //anteriorVC.tareas.remove(at: anteriorVC.indexSeleccionado)
        //anteriorVC.tableView.reloadData()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if tarea!.importante {
            tareaLabel.text = "😇\(tarea!.nombre!)"
        }else{	
            tareaLabel.text = tarea!.nombre!
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
