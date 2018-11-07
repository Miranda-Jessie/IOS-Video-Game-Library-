//
//  addGameViewController.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 10/30/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import UIKit

class addGameViewController: UIViewController {

    
    //MARK IBOutlets
    // Connects buttons to the objects on the front end of the View Controller
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textViewField: UITextView!
    @IBOutlet weak var ratingSegmentControl: UISegmentedControl!
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    //Functions that you need to have
    override func viewDidLoad() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        super.viewDidLoad()
        
        ratingSegmentControl.removeAllSegments()
        
        for (index, segment) in segments.enumerated() {
            ratingSegmentControl.insertSegment(withTitle: segment.title, at: index, animated: false)
        }
        
        genrePickerView.dataSource = self
        genrePickerView.delegate = self
        
        
        // Do any additional setup after loading the view.
        
    }
    
    //AddGameButton Function:
    //MARK IBAction
    @IBAction func addGameTapped(_ sender: Any) { //Thsi will occur if the Add Game button is tapped
        trySavingGame()
        
       guard //Makes sure the variables has values
        
        let title = titleTextField.text, !title.isEmpty,
        let description = textViewField.text, !description.isEmpty
        
        else {
            //This will pop up an error message that make sure you have everything filled in
            let errorAlert = UIAlertController(title: "Hold Up", message: "Make sure you have all the boxes filled in.", preferredStyle: UIAlertController.Style.alert)
            //Allows you to dismiss the alert
            let dismissAction = UIAlertAction(title: "Okie Dokie", style: UIAlertAction.Style.default, handler: {UIAlertAction in })
            errorAlert.addAction(dismissAction)
            self.present(errorAlert, animated: true, completion: nil) //This makes for a cleaner transition when the error pops up
            return
        }
    }
    
    
    let segments: [(title: String, rating: Game.Rating)] =
        [("K", .kids),
         ("E", .everyone),
         ("T", .teen),
         ("M", .mature),
         ("AO", .adultsOnly)]
    
    let genreArray = ["Action", "Adventure", "RPG", "Horror"]
    
    let genres: [(title: String, genre: Game.Genre)] =
        [("Action", .action),
         ("Adventure", .adventure),
         ("RPG", .RPG),
         ("Horror", .horror)]

    func trySavingGame() {
        
        // title
        guard let title = titleTextField.text else { return }
        
        // details
        guard let details = textViewField.text else { return }
        
        // rating
        let rating = segments[ratingSegmentControl.selectedSegmentIndex].rating
        
        let genre = genreArray[genrePickerView.selectedRow(inComponent: 0)]
        // genre
    }
}

extension addGameViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].title
    }
}
