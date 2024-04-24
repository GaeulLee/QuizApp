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
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let userGotItRight = quizBrain.checkAnswer(sender.currentTitle!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizBrain.getNextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQustionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let answerArr = quizBrain.getQuestionAnswer()
        answer1Button.setTitle(answerArr[0], for: .normal)
        answer2Button.setTitle(answerArr[1], for: .normal)
        answer3Button.setTitle(answerArr[2], for: .normal)
        
        answer1Button.backgroundColor = UIColor.clear
        answer2Button.backgroundColor = UIColor.clear
        answer3Button.backgroundColor = UIColor.clear
    }
    
}

