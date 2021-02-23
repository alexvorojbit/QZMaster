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
    var sectionName: String
    let sectionImage: String?
    let quizes: [SectionItems]
}

struct SectionItems: Decodable, Hashable {
    let quizName: String
    let image: String
}
