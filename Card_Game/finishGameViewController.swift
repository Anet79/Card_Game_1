//
//  finishGameViewController.swift
//  Card_Game
//
//  Created by Student32 on 26/07/2023.
//

import UIKit

class finishGameViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var name: UILabel!
    var nameP: String?
    var scoreP: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if nameP != nil{
              if nameP == "no"{
                  name.text = "nil"
                  score.isHidden = true
              } else{
                  name.text = nameP
                  if let Score = scoreP {
                      score.text = String(format: "%d", Score )}
              }
          }
      }

 
    

    @IBAction func Back(_ sender: Any) {
        let nextScreen = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        nextScreen.modalPresentationStyle = .fullScreen
            present( nextScreen, animated: true , completion: nil)
    }
    
}
