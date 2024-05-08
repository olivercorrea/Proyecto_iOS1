import UIKit

class ViewControllerCrearTarea: UIViewController {
    
    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var swImportante2: UISwitch!
    
    var anteriorVC = ViewController()
    
    @IBAction func agregar(_ sender: Any) {
//        let tarea = Tarea()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tarea = Tarea(context: context)
        tarea.nombre = txtNombreTarea.text!
        tarea.importante = swImportante2.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        anteriorVC!.tareas.append(tarea)
//        anteriorVC!.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

 
}

