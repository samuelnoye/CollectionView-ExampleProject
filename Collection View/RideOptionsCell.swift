//
//  RideOptionsCell.swift
//  Collection View
//
//  Created by devadmin on 19/05/2022.
//

import UIKit

struct RideOption {
    var title: String
    var image: String
}

class RideOptionsCell: UICollectionViewCell {

    // MARK: - Identifier
    static let identifier = "RideOptionsCell"
     
    // MARK: - IBOutlets
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
    @IBOutlet weak var cellbgView: UIView!
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        cellImg.ofColor(.green)
        cellbgView.backgroundColor = .black
        cellbgView.updateBorder(color: .green)
        cellbgView.round()
    }

    
    // MARK: - Custom Function
    func selectedState() {
        cellImg.ofColor(.black)
        cellbgView.backgroundColor = .green
    }
    
    func unselectedState() {
        cellImg.ofColor(.red)
        cellbgView.backgroundColor = .black
    }
    
    func configureCell(_ option: RideOption, _ isSelected: Bool) {
        cellImg.image = UIImage(named: option.image)
        cellLbl.text = option.title
        if isSelected {
            selectedState()
        } else {
            unselectedState()
        }
    }
}
