//
//  ViewController.swift
//  Tangram
//
//  Created by Bruno Scheltzke on 05/10/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tangramBoard: TangramBoard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetBoard(_ sender: Any) {
        tangramBoard.makeTangram()
    }
    
    @IBAction func makeForm1(_ sender: Any) {
        tangramBoard.makeGoat()
    }
    
    @IBAction func makeForm2(_ sender: Any) {
        tangramBoard.makeCamel()
    }
    
    @IBAction func makeCat(_ sender: Any) {
        tangramBoard.makeCat()
    }
}
