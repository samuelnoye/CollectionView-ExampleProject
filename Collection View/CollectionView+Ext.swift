//
//  CollectionView+Ext.swift
//  Collection View
//
//  Created by devadmin on 19/05/2022.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func updateFLow(_ itemSpacing: CGFloat = 5, _ lineSpacing: CGFloat = 5, _ ishorizontal: Bool) {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flow.minimumInteritemSpacing = itemSpacing
        flow.minimumLineSpacing = lineSpacing
        flow.scrollDirection = ishorizontal ? .horizontal : .vertical
        
        // Apply flow layout
        self.setCollectionViewLayout(flow, animated: true)
    }
    
    func isScrollEnable(isEnable: Bool) {
        self.isScrollEnabled = isEnable
    }
    
    func clearBackground() {
        self.backgroundColor = .clear
        self.backgroundView = UIView(frame: .zero)
    }
}


extension UIImageView {
    func setImage(_ image: UIImage?, animated: Bool = true) {
        let duration = animated ? 0.3 : 0.0
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.image = image
        }, completion: nil)
    }
    
    func ofColor(_ color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}

extension UIView {
    
    func updateBorder(color: UIColor? = .clear) {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = 1
    }
    
    func updateBorder(color: UIColor? = .clear, border: CGFloat = 1) {
        self.layer.borderColor = color?.cgColor
        self.layer.borderWidth = border
    }
    
    func round() {
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
    
    func round(_ round: CGFloat) {
        self.layer.cornerRadius = round
        self.layer.masksToBounds = true
    }
}
