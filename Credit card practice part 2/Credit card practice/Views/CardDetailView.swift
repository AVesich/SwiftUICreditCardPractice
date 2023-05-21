//
//  CardDetailView.swift
//  Credit card practice
//
//  Created by Austin Vesich on 5/20/23.
//

import SwiftUI

struct CardDetailView: View {
    
    // MARK: - Declaring Variables
    var card: CreditCardData!
    @Binding var colorOffset: CGFloat
    
    // MARK: - UI
    var body: some View {
        VStack(alignment: .leading) {
            // Card
            CardView(cardData: card, scrollOffset: $colorOffset)
                .padding(.horizontal, 48)
                .padding(.top, 24)
            
            // Div
            Divider()
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
            
            // Text
            Text("\(card.name)'s Card")
                    .font(.custom("Sentient-Bold", size: 22.0))
                    .padding([.bottom, .horizontal], 24.0)
            VStack(alignment: .leading, spacing: 8.0) {
                Text(card.number)
                    .font(.custom("Sentient", size: 18.0))
                Text(CreditCardData.dateFormatter.string(from: card.date))
                    .font(.custom("Sentient", size: 18.0))
                Text(card.countryTitle)
                    .font(.custom("Sentient", size: 18.0))
            }
                .padding(.horizontal, 24.0)
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: .defaultCard, colorOffset: .constant(0))
    }
}
