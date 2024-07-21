//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Leo Merelo on 13/6/24.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
