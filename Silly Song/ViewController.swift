//
//  ViewController.swift
//  Silly Song
//
//  Created by Zachary Pratt on 3/10/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(sender: AnyObject) {
        
        lyricsView.text = lyricsForName(bananaFanaTemplate, fullName: nameField.text!)
        
    }
    
    
}

func shortNameFromFullName(fullName: String) -> String {
    
    let vowels = NSCharacterSet(charactersInString: "aeiouöy")
    
    if let firstVowelIndex = fullName.lowercaseString.rangeOfCharacterFromSet(vowels) {
        
        return fullName.lowercaseString.substringFromIndex(firstVowelIndex.startIndex)
    }
    
    return fullName.lowercaseString
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromFullName(fullName)
    
    let lyrics = lyricsTemplate
        
        .stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)
        .stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
    
    return lyrics
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}