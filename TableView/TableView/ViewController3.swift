//
//  ViewController3.swift
//  TableView
//
//  Created by oliver Correa Cabana on 11/04/24.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var selectedDestination: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedDestination = selectedDestination {
            let imageName = selectedDestination.lowercased().replacingOccurrences(of: " ", with: "_") + ".jpg"
            imageView.image = UIImage(named: imageName)
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
