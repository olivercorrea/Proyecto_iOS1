//
//  TableViewControllerNuevo.swift
//  Correa1TableViewController
//
//  Created by oliver Correa Cabana on 17/04/24.
//

import UIKit

/*
class TableViewCellNuevo:UITableViewCell{
    @IBOutlet weak var etiqueta: UILabel!
    
    @IBOutlet weak var imagenNumeros: UIImageView!
}
*/

class TableViewControllerNuevo: UITableViewController {
    
    var arregloNumeros = ["1", "2", "3", "4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem // Mostrar boton de edicion
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        setEditing(true, animated: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //title = "Oliver1TableViewController"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arregloNumeros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) //as! TableViewCellNuevo

        // Configure the cell...
        cell.textLabel?.text = arregloNumeros[indexPath.row]
        switch cell.textLabel?.text {
        case "1":
            cell.imageView?.image = UIImage(named: "ICONOS/1.png")
            cell.detailTextLabel?.text = "Celda numero 1"
        case "2":
            cell.imageView?.image = UIImage(named: "ICONOS/2.png")
            cell.detailTextLabel?.text = "Celda numero 2"
        case "3":
            cell.imageView?.image = UIImage(named: "ICONOS/3.png")
            cell.detailTextLabel?.text = "Celda numero 3"
        case "4":
            cell.imageView?.image = UIImage(named: "ICONOS/4.png")
            cell.detailTextLabel?.text = "Celda numero 4"
        default:
            print("No hay mas elementos para llenar imagen")
            cell.detailTextLabel?.text = "Celda fuera de rango"
        }
        return cell
    }
    	

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

/*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            arregloNumeros.remove(at: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // funcion para mover los elementos de TableView
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let objectoMovido = self.arregloNumeros[fromIndexPath.row]
        arregloNumeros.remove(at: fromIndexPath.row)
        arregloNumeros.insert(objectoMovido, at: to.row)
        NSLog("%@", "\(fromIndexPath.row) => \(to.row) \(arregloNumeros)")
    }
    
    // Funcion para editar los botones, el texto principalmente
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if (self.isEditing) {
            self.editButtonItem.title = "Editar"
        }
        else {
            self.editButtonItem.title = "Hecho"
        }
    }
    
    // Personalisar el boton Delete
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let botonEliminar = UITableViewRowAction(style: .normal, title: "Eliminar")
        { (accionesFila, indiceFila) in
            self.arregloNumeros.remove(at: indexPath.row)
            tableView.reloadData()
        }
        botonEliminar.backgroundColor = UIColor.red
        
        let botonInsertar = UITableViewRowAction(style: .normal, title: "Insertar")
        { (accionesFila, indiceFila) in
            let ultimoElemento = self.arregloNumeros[self.arregloNumeros.count-1]
            tableView.reloadData()
        }
        botonEliminar.backgroundColor = UIColor.green
        
        return[botonEliminar, botonInsertar]
    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
