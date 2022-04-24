//
//  ViewController.swift
//  War-game
//
//  Created by user216463 on 4/17/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var playCard1: UIImageView!
    
    @IBOutlet weak var playCard2: UIImageView!
    
    @IBOutlet weak var score1: UILabel!
    
    @IBOutlet weak var score2: UILabel!
    
    @IBOutlet weak var numOfGames: UILabel!
    
    @IBOutlet weak var topLabel: UILabel!
    
    let totalGames: Int = 15
    var games: Int = 0
    var player1Score: Int = 0
    var player2Score: Int = 0
    
    var timer: Timer?
    
    let cards = [UIImage(named: "ace-of-diamonds"),
                 UIImage(named: "two-of-diamonds"),
                 UIImage(named: "three-of-diamonds"),
                 UIImage(named: "four-of-diamonds"),
                 UIImage(named: "five-of-diamonds"),
                 UIImage(named: "six-of-diamonds"),
                 UIImage(named: "seven-of-diamonds"),
                 UIImage(named: "eight-of-diamonds"),
                 UIImage(named: "nine-of-diamonds"),
                 UIImage(named: "ten-of-diamonds"),
                 UIImage(named: "jack-of-diamonds"),
                 UIImage(named: "queen-of-diamonds"),
                 UIImage(named: "king-of-diamonds")
                ]
    
    let points = [14, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numOfGames.text = "\(games)"
        
    }
    
    @objc func startGame() {
        var rands = [Int](0 ..< cards.count)
        let rand1 = rands.randomElement()
        
        rands.remove(at: rand1!)
        let rand2 = rands.randomElement()

        playCard1.image = cards[rand1!]
        playCard2.image = cards[rand2!]
        games += 1
        topLabel.text = "Round: \(games)"
        if (points[rand1!] > points[rand2!]){
            player1Score += 1
        }
        else{
            player2Score += 1
        }
        
        if(games == totalGames){
            if(player1Score > player2Score){
                topLabel.text = "Player1 Won!"
            }
            else {
                topLabel.text = "Player2 Won!"
            }
            timer?.invalidate()
        }
        
        updateText()
    }
    
    func updateText() {
        numOfGames.text = "\(games)"
        score1.text = "\(player1Score)"
        score2.text = "\(player2Score)"
        
    }
    
    func restart(){
        games = 0
        player1Score = 0
        player2Score = 0
        playCard1.image = UIImage(named: "playing-card")
        playCard2.image = UIImage(named: "playing-card")
        updateText()
    }
    
    @IBAction func playClicked(_ sender: Any) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startGame), userInfo: nil, repeats: true)
        restart()
        startGame()
        
    }
    

}

