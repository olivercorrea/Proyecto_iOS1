//
//  ViewController.swift
//  miPrimerApp
//
//  Created by oliver Correa Cabana on 7/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Se activo la funcion viewDidLoad del viewControler 1")
    }
    override func loadView() {
        super.loadView()
        print("Se activo la funcion loadView del viewControler 1")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Se activo la funcion viewWillApear del viewControler 1")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Se activo la funcion viewDidAppear del viewControler 1")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Se activo la funcion viewWillDisappear del viewControler 1")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Se activo la funcion viewDidDisappear del viewControler 1")
    }
}

