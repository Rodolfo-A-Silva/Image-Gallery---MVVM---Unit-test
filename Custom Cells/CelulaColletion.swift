//
//  CelulaColletion.swift
//  Banco de imagens
//
//  Created by Reedy on 25/11/21.
//

import UIKit

class CelulaColletion: UICollectionViewCell {
    
    @IBOutlet weak var imagem: UIImageView!
    
    static let indentifier = "CelulaColletion"
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
