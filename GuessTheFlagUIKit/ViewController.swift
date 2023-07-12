//
//  ViewController.swift
//  GuessTheFlagUIKit
//
//  Created by Y K on 12.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor


        
        askQuestions(action: nil)
//        countries.append("estonia")
//        countries.append("france")
//        countries.append("germany")
//        countries.append("ireland")
//        countries.append("italy")
//        countries.append("monaco")
//        countries.append("nigeria")
//        countries.append("poland")
//        countries.append("russia")
//        countries.append("spain")
//        countries.append("uk")
//        countries.append("us")
        
        

    }
    
    func askQuestions(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = "Score: \(score)    Flag: \(countries[correctAnswer].uppercased())"  // extra assignment to display it at the navigation bar
        
        questionsAsked += 1
        
        if questionsAsked == 10 {
            showFinalScoreAlert()
        }
    }
    
    func showFinalScoreAlert() { // extra task
        let finalScoreAlert = UIAlertController(title: "Final Score", message: "Your final score is \(score)", preferredStyle: .alert)
        
        finalScoreAlert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { [weak self] _ in self?.restartGame()}))
        
        present(finalScoreAlert, animated: true)
    }
    
    func restartGame() { // extra task
        questionsAsked = 0
        score = 0
        askQuestions(action: nil)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        var message: String // extra task
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Good Job!"
        } else {
            title = "Wrong"
            score -= 1
            let correctFlag = countries[correctAnswer].capitalized
            message = "That`s the flag of \(correctFlag)"
        }
        let ac = UIAlertController(title: title, message: "\(message) Your score is \(score)", preferredStyle: .alert)
        //added message
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
        
        present(ac, animated: true)
     }
  
}

