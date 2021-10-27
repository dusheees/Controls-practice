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
    var number = 128 {

        didSet{
            /*
            if number < 0 {
                number = 255
            } else if number > 255 {
                number = 0
            }*/
            
            number = (number + 256) % 256
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rotateSwitches()
        updateUI()
    }
    
    
    // поворот switch на 90 градусов
    func rotateSwitches() {
        for `switch` in switches {
            // у каждого элемента наследованного от UIView есть layer у которого есть transform
            `switch`.layer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
        }
    }
    
    
    /// Update number from the switches set
    func updateNumberFromSwitches() {
        var number = 0
        for `switch` in switches {
            number += `switch`.isOn ? `switch`.tag : 0
        }
        //self.number = UInt8(number % 256)
        self.number = number
    }
    
    
    /// Update switches from the number
    func updateSwitches() {
        for `switch` in switches {
            
            /*
            if Int(number) & `switch`.tag != 0 {
                `switch`.isOn = true
            } else {
                `switch`.isOn = false
            } */
            `switch`.isOn = Int(number) & `switch`.tag != 0 // если биты совпадают
        }
    }
    
    /// Updates all outlets to number
    func updateUI() {
        button.setTitle("\(number)", for: [])
        
        // TODO: set switches to number
        updateSwitches()
        
        slider.value = Float(number)
        textField.text = "\(number)"
    }

    
    // actions
    @IBAction func buttonPressed() {
        print(#line, #function)
        number = number + 1
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        print(#line, #function, sender.tag)
        updateNumberFromSwitches()
    }
    
    @IBAction func sliderMoved() {
        print(#line, #function)
        number = Int(slider.value)
    }
    
    @IBAction func textFieldEdited() {
        print(#line, #function)
        if textField.text == "" {
            number = 0
            textField.text = "0"
        }
        number = Int(textField.text ?? "") ?? 128
    }
    
    
    // TapGestureRecognizer
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if location.x < view.bounds.midX {
            number -= 1
        } else {
            number += 1
        }
        print(#line, #function, sender.location(in: view))
    }
}

