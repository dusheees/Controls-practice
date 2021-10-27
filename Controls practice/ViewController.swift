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
    
    // 8-битное число без знака
    var number: UInt8 = 128 {
        didSet{
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    
    /// Updates all outlets to number
    func updateUI() {
        button.setTitle("\(number)", for: [])
        
        // TODO: set switches to number
        
        slider.value = Float(number)
        textField.text = "\(number)"
    }

    
    // actions
    @IBAction func buttonPressed() {
        print(#line, #function)
        number = UInt8((Int(number) + 1) % 256)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        print(#line, #function, sender.tag)
    }
    
    @IBAction func sliderMoved() {
        print(#line, #function)
        number = UInt8(slider.value)
    }
    
    @IBAction func textFieldEdited() {
        print(#line, #function)
        if textField.text == "" {
            number = 0
            textField.text = "0"
        }
        number = UInt8(textField.text ?? "") ?? 128
    }
    
}

