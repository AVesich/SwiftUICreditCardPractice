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
    @Binding var scrollOffset: CGFloat // This is used to update the color based on the scroll position on the main screen
    private var offsetAngle: Angle {
        let offsetDiminished = scrollOffset/6
        return Angle(degrees: Double(offsetDiminished.truncatingRemainder(dividingBy: 360))) // Mod used to allow color angle to loop
    }
        
    // MARK: - View Setup
    var body: some View {
        ZStack() {
            // Background
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(colors: [cardData.topLeft, cardData.bottomRight],
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .hueRotation(offsetAngle)
            
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
                
                Text(CreditCardData.dateFormatter.string(from: cardData.date))
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
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardData: .defaultCard, scrollOffset: .constant(0))
    }
}
