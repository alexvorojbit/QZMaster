//
//  Section.swift
//  QZ Master
//
//  Created by Alexandru Vorojbit on 5/31/20.
//  Copyright © 2020 Alexandru Vorojbit. All rights reserved.
//

import Foundation

// Describes the info needed for a Section
struct Section: Decodable, Hashable {
    let type: String
    let title: String
    let items: [SectionItems]
}

struct SectionItems: Decodable, Hashable {
    let sectionName: String?
    let quizName: String?
    let image: String?
//    let quizes: [Quizes]
}

//struct Quizes: Decodable, Hashable {
//    let id: String
//    let name: String
//    let image: String?
//}
