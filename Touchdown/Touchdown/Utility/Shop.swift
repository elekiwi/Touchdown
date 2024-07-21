//
//  Shop.swift
//  Touchdown
//
//  Created by Leo Merelo on 14/7/24.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published  var selectedProduct: Product? = nil
}
