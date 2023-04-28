//
//  ViewController.swift
//  MovieCollection
//
//  Created by user235836 on 4/28/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet var genreTextField: UITextField!
    @IBOutlet var limitTextField: UITextField!
    @IBOutlet var startYearField: UITextField!
    @IBOutlet var endYearField: UITextField!
    
    
    
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        genreTextField.delegate = self
        limitTextField.delegate = self
        startYearField.delegate = self
        endYearField.delegate = self
        startYearPicker()
        endYearPicker()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movievc = segue.destination as! MovieViewController
        movievc.limit = limitTextField.text!
        movievc.endYear = endYearField.text!
        movievc.startYear = startYearField.text!
        movievc.genre = genreTextField.text!
    }
    
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func startYearPicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = .now
        datePicker.datePickerMode = .date
        startYearField.inputView = datePicker
        startYearField.inputAccessoryView = createToolbar()

    }
    
    func endYearPicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = .now
        datePicker.datePickerMode = .date
        endYearField.inputView = datePicker
        endYearField.inputAccessoryView = createToolbar()

    }
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"

        if startYearField.text == ""{
            startYearField.text = dateFormatter.string(from: datePicker.date)
        }else{
            endYearField.text = dateFormatter.string(from: datePicker.date)
        }
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        genreTextField.endEditing(true)
        limitTextField.endEditing(true)
        startYearField.endEditing(true)
        endYearField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{
            textField.placeholder = "This Field is Required"
            return false
        }
    }
}

