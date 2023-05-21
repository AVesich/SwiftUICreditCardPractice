//
//  MainView.swift
//  Credit card practice
//
//  Created by Austin Vesich on 5/19/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainScreenViewModel()
    @State var scrollPos: CGPoint = .zero
    @State var presentingCardInfo: Bool = false
    @State var selectedCard: CreditCardData = .defaultCard
    
    var body: some View {
        NavigationView {
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
                            Button {
                                presentingCardInfo.toggle()
                                selectedCard = card
                            } label: {
                                CardView(cardData: card, scrollOffset: $scrollPos.x)
                            }
                        }
                    }
                    .background(GeometryReader { geometry in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("cardList")).origin)
                    })
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        self.scrollPos = value
                        self.scrollPos.x -= 24 // Fixes the offset from the card hstack padding below
                    }
                    .padding(.horizontal, 24.0)
                }
                .frame(maxHeight: 230)
                .coordinateSpace(name: "cardList")
                
                // Instruction text
                Text("Tap on a card to see its data in a form!")
                    .font(.custom("Sentient", size: 16.0))
                    .padding(24.0)
                
                // Nothing else for now
                Spacer()
            }
            .environmentObject(mainVM)
            // Info sheet
            .sheet(isPresented: $presentingCardInfo) {
                CardDetailView(card: selectedCard, colorOffset: $scrollPos.x)
                    .presentationDetents([.height(512)])
            }
        }
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
