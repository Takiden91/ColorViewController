//
//  MainViewController.swift
//  ColorViewController
//
//  Created by mac on 05.05.2022.
//

import UIKit

class MainViewController: UIViewController {
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ViewController
        colorVC.colorFromMainVC = view.backgroundColor
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let colorVC = segue.source as! ViewController
        colorVC.deligate = self
        colorVC.setColor()
    }
    

    
    
    
    
}

extension MainViewController: ColorDelegate {
    func setColorMainVC(_ color: UIColor) {
        view.backgroundColor = color
    }
}
