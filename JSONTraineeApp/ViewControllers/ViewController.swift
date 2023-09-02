//
//  ViewController.swift
//  JSONTraineeApp
//
//  Created by Кирилл Шалеников on 02.09.2023.
//

import UIKit

enum UserAction: String, CaseIterable {
    case rickAndMorty = "Rick & Morty"
}

enum Link: String {
    case rickAndMorty = "https://rickandmortyapi.com/api/character/108"
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
        
        switch userAction {
        case .rickAndMorty: rickAndMorty()
        }
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
    private func rickAndMorty() {
        guard let url = URL(string: Link.rickAndMorty.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error discription")
                return
            }
            
            do {
                let person = try JSONDecoder().decode(Person.self, from: data)
                
                
            }
            
            
            
        }
    }
    
    private func calendar() {
        
    }
}

