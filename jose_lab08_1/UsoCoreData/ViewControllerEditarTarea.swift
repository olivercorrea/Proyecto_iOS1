import UIKit

class ViewControllerEditarTarea: UIViewController {

    var tarea = Tarea()

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var importanciaSwitch: UISwitch!
       

    @IBAction func guardarCambios(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        tarea.nombre = nombreTextField.text
        tarea.importante = importanciaSwitch.isOn

        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nombreTextField.text = tarea.nombre
        importanciaSwitch.isOn = tarea.importante
    }
}
