//
//  ViewController.swift
//  JSONTraineeApp
//
//  Created by Кирилл Шалеников on 02.09.2023.
//

import UIKit

enum UserAction: String, CaseIterable {
    case characters = "Characters"
//    case episodes = "Episodes"
    case locations = "Locations"
}

class NavigationViewController: UICollectionViewController {

    let userActions = UserAction.allCases
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "JSONButton",
                for: indexPath) as? UserActionCell else {
            return UICollectionViewCell()
        }
        
        cell.userActionCell.text = userActions[indexPath.item].rawValue
        return cell
    }
    
    override func viewDidLoad() {
        
    }
    
    
    // MARK: UICollectionViewCellDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .characters:
            performSegue(withIdentifier: "showCharacters", sender: nil)
//        case .episodes:
//            performSegue(withIdentifier: "showCharactecrs", sender: nil)
        case .locations:
            performSegue(withIdentifier: "showLocations", sender: nil)
        }
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacters" {
            guard let charactersVC = segue.destination as? CharactersTableViewController else { return }
        } else if segue.identifier == "showLocations" {
            guard let locationsVC = segue.destination as? LocationsTableViewController else { return }
        } else {
            return
        }
    }
}

// MARK: UICollectionViewDelegateFromLayout
extension NavigationViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: UIScreen.main.bounds.width - 50, height: 100)
    }
    
    
    // MARK: Navigation
    
    
}


// MARK: Networking
//extension NavigationViewController {
//    private func getPerson() {
//        NetworkManager.shared.getPerson(from: Link.rick.rawValue) { [weak self] result in
//            switch result {
//            case .success(let imageData):
//                self?.succesAlert
//            }
//        }
//    }
//
//    private func morty() {
//
//    }
//}

