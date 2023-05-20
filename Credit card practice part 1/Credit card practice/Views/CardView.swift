//
//  CardView.swift
//  Credit card practice
//
//  Created by Austin Vesich on 5/19/23.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Declaring variables
    let cardData: CreditCardData!
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm.YY"
        return formatter
    }
        
    // MARK: - View Setup
    var body: some View {
        ZStack() {
            // Background
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(colors: [cardData.topLeft, cardData.bottomRight],
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
            
            // Card Details
            VStack(alignment: .leading, spacing: 8) {
                HStack () {
                    Text(cardData.number)
                        .font(.custom("Suisse Int'l Mono", size: 20.0))
                    Spacer()
                    Image(systemName: cardData.country.rawValue)
                        .imageScale(.large)
                }
                Spacer()
                
                Text(dateFormatter.string(from: cardData.date))
                    .font(.custom("Suisse Int'l Mono", size: 16.0))
                Text(cardData.name)
                    .font(.custom("Suisse Int'l Mono", size: 20.0))
                    
            }
            .padding(.horizontal, 24.0)
            .padding(.vertical, 36.0)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .aspectRatio(1.6, contentMode: .fit)
        .frame(height: 230)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardData: CreditCardData.defaultCard)
    }
}
