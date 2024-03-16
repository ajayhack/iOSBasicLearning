//
//  CardsGameVC.swift
//  iOSBasicLearning
//
//  Created by Ajay Thakur on 14/03/24.
//

import UIKit

class CardsGameVC: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var cards : [UIImage?] = Deck.allValues
    var timer : Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()

        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(shuffleRandomCards), userInfo: nil, repeats: true)
    }
    
    @objc func shuffleRandomCards(){
        cardImage.image = cards.randomElement() ?? UIImage(named: "AH")
    }

    @IBAction func stopButtonPressed(_ sender: Any) {
        timer?.invalidate()
    }
    @IBAction func restartButtonPressed(_ sender: Any) {
        timer?.invalidate()
        startTimer()
    }
    @IBAction func rulesButtonPressed(_ sender: Any) {
    }
}
