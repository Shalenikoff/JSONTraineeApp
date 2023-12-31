//
//  ViewController.swift
//  JSONTraineeApp
//
//  Created by Кирилл Шалеников on 02.09.2023.
//

import UIKit

enum UserAction: String, CaseIterable {
    case rick = "Rick"
    case morty = "Morty"
    case summerSmith = "Summer Smith"
    case aaa = "aaa"
    
}

class MainViewController: UICollectionViewController {

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
    
    // MARK: UICollectionViewCellDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
//        switch userAction {
//        case .rick: getPerson(with: )
//        case .morty: morty()
//        case .summerSmith:
//            <#code#>
//        case .aaa:
//            <#code#>
//        }
    }
}

// MARK: UICollectionViewDelegateFromLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: UIScreen.main.bounds.width - 50, height: 100)
    }
}

// MARK: Networking
extension MainViewController {
    private func getPerson() {
        NetworkManager.shared.getPerson(from: Link.rick.rawValue) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.
            }
        }
    }
    
    private func morty() {
        
    }
}

