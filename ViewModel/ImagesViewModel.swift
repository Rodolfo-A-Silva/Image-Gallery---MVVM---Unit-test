//
//  ImagesViewModel.swift
//  Banco de imagens
//
//  Created by Reedy on 26/11/21.
//

import Foundation

class ImagesViewModel {
    var imagesViewModel: [ImagemUrl]
    init() {
        self.imagesViewModel = [ImagemUrl]()
    }
}

extension ImagesViewModel {
    func imagesViewModel(at index:Int) -> ImagemUrl   {
        return self.imagesViewModel[index]
    }
}

struct UrlViewModel {
    let url: ImagemUrl
}

extension UrlViewModel{
    var link: String{
        return self.url.link
    }
}
