//
//  ImagensModel.swift
//  Banco de imagens
//
//  Created by Reedy on 26/11/21.
//

import Foundation

struct ImagensModel: Codable {
    var data = [ImagemUrl]()
}

struct ImagemUrl: Codable {
    let link: String
}

extension ImagensModel {
    // Resgatar Api Json com forma de OBJ
    static var Get:  Resource<ImagensModel> = {
        guard let url = URL(string: "https://api.imgur.com/3/album/Cfy6A/images") else{
            fatalError("URL is incorrect!")
        }
        return Resource<ImagensModel>(url: url)
    }()
}








