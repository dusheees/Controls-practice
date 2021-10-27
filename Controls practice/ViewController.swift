//
//  ViewController.swift
//  Controls practice
//
//  Created by Андрей on 27.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    // OutcLet Collection коллекция switch (массив)
    // перетягиваем из кода на все switch
    // создаем таги ввиде степени двойки
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // actions
    @IBAction func buttonPressed() {
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
    }
    
    @IBAction func sliderMoved() {
    }
    
    @IBAction func textFieldEdited() {
    }
    
}

