//
//  ViewController.swift
//  Scrabble Cheater
//
//  Created by Phil Lafrance on 2018-01-28.
//  Copyright © 2018 Phil Lafrance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Textfield variables for the letters in hand of the user
    @IBOutlet weak var letter1: UITextField!
    @IBOutlet weak var letter2: UITextField!
    @IBOutlet weak var letter3: UITextField!
    @IBOutlet weak var letter4: UITextField!
    @IBOutlet weak var letter5: UITextField!
    @IBOutlet weak var letter6: UITextField!
    @IBOutlet weak var letter7: UITextField!
    
    //"Find the Words!" button variable
    @IBOutlet weak var findWordsButton: UIButton!
    
    //"Add board letters (+)" button variable
    @IBOutlet weak var addBoardLettersButton: UIButton!
    
    @IBOutlet weak var isTextEmpty: UILabel!
    
    var letterFields: [UITextField]!
    
    
    
    //Verify if the letter entered is valid, returns true if it is.
    func charIsAllowed(char: Character) -> Bool
    {
        if     char != "A"
            && char != "B"
            && char != "C"
            && char != "D"
            && char != "E"
            && char != "F"
            && char != "G"
            && char != "H"
            && char != "I"
            && char != "J"
            && char != "K"
            && char != "L"
            && char != "M"
            && char != "N"
            && char != "O"
            && char != "P"
            && char != "Q"
            && char != "R"
            && char != "S"
            && char != "T"
            && char != "U"
            && char != "V"
            && char != "W"
            && char != "X"
            && char != "Y"
            && char != "Z"
            && char != "*"
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    //Initialise the variables for the app
    override func viewDidLoad() {
        letterFields =
            [letter1,
             letter2,
             letter3,
             letter4,
             letter5,
             letter6,
             letter7]
        
        //Round the "Find the Words!" and "addBoardLetters" button
        findWordsButton.layer.cornerRadius = 5
        addBoardLettersButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //The user enters a letter
    @IBAction func letterChanged(_ sender: UITextField) {
        let letterField: UITextField = sender
        let letterFieldChars: Int = letterField.text!.count
        let letters: String = letterField.text ?? ""

        // nice work in progress, and documentation of course!

        //Verify if we need to replace a letter for another one
        if letterFieldChars > 1
        {
            if charIsAllowed(char: letters.last!)
            {
                letterField.text = String(describing: letters.last!)
            }
            else
            {
                letterField.text = String(describing: letters.first!)
            }
        }
        
        //Verify if the letter entered is valid, else we replace it by null
        if letterFieldChars > 0
        {
            if !charIsAllowed(char: letters.last!)
            {
                letterField.text = ""
            }
            else
            {
                //The letter is valid, we change the selected textfield to the next one on the right
                for currentLetter in 0...6
                {
                    if letterFields[currentLetter] == letterField && currentLetter < 6
                    {
                        letterFields[currentLetter + 1].becomeFirstResponder()
                    }
                    //If we are on the last textfield, no textfield is selected
                    else if letterField == letterFields[6]
                    {
                        letterFields[6].resignFirstResponder()
                    }
                }
            }
        }
    }
    
    //The user press on the button "Find the Words!"
    @IBAction func findWords(_ sender: Any) {
        var fieldIsEmpty: Bool = false
        
        //Verify if one of the textfield is empty
        for textfield in letterFields
        {
            if textfield.text == ""
            {
                fieldIsEmpty = true
                isTextEmpty.text = "Il y a au moins un textfield sans lettre!"
            }
        }
        
        if !fieldIsEmpty
        {
            isTextEmpty.text = "Tous les textfields ont une lettre!"
        }
        
        //Verify if we have access to the file dictionnaire.txt
        if let path = Bundle.main.path(forResource: "dictionnaire", ofType: "txt") {
            //We have access to the file!
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                
                //We do a loop through each words of the dictionnary
                for currentWord in myStrings
                {
                    var lettersInWord: [Character] = []
                    //We transform the word selected in a array of char
                    for character in currentWord
                    {
                        lettersInWord += [character]
                    }
                    
                }
            //We do not have access to the file...
            } catch {
                print(error)
            }
        }
    }
    
    
    //This is a change to test github
    
    
}
