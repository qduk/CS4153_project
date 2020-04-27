//
//  AddChordsViewController.swift
//  School_App
//
//  Created by Adam B on 4/19/20.
//  Copyright © 2020 Adam B. All rights reserved.
//

import UIKit

class AddChordsChorusViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == chordKind {
            return kindPickerData.count
        } else if currentTextField == chordTone {
            return tonePickerData.count
        } else {
            return 0
        }
    }
     
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == chordKind {
            return kindPickerData[row]
        } else if currentTextField == chordTone {
            return tonePickerData[row]
        } else {
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == chordKind {
            chordKind.text = kindPickerData[row]
        } else if currentTextField == chordTone {
            chordTone.text = tonePickerData[row]
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTextField = textField
        if currentTextField == chordKind {
            currentTextField.inputView = pickerView
        } else if currentTextField == chordTone{
            currentTextField.inputView = pickerView
        }
    }

    var currentTextField = UITextField()
    let pickerView = UIPickerView()
    var kindPickerData:[String] = []
    var tonePickerData:[String] = []
    

    var songTitle = ""
    var songArtist = ""
    var verseChords:[String] = []
    var chorusChords:[String] = []
    
   
    @IBOutlet weak var chordTone: UITextField!
    @IBOutlet weak var chordKind: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        chordKind.delegate = self
        chordTone.delegate = self

        
        kindPickerData = ["Major", "Minor", "Dominant", "Half-Diminished"]
        tonePickerData = ["A", "A-Sharp", "A-Flat", "B", "B-Flat",
                        "C", "C-Sharp", "D", "D-Sharp", "D-Flat", "E",
                        "E-Flat", "F", "F-Sharp", "G", "G-Sharp", "G-Flat"]
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    @IBAction func addChord(_ sender: Any) {
        chorusChords.append(chordTone.text! + " " + chordKind.text!)
        print(chorusChords)
        print(verseChords)
        print(songTitle)
        print(songArtist)    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
