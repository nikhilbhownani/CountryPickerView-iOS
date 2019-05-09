//
//  ViewController.swift
//  CountryPickerView
//
//  Created by Nikhil Bhownani on 23/03/19.
//  Copyright © 2019 Nikhil Bhownani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: CountryPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerView.setupView(nibName: "CountryPickerImageNameCell")
//        pickerView.showCountries(codes: ["DK", "SE", "NO", "DE","US"])
        pickerView.showAllCountries()
        pickerView.isModal = true
        pickerView.onDidSelect = { [weak self](country) in
            print(country)
            UIView.animate(withDuration: 0.2, animations: {
                self?.pickerView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }, completion: { (competion) in
                self?.pickerView.isHidden = true
                self?.pickerView.transform = CGAffineTransform.identity
            })
            
        }
    }

    @IBAction func button(_ sender: Any) {
        showPickerView()
    }
    
    func showPickerView() {
        pickerView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        pickerView.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            self.pickerView.transform = CGAffineTransform.identity
        }) { (completed) in
            
        }
    }
    
}

