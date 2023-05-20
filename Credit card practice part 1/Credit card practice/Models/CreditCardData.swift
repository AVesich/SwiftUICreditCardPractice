//
//  CreditCardData.swift
//  Credit card practice
//
//  Created by Austin Vesich on 5/19/23.
//

import Foundation
import SwiftUI

struct CreditCardData: Identifiable {
    enum COUNTRY: String {
        case US = "dollarsign"
        case EU = "sterlingsign"
        case JP = "yensign"
    }
    
    var number: String
    var country: COUNTRY
    var date: Date
    var name: String
    var topLeft: Color = .red
    var bottomRight: Color = .orange
    let id = UUID()
    
    static let defaultCard = CreditCardData(number: "#### #### #### ####", country: .US, date: Date.now, name: "Austin B Vesich")
}
