//
//  ViewController.swift
//  IMC
//
//  Created by Gilson Santos on 01/11/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var viResult: UIView!
    var imc:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func Calculate(_ sender: Any) {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
       
        if  let height = formatter.number(from: tfHeight.text!),let weight = Double(tfWeight.text!){
            imc = weight/(height.doubleValue*height.doubleValue)
            view.endEditing(true)
            showResults()
        }
    }
    
    func showResults(){
        var result:String = ""
        var image:String = ""
        switch imc {
        case 0..<16:
            result = "Magreza"
            image = "abaixo"
            
        case 16..<18.5:
            result = "abaixo do peso"
            image = "abaixo"
            
        case 18.5..<25:
            result = "peso ideal"
            image = "ideal"
            
        case 16..<18.5:
            result = "peso ideal"
            image = "ideal"
        default:
            result = "Obesidade"
            image = "obesidade"
            
        }
        lbResult.text =  "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
    }
    
}

