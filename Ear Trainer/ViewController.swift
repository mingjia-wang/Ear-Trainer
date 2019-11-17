//
//  ViewController.swift
//  Ear Trainer
//
//  Created by Mingjia Wang on 9/8/19.
//  Copyright © 2019 Mingjia Wang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    var allNotes = NoteBank()
    var currentQuestion = 0
    var answerBank = ["C", "D", "E", "F", "G", "A", "B"]
    var points = 0
    
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var progressBar: UIImageView!
    @IBOutlet weak var questionHeader: UILabel!
    @IBOutlet weak var playNoteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playNoteButton.layer.cornerRadius = 5
        
        allNotes.list.shuffle()
        nextQuestion()
    }

    @IBAction func playNote(_ sender: UIButton) {
        
        guard let url = Bundle.main.url(forResource: allNotes.list[currentQuestion-1].noteName, withExtension: "aiff") else { return } 
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)       
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    
    @IBAction func answer(_ sender: UIButton) {
    
        let ans = sender.tag
        let result = checkAnswer(ans)
        if result {
            ProgressHUD.showSuccess("Correct!")
            points += 1
            
        } else {
            ProgressHUD.showError("Incorrect!")
            
        }
        nextQuestion()
    }
    
    func updateUI() {
        if currentQuestion != 8 {
            questionHeader.text = "Question #\(currentQuestion):"
        } else {
            questionHeader.text = "Question #7:"
        }
        questionNumber.text = "\(currentQuestion-1) / 7"
        progressBar.frame.size.width = (view.frame.size.width / 7) * CGFloat(currentQuestion-1)
        score.text = "Score: \(points)"
    }
    
    func checkAnswer(_ a: Int) -> Bool {
        
        return allNotes.list[currentQuestion-1].noteName == answerBank[a-1]
    }
    
    func nextQuestion() {
        
        if currentQuestion < 7 {
            currentQuestion += 1
            
        } else {
            currentQuestion += 1
            let alert = UIAlertController(title: "Great job!", message: "You've reached the end of the training session, would you like to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in
                self.newGame()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        updateUI()
    }
    
    func newGame() {
        
        points = 0
        currentQuestion = 0
        allNotes.list.shuffle()
        
        nextQuestion()
    }
}

