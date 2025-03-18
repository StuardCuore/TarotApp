//
//  ContentView.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import SwiftUI

// func to shuffle the array this suffles the cards order.
func shuffledArray<T> (nums: [T]) -> [T] {
    var mutableCopyOfNums = nums
    
    var shuffledArray = [T]()
    
    while mutableCopyOfNums.count > 0 {
        let randomInd = Int.random(in: 0..<mutableCopyOfNums.count)
        let removedItem = mutableCopyOfNums.remove(at: randomInd)
        shuffledArray.append(removedItem)
    }
    return shuffledArray
}

func shuffleCardArray() -> [Card] { // func to shuffle the array into a var. the inside func is what shuffles them
    var cardArray: [Card] = []
    for i in 1...22 {
        cardArray.append(Card(front: i)) //card array from 1 to 22 (22 for the 22 arcana cards)
    }
            
    return shuffledArray(nums: cardArray)
}


extension View { // this is spreading the cards
    func stacked(at place: Int, in total: Int, spacing: CGFloat) -> some View {
        let offset = Double(total - place)
        
        return self.offset(x: offset * spacing, y: 0) //This sets how separated the cards are between them
    }
}




struct ContentView: View {
    
    
    @EnvironmentObject var cardIndex: ArrayData // refactor ArrayData
    @EnvironmentObject var sideMenuData: SideMenuData
    @State var showSpreadedCards = true
    @State var startView = true
    @State private var isMenuOpen = false
    @State var showCardDetail: Bool = false
    
   @State var cards = shuffleCardArray()
    
        var body: some View {
            
            ZStack {
                Image("Background").resizable()
                    .aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            
            if startView { // start view, just one card
                    VStack{
                        Spacer()
                        VStack {
                            Button {
                               
                                cardIndex.resetShuffleCards(cards: cards) //The func takes the parameter to reset the index arragement
                                
                                withAnimation{
                                    startView = false
                                }
                                
                            } label: {
                                Image(cardIndex.cardBack).resizable().aspectRatio(contentMode: .fit).frame(width: 100) //at some point animate this to suffle the cards
                            }.padding(.top, 330).shadow(radius: 50)
                            
                            Text("Tap the card to begin").font(.headline).fontWeight(.thin).foregroundColor(.white)
                        }
                        Spacer()
                        Image("Stuard Cuore logo-01").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200).opacity(0.7).padding(.bottom, 80)
                    } // VStack ends here
            } // Ends start view.
        
            if startView == false{ // changes to spreading cards view
                
                    CrossView() //brings out the magnetic dots.
                if sideMenuData.showPointSet2 == true {
                    CrossView2()
                }
                if sideMenuData.showPointSet3 == true {
                    CrossView3()
                }
                
                    if showSpreadedCards == true{
                        
                        ZStack {
                            ForEach(0..<cards.count, id: \.self) { index in
                                
                                CardView(card: cards[index])
                                    
                                    .stacked(at: index, in: cards.count, spacing: 28) // .stacked is what is spreading the cards by offset. we use the index and the card.count to place them and later we use the index to offset back the card placement to the magnetic point.
                                   
                                }
                                
                            }
                        }
                    
                    
                                //
               
                SideMenuView(isMenuVisible: $isMenuOpen)
                        .offset(x: isMenuOpen ? 0 : -(UIScreen.main.bounds.width)) // This hides and shows the sideMenuView
                
                        .animation(.easeInOut, value: isMenuOpen)
                
                                //
                    
                            VStack {
                                Spacer()
                                HStack {
                                    Button {
                                        //starts SIDE MENU action
                                        
                                            isMenuOpen.toggle()
                                       
                                        //ends SIDE MENU action
                                        
                                        
                                    } label: {
                                        Image(systemName: isMenuOpen == true ?  "menucard": "menucard.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                            .frame(width: 65, height: 65)
                                            .background(Circle().fill(.white.opacity(0.15)))
                                            .shadow(radius: 10)
                                        .foregroundColor(.black)} // is menuOpen.toggle is here
                                    .padding(30)
                                    Spacer()
                                    
                                    
                                    Button {
                                        showSpreadedCards.toggle()
                                        cards = shuffleCardArray()
                                        
                                        cardIndex.resetShuffleCards(cards: cards) // func to reset the cards. it takes the parameter to take into acount the new shuffled cards arrangement
                                        
                                    } label: {
                                        Image(systemName: showSpreadedCards == true ?  "lanyardcard.fill" : "lanyardcard")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                            .frame(width: 65, height: 65)
                                            .background(
                                                Circle()
                                                    .fill(.white.opacity(0.15)))
                                            .shadow(radius: 10)
                                            .foregroundColor(.black)
                                    }
                                    .padding(30)
                                    
                                } //starts Add-Ons for Side Menu // ends HStack
                                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                /* this part is unnecessary but might be useful elsewhere
                                 .gesture(
                                    DragGesture()
                                        .onEnded { value in
                                            if value.translation.width > 100 {
                                                withAnimation {
                                                    isMenuOpen = true
                                                }
                                            } else if value.translation.width < -100 {
                                                withAnimation {
                                                    isMenuOpen = false
                                                }
                                            }
                                        }
                                ) unnecessary part ends */
                            }.ignoresSafeArea()
                } //end of ZStack to take out the background
                
            }
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ArrayData()).environmentObject(SideMenuData())
    }
}
