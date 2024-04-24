//
//  FirstViewController.swift
//  UsodeControlesCorrea
//
//  Created by oliver Correa Cabana on 23/04/24.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagen = UIImage(named: "calculador.png")
        imageView.image = imagen

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
