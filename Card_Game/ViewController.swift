//
//  ViewController.swift
//  Card_Game
//
//  Created by Student32 on 25/06/2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    var playerName:String?
    
    var isRight: Bool?
    
    
    var locationManager: CLLocationManager!
    @IBOutlet weak var insertName: UIButton!
    
    @IBOutlet weak var rightArrow: UIImageView!
    @IBOutlet weak var rightPhoto: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var labelName: UILabel!
  
    
    @IBOutlet weak var leftArrow: UIImageView!
    @IBOutlet weak var leftPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager=CLLocationManager()
        getCurrentLoacation()
        playerName=UserDefaults.standard.string(forKey: "PlayerName")
        updateUI()
        
      
    }
    
    func getCurrentLoacation(){
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.last else { return }

     

        // Stop updating the location to conserve battery

        locationManager.stopUpdatingLocation()

     

        let latitude = location.coordinate.latitude

        let playerSide = latitude > 34.817549168324334 ? "East" : "West"
        
        if( latitude > 34.817549168324334 ){
            isRight=true
            leftArrow.isHidden=true
            leftPhoto.isHidden=true
            rightArrow.isHidden=false
            rightPhoto.isHidden=false
            
            
        }else{
            isRight=false
            leftArrow.isHidden=false
            leftPhoto.isHidden=false
            rightArrow.isHidden=true
            rightPhoto.isHidden=true
            
        }

     

        DispatchQueue.main.async {

            // Update the UI on the main thread

            // Display the start button and player's location side

            self.startButton.isHidden = false

            self.locationLabel.text = " \(playerSide)"

        }

    }
    
    
    
    
    
    func updateUI(){
        if let name=playerName{
            labelName.text="Hi, \(name)!"
            insertName.isHidden=true
            
        }
        else{
          
            insertName.isHidden=false
        }
        
    }
    
    
    @IBAction func StartButtonTapped(_ sender: UIButton) {
        
        let gameScreen = storyboard?.instantiateViewController(identifier: "GameView") as! GameViewController

                            gameScreen.modalPresentationStyle = .fullScreen

                            gameScreen.isRight = self.isRight

                            present( gameScreen, animated: true , completion: nil)
    }
    
    @IBAction func insetNameTapped(_ sender: UIButton) {
        // Present an alert or a custom input view to collect the player's name

          let alert = UIAlertController(title: "Insert Your Name", message: nil, preferredStyle: .alert)

          alert.addTextField { textField in

              textField.placeholder = "Player Name"

          }

          let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in

              guard let name = alert.textFields?.first?.text else { return }

              self?.playerName = name

              // Save the player's name to storage

              UserDefaults.standard.set(name, forKey: "PlayerName")

              self?.updateUI()

          }

          alert.addAction(saveAction)

          present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
}

