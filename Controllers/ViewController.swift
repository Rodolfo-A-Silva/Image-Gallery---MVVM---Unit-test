//
//  ViewController.swift
//  Banco de imagens
//
//  Created by Reedy on 25/11/21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,
                        UICollectionViewDelegateFlowLayout {
    
    var listaImagens = ImagesViewModel()
  
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setup()
   
}

    func setup(){
        APIService().load(resource: ImagensModel.Get) { [weak self] result in
              switch result {
              case .success(let orders):
                  self?.listaImagens.imagesViewModel = orders.data
               self?.collectionView.reloadData()
           case .failure(let error):
               print("Error ", error)
           }
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.listaImagens.imagesViewModel.count
   }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CelulaColletion.indentifier, for: indexPath as IndexPath) as! CelulaColletion
        let vm = self.listaImagens.imagesViewModel(at: indexPath.row)
        if let url = NSURL(string: vm.link){
            cell.imagem.sd_setImage(with: url as URL)
        }
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (view.frame.size.width/3)-3,
            height: (view.frame.size.width/3)-3
    )
   }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected section \(indexPath.section) and row \(indexPath.row)")
    }

}
    
 
