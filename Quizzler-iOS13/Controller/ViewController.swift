//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        UpdateUI()
        super.viewDidLoad()
      
    }
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
      let userGotItRight =  quizBrain.checkanswer(userAnswer)
        
        if(userGotItRight){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }

        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(UpdateUI), userInfo: nil, repeats: false)
           
           
        
        
    }
    
    @objc func UpdateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()

        
        
    }
    

}

