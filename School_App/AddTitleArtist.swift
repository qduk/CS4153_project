//
//  AddTitleArtist.swift
//  School_App
//
//  Created by Adam B on 4/19/20.
//  Copyright © 2020 Adam B. All rights reserved.
//

import UIKit

class AddTitleArtist: UIViewController {
    
    var songTitle = ""
    var songArtist = ""

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var artistField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! AddChordsViewController
        
        nextView.songTitle = titleField.text ?? "No Title"
        nextView.songArtist = artistField.text ?? "No Artist"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
