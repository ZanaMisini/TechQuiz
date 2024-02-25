//
//  ScoresController.swift
//  TechQuiz
//
//  Created by Admin on 20.02.24.
//

import UIKit

class ScoresController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var scoresTable: UITableView!
    @IBOutlet weak var bannerView: UITextView!
    var topScores: [UsersScoresModel] = []
    var difficulty: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIService.scoresUI(bannerView: bannerView, scoresTable: scoresTable, view: self, difficulty: difficulty!)
        scoresTable.dataSource = self
        guard let difficulty = difficulty else {
            return
        }
        UsersScoresService.getTopScores(difficulty: difficulty) { [weak self] scores in
            guard let self = self, let scores = scores else {
                return
            }
            self.topScores = scores
            self.scoresTable.reloadData()
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topScores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCellController else {
            return UITableViewCell()
        }
        
        let score = topScores[indexPath.row]
        cell.no.text = "\(indexPath.row + 1)"
        cell.name.text = score.username

        switch difficulty {
        case "easy":
            cell.score.text = "\(score.easy)"
        case "medium":
            cell.score.text = "\(score.medium)" 
        case "hard":
            cell.score.text = "\(score.hard)"
        default:
            break
        }

        cell.backgroundColor = UIColor(red: 62.0/255.0, green: 27.0/255.0, blue: 125.0/255.0, alpha: 1.0)
        cell.no!.textColor = (cell.name.text == userScores?.username) ? UIColor.yellow :
            UIColor.white
        cell.name!.textColor = (cell.name.text == userScores?.username) ? UIColor.yellow : UIColor.white
        cell.score!.textColor = (cell.name.text == userScores?.username) ? UIColor.yellow : UIColor.white

        return cell
    }
}

