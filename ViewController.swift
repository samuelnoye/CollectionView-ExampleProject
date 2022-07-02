//
//  ViewController.swift
//  Collection View
//
//  Created by devadmin on 19/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    var selectedIndexes = [Int]()
    var options = [RideOption]()
    
    // MARK: - Constant
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Configure Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clearBackground()
        collectionView.updateFLow(10, 10, false)
        addDummyData()
    }
    
    // MARK: - IBActions
    @IBAction func btnPrintTapped(_ sender: UIButton) {
        if selectedIndexes.count == 3 {
            for options in selectedIndexes.enumerated() {
                print("Option \(options.offset + 1): \(self.options[options.element].title)")
            }
        } else {
            print("Please select all three value to continue")
        }
    }
    
    // MARK: - Custom Functions
    func addDummyData() {
        options.append(RideOption(title: "Speed meter", image: "promotions"))
        options.append(RideOption(title: "Tunnel", image: "promotions"))
        options.append(RideOption(title: "Curves", image: "promotions"))
        options.append(RideOption(title: "Forest", image: "promotions"))
        options.append(RideOption(title: "Rivers", image: "promotions"))
        options.append(RideOption(title: "Speed 1", image: "promotions"))
        options.append(RideOption(title: "Tunnel 1", image: "promotions"))
        options.append(RideOption(title: "Curves 1", image: "promotions"))
        options.append(RideOption(title: "Forest 1", image: "promotions"))
        options.append(RideOption(title: "Rivers 1", image: "promotions"))
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Register Cell
        collectionView.register(UINib(nibName: RideOptionsCell.identifier, bundle: nil), forCellWithReuseIdentifier: RideOptionsCell.identifier)
        
        // Cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RideOptionsCell.identifier, for: indexPath) as? RideOptionsCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(options[indexPath.row], selectedIndexes.contains(indexPath.row))
        
        // Return Cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4 - 10, height: 105)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if selectedIndexes.contains(indexPath.row) {
            if let index = selectedIndexes.firstIndex(of: indexPath.row) {
                selectedIndexes.remove(at: index)
            }
        } else {
            if selectedIndexes.count < 3 {
                selectedIndexes.append(indexPath.row)
            } else {
                print("Show user that we can only allow to select 3 options")
            }
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


