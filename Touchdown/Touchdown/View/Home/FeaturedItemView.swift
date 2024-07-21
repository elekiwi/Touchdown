//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Leo Merelo on 12/6/24.
//

import SwiftUI

struct FeaturedItemView: View {
    //MARK: - PROPERTY
    
    let player: Player
    
    //MARK: - BODY
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    FeaturedItemView(player: players[0])
}
