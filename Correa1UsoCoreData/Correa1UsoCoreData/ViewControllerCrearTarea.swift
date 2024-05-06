//
//  ViewControllerCrearTarea.swift
//  Correa1UsoCoreData
//
//  Created by oliver Correa Cabana on 5/05/24.
//

import UIKit

class ViewControllerCrearTarea: UIViewController {
    
    var anteriorVC = ViewController()
    
    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var swImportante: UISwitch!
    
    @IBAction func agregar(_ sender: Any) {
        let tarea = Tarea()
        tarea.nombre = txtNombreTarea.text!
        tarea.importante = swImportante.isOn
        
        // Agregar un elemento al array en el segundo ViewController
        anteriorVC.tareas.append(tarea) // Agregamos tarea al arreglo de tareas
        anteriorVC.tableView.reloadData() // Recargamos la data al tableView de la anterior vista
        navigationController?.popViewController(animated: true) // Mostramos la ultima vista referenciada a traves de nuestro NavigationController
    }
           
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
