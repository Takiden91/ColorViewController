//
//  ViewController.swift
//  ColorViewController
//
//  Created by mac on 24.04.2022.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet var lableFirst: UILabel!
    @IBOutlet var lableSecond: UILabel!
    @IBOutlet var lableThird: UILabel!
    
    @IBOutlet var sliderFirst: UISlider!
    @IBOutlet var sliderSecond: UISlider!
    @IBOutlet var sliderThird: UISlider!
    
    @IBOutlet var textFieldFirst: UITextField!
    @IBOutlet var textFieldSecond: UITextField!
    @IBOutlet var textFieldThird: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 15
        
        sliderFirst.tintColor = .red
        sliderThird.tintColor = .green
        

        setColor()
        setValueForLable()
        setValueForTextField()
        
        
        
    }
    
    @IBAction func rgbSLider(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            lableFirst.text = string(from: sender)
            textFieldFirst.text = string(from: sender)
            
        case 1:
            lableSecond.text = string(from: sender)
            textFieldSecond.text = string(from: sender)
        case 2:
            lableThird.text = string(from: sender)
            textFieldThird.text = string(from: sender)
        default:
            break
        }
        setColor()
        
    }
    
    

    
    private func setColor() {
        mainView.backgroundColor = UIColor(red:
                                            CGFloat(sliderFirst.value),
                                           green:
                                            CGFloat(sliderSecond.value),
                                           blue:
                                            CGFloat(sliderThird.value),
                                           alpha: 1)
    }
    
    private func setValueForLable() {
        lableFirst.text = String(string(from: sliderFirst))
        lableSecond.text = String(string(from: sliderSecond))
        lableThird.text = String(string(from: sliderThird))
    }
    private func setValueForTextField() {
        textFieldFirst.text = String(string(from: sliderFirst))
        textFieldSecond.text = String(string(from: sliderSecond))
        textFieldThird.text = String(string(from: sliderThird))
    }
    // Значение RGB
    private func string(from value: UISlider) -> String {
        return String(format: "%.2f", value.value)
    }
    
    

}

extension ViewController: UITextFieldDelegate {
    
    // Скрываем клаву по нажатию Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // Скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if let currenValue = Float(text) {
            
                switch textField.tag {
                case 0:
                    sliderFirst.value = currenValue
                case 1:
                    sliderSecond.value = currenValue
                case 2:
                    sliderThird.value = currenValue
                default:
                    break
            }
            setColor()
            setValueForLable()
        } else {
        showAlert(title: "Wrong format!", message: "Please enter correct value")
        }
    
    }
    
}

extension ViewController {
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneBotton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapeDone))
        
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        keyboardToolbar.items = [flexBarButton, doneBotton]
    }
    
    @objc private func didTapeDone() {
        view.endEditing(true)
    }
            
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

