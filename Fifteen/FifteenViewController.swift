//
//  FifteenViewController.swift
//  Fifteen
//
//  Created by Артём Кармазь on 6/20/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import UIKit

class FifteenViewController: UIViewController {
    
    @IBOutlet weak var pole: UICollectionView!
    
    private var numberCell = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", " "]
    private var firstIndexPath: IndexPath?
    private var secondIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Fifteen"
        
        pole.register(FifteenCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        pole.allowsMultipleSelection = true
        
        numberCell.shuffle()
    }
    
    @IBAction func move(_ sender: UIButton) {
        guard let start = firstIndexPath, let end = secondIndexPath else { return }
        
        pole.performBatchUpdates({
            pole.moveItem(at: start, to: end)
            pole.moveItem(at: end, to: start)
            
        }) { (finished) in
            self.pole.deselectItem(at: start, animated: true)
            self.pole.deselectItem(at: end, animated: true)
            self.firstIndexPath = nil
            self.secondIndexPath = nil
            self.numberCell.swapAt(start.item, end.item)
        }
    }
}

extension FifteenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FifteenCollectionViewCell
        cell.number.text = numberCell[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if firstIndexPath == nil {
            firstIndexPath = indexPath
            collectionView.selectItem(at: firstIndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
        } else if secondIndexPath == nil {
            secondIndexPath = indexPath
            collectionView.selectItem(at: secondIndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
        } else {
            collectionView.deselectItem(at: secondIndexPath!, animated: true)
            secondIndexPath = indexPath
            collectionView.selectItem(at: secondIndexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition(rawValue: 0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if indexPath == firstIndexPath {
            firstIndexPath = nil
        } else if indexPath == secondIndexPath {
            secondIndexPath = nil
        }
    }
    
}
