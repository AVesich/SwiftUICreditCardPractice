//
//  MainScreenViewModel.swift
//  Credit card practice
//
//  Created by Austin Vesich on 5/19/23.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    // MARK: - Declaring variables
    @Published var cards: [CreditCardData]!
    
    // MARK: - Initialization
    init () {
        let card1 = CreditCardData(number: "1234 1234 1234 1234",
                                   country: .EU,
                                   date: Date.now,
                                   name: "Ada Lovelace")
        let card2 = CreditCardData(number: "1111 2222 3333 4444",
                                   country: .US,
                                   date: Date.now,
                                   name: "Steve Jobs")
        let card3 = CreditCardData(number: "7889 5947 3968 0273",
                                   country: .JP,
                                   date: Date.now,
                                   name: "Shigeru Miyamoto")
        cards = [ card1, card2, card3 ]
    }
    
    // MARK: - Funcs
}
