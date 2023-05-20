//
//  MainView.swift
//  Credit card practice
//
//  Created by Austin Vesich on 5/19/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainScreenViewModel()
    
    var body: some View {
        VStack (alignment: .leading) {
            // Title
            HStack {
                Text("Credit Cards")
                    .font(.custom("Sentient-bold", size: 36.0))
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 48)
            
            // Card List
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16.0) {
                    ForEach(mainVM.cards) { card in
                        CardView(cardData: card)
                    }
                }
                .padding(.horizontal, 24.0)
            }
            .frame(maxHeight: 230)
            .padding(.bottom, 24.0)
            
            // Nothing else for now
            Spacer()
        }
        .environmentObject(mainVM)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
