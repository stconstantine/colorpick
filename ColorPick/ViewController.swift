//
//  ViewController.swift
//  ColorPick
//
//  Created by Константин Стародубцев on 04.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateColor()
        updateControls()
    }
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
   
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
    }

    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
        if color == UIColor(red:0,green:0,blue:0,alpha:1) {
            colorLabel.textColor = .white
        } else {
            colorLabel.textColor = .black
        }
        
        colorLabel.text = "R:\(String(format:"%.0f",red*255)), G:\(String(format:"%.0f",green*255)), B:\(String(format:"%.0f",blue*255))"
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
        
    @IBAction func reset(_ sender: AnyObject) {
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        redSwitch.setOn(false, animated: true)
        greenSwitch.setOn(false, animated: true)
        blueSwitch.setOn(false, animated: true)
        updateColor()
        updateControls()
    }
}
