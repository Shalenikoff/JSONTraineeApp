//
//  ViewController.swift
//  JSONTraineeApp
//
//  Created by Кирилл Шалеников on 02.09.2023.
//

import UIKit

class MainViewController: UICollectionViewController {

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "JSONButton",
                for: indexPath) as? UserActionCell else {
            return UICollectionViewCell()
        }
        
        return cell
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
        
    }
    
    private func calendar() {
        
    }
}

