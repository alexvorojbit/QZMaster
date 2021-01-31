//
//  ItemsSection.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 1/14/21.
//

import Foundation

struct ItemDetails: Decodable, Hashable {
    let type: String
    var itemsimages: [ItemsImages]
}


struct ItemsImages: Decodable, Hashable {
    let name: String
    let image: String?
}

