//
//  ColorsTableViewVC.swift
//  iOSBasicLearning
//
//  Created by Ajay Thakur on 12/03/24.
//

import UIKit

class ColorsTableViewVC: UIViewController {
    var colorsData : [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColorsData()

    }
    
    func addRandomColorsData() {
        for _ in 0..<50 {
            colorsData.append(createRandomColor())
        }
    }
    
    func createRandomColor() -> UIColor {
        let color = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segue = segue.destination as! ColorDetailVC
        segue.color = sender as? UIColor
    }

}

extension ColorsTableViewVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = colorsData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(colorsData[indexPath.row])
        performSegue(withIdentifier: "ToColorsDetailVC", sender: colorsData[indexPath.row])
    }
}
