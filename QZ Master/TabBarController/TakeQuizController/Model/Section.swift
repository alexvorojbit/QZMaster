//
//  Section.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 5/31/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import Foundation

struct Section: Decodable, Hashable {
    let type: String
    let items: [SectionItems]
}

struct SectionItems: Decodable, Hashable {
    let sectionName: String?
    let sectionImage: String?
    let id: String?
    let quizName: String?
    let quizImage: String?
}

//struct Quizes: Decodable, Hashable {
//    let id: String
//    let name: String
//    let image: String?
//}
