//
//  ViewController.swift
//  RPS
//
//  Created by Andrew Jabbour on 3/29/18.
//  Copyright © 2018 Andrew Jabbour. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateGame(status: .start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var AppLabel: UILabel!
    @IBOutlet weak var StatusLabel: UILabel!
    @IBOutlet weak var RockLabel: UIButton!
    @IBOutlet weak var PaperLabel: UIButton!
    @IBOutlet weak var ScissorsLabel: UIButton!
    @IBOutlet weak var PlayAgainLabel: UIButton!
    
    @IBAction func RockAction(_ sender: Any) {
        play(sign: .rock)
        PaperLabel.isHidden = true
        ScissorsLabel.isHidden = true
    }
    
    @IBAction func PaperAction(_ sender: Any) {
        play(sign: .paper)
        RockLabel.isHidden = true
        ScissorsLabel.isHidden = true
    }
    
    @IBAction func ScissorsAction(_ sender: Any) {
        play(sign: .scissors)
        RockLabel.isHidden = true
        PaperLabel.isHidden = true
    }
    
    @IBAction func PlayAgainAction(_ sender: Any) {
        updateGame(status: .start)
        enableActions()
        showActions()
    }
    
    func updateGame(status: GameState){
        switch status{
        case .start:
            StatusLabel.text = "Rock, Paper, Scissors?"
            view.backgroundColor = UIColor.gray
            PlayAgainLabel.isHidden = true
            AppLabel.text = "🤖"
        case .win:
            StatusLabel.text = "You Win!"
            view.backgroundColor = UIColor.green
            PlayAgainLabel.isHidden = false
        case .lose:
            StatusLabel.text = "You Lose!"
            view.backgroundColor = UIColor.red
            PlayAgainLabel.isHidden = false
        case .draw:
            StatusLabel.text = "Draw!"
            view.backgroundColor = UIColor.yellow
            PlayAgainLabel.isHidden = false
        }
        
    }
    
    func play(sign: Sign) {
        let mySign = sign
        let oppSign = randomSign()
        switch oppSign{
        case .rock:
            AppLabel.text = "👊"
        case .paper:
            AppLabel.text = "✋"
        case .scissors:
            AppLabel.text = "✌️"
        }
        
        let gameState = getGameState(mySign: mySign, oppSign: oppSign)
        
        disableActions()
        
        updateGame(status: gameState)
    }
    
    func disableActions(){
        RockLabel.isEnabled = false
        PaperLabel.isEnabled = false
        ScissorsLabel.isEnabled = false
    }
    
    func enableActions(){
        RockLabel.isEnabled = true
        PaperLabel.isEnabled = true
        ScissorsLabel.isEnabled = true
    }
    
    func showActions(){
        RockLabel.isHidden = false
        PaperLabel.isHidden = false
        ScissorsLabel.isHidden = false
    }
}

