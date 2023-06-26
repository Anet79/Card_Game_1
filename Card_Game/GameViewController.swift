//
//  GameViewController.swift
//  Card_Game
//
//  Created by Student32 on 25/06/2023.
//

import UIKit

class GameViewController: UIViewController {
    
    var isRight: Bool?
    var playerName:String?
    var rightScore:Int=0
    var leftScore:Int=0
    var cardImages:[UIImage]=[]
    var cardViewTimer: Timer?
    var timeCount=5
    var flipTimer: Timer?
    
    @IBOutlet weak var rImageView: UIImageView!
    @IBOutlet weak var lImageView: UIImageView!
    
    
    @IBOutlet weak var leftName: UILabel!
    
    @IBOutlet weak var countLeft: UILabel!
    
 
    @IBOutlet weak var countRight: UILabel!
    
 
    
    @IBOutlet weak var rightName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSides()
        startGame()
     
        

    }
    func initSides(){
        if(isRight==true){
            rightName.text=playerName
            leftName.text="PC"
            
        }
        else{
            leftName.text=playerName
            rightName.text="PC"
        }
        
    }
    
    

    func startGame(){
        
        Timer.scheduledTimer(withTimeInterval: 1.0,repeats: true){timer in
            self.timeCount-=1
            
        }
        cardViewTimer=Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(gamePlay), userInfo: nil, repeats: true)
        
    }
    
    @objc func gamePlay(){
        let myArray = [UIImage(named: "card_photo_1"), UIImage(named: "card_photo_2"), UIImage(named: "card_photo_3"), UIImage(named: "card_photo_4")]
        
        for i in 0..<myArray.count {
            print("Process start \(i)")
            
            let leftPhoto=Int.random(in:0..<myArray.count)
            let rightPhoto=Int.random(in: 0..<myArray.count)
            
            
            self.rImageView.image=myArray[rightPhoto]
            self.lImageView.image=myArray[leftPhoto]
          
           // sleep(5)
            print("Process End \(i)")
        }
        
        
        
        
    }

}
