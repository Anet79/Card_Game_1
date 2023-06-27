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
    var totalGamesRound=0
    var oneGameCount=3
    var flipTimer: Timer?
    
    @IBOutlet weak var rImageView: UIImageView!
    @IBOutlet weak var lImageView: UIImageView!
    
    
    @IBOutlet weak var leftName: UILabel!
    
    @IBOutlet weak var countLeft: UILabel!
    
    @IBOutlet weak var showLeft: UILabel!
    
    @IBOutlet weak var showRight: UILabel!
    @IBOutlet weak var countRight: UILabel!
    
 
    @IBOutlet weak var clockTime: UILabel!
    
    @IBOutlet weak var rightName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // super.view.backgroundColor=UIColor(patternImage:UIImage(named:"background_for_main")!)
       
//        lImageView.layer.borderColor=UIColor.black.cgColor
//        lImageView.layer.borderWidth=2.0
//        rImageView.layer.borderColor=UIColor.black.cgColor
//        rImageView.layer.borderWidth=2.0
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
        rImageView.image=UIImage(named: "back_photo_2")
        lImageView.image=UIImage(named: "back_photo_2")
        countRight.text="0"
        countLeft.text="0"
        
    }
    
    

    func startGame(){
        self.totalGamesRound+=1
        
        Timer.scheduledTimer(withTimeInterval: 1.0,repeats: true){timer in
            
            self.timeCount-=1
            if(self.timeCount==0){
                timer.invalidate()
                self.gamePlay()
              
            }
            
            
            
        }

    }
    
    func gamePlay(){
        
        let myArray = [UIImage(named: "card_1"), UIImage(named: "card_2"), UIImage(named: "card_3"), UIImage(named: "card_4")]
   
           
                //random photo from cards shapes
                let leftPhoto=Int.random(in:0..<myArray.count)
                let rightPhoto=Int.random(in: 0..<myArray.count)
            
                //random number for strenght of cards
                let leftcount=Int.random(in:0..<10)
                let rightcount=Int.random(in: 0..<10)
                
                self.showLeft.text=leftcount.formatted()
                self.showRight.text=rightcount.formatted()
                
                self.rImageView.image=myArray[rightPhoto]
                self.lImageView.image=myArray[leftPhoto]
        
             if(leftcount>rightcount){
                 self.leftScore+=1
                 self.countLeft.text="\(self.leftScore)"
             }
             if(leftcount<rightcount){
                 self.rightScore+=1
                 self.countRight.text="\(self.rightScore)"
             }
        
        Timer.scheduledTimer(withTimeInterval:1.0,repeats: true){timer in
            self.clockTime.text="\(self.oneGameCount)"
            
    
        if(self.oneGameCount==0){
            timer.invalidate()
            self.rImageView.image=UIImage(named: "back_photo_2")
            self.lImageView.image=UIImage(named: "back_photo_2")
            self.timeCount=5
            self.oneGameCount=3
           
            self.clockTime.text="3"
            self.showLeft.text=""
            self.showRight.text=""
            
            self.startGame()
        }
           
            self.oneGameCount-=1
            }
           
           
        

        
        
        
        
        
    }

}
