//
//  HomeScreenController.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 09/11/2020.
//

import UIKit

class HomeScreenController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    var viewModel = HomeScreenViewModel()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.downloadBets()
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}


// MARK: - Extensions

extension HomeScreenController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
            
        case 1:
            return viewModel.numberOfRowInSection(section: section)
            
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "welcomeCell", for: indexPath) as? WelcomeCell else {
                return UITableViewCell()
            }
            
            let text = viewModel.getWelcomeText()
            cell.configure(welcomeText: text)
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "betCell", for: indexPath) as? SafeBetCell else {
                return UITableViewCell()
            }
            
            let winningBet = viewModel.winningBets[indexPath.row]
            let firstBet = winningBet.bets[0]
            let secondeBet = winningBet.bets[1]
            cell.configure(title1: firstBet.title, title2: secondeBet.title, pronostic1: firstBet.pronostic, pronostic2: secondeBet.pronostic, date: viewModel.titleForLabel(section: indexPath.section))
            
            return cell
            
        default:
            return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        default:
            return " "
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width - 25, height: headerView.frame.height)
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .title3, compatibleWith: .none)
        
        switch section {
        case 0:
            return nil
        case 1:
            label.text = "NOS DERNIERS PRONOS"
            headerView.addSubview(label)
            return headerView
            
        case 2:
            label.text = "NOTRE DERNIÈRE VIDÉO"
            headerView.addSubview(label)
            return headerView
            
        default:
            return nil
            
        }
    }
    
}
