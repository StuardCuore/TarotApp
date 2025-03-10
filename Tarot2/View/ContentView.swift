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

extension View { // this is spreading the cards
    func stacked(at place: Int, in total: Int, spacing: CGFloat) -> some View {
        let offset = Double(total - place)
        
        return self.offset(x: offset * spacing, y: 0) //This sets how separated the cards are between them
    }
}


struct ContentView: View {
    
    @EnvironmentObject var cardIndex: NumArray
    @State var showSpreadedCards = true
    @State var startView = true
    @State private var isMenuOpen = false
    @State var showCardDetail: Bool = false
    
    
    //this should be a loop
    @State var cards = shuffledArray(nums:[Card(front: 1),Card(front: 2), //take out the hard coding.
                                           Card(front: 3),Card(front: 4),
                                           Card(front: 5),Card(front: 6),
                                           Card(front: 7),Card(front: 8),
                                           Card(front: 9),Card(front: 10),
                                           Card(front: 11),Card(front: 12),
                                           Card(front: 13),Card(front: 14),
                                           Card(front: 15),Card(front: 16),
                                           Card(front: 17),Card(front: 18),
                                           Card(front: 19),Card(front: 20),
                                           Card(front: 21),Card(front: 22)])
    // ends loop
   
    
        var body: some View {
            
            ZStack {
                Image("Background").resizable()
                    .aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            
            if startView { // start view, just a card
                    VStack{
                        Spacer()
                        VStack {
                            Button {
                                //make a func for this.
                                var i = 0
                                var emptyArray = [Int]()
                                cardIndex.shuffledCardIndex = [Int]()
                                
                                while i < cards.count {
                                    let inte = Int(cards[i].front)
                                    emptyArray.insert(inte, at:i)
                                    cardIndex.shuffledCardIndex = emptyArray.reversed()
                                    i = i + 1
                                }
                                //make a func for this.
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
                    
                    if showSpreadedCards == true{ //refactor the 'show' var
                        
                        ZStack {
                            ForEach(0..<cards.count, id: \.self) { index in
                                
                                CardView(card: cards[index])
                                    
                                    .stacked(at: index, in: cards.count, spacing: 28) // .stacked is what is spreading the cards by offset. we use the index and the card.count to place them and later we use the index to offset back the card placement to the magnetic point.
                                   
                                }
                                
                            }
                        }
                    
                    
                                //
                                SideMenuView()
                                    .offset(x: isMenuOpen ? -390 : -560) // .offset(x: isMenuOpen ? -300 : -560) // This hides and shows the sideMenuView
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
                                            .frame(width: 100, height: 100)
                                            .background(
                                                Circle()
                                                    .fill(.white.opacity(0.15)))
                                            .shadow(radius: 10)
                                        .foregroundColor(.black)} // is menuOpen.toggle is here
                                    .padding(40)
                                    Spacer()
                                    
                                    
                                    Button {
                                        showSpreadedCards.toggle()
                                        cards = shuffledArray(nums:[Card(front: 1),Card(front: 2),
                                                                    Card(front: 3),Card(front: 4),
                                                                    Card(front: 5),Card(front: 6),
                                                                    Card(front: 7),Card(front: 8),
                                                                    Card(front: 9),Card(front: 10),
                                                                    Card(front: 11),Card(front: 12),
                                                                    Card(front: 13),Card(front: 14),
                                                                    Card(front: 15),Card(front: 16),
                                                                    Card(front: 17),Card(front: 18),
                                                                    Card(front: 19),Card(front: 20),
                                                                    Card(front: 21),Card(front: 22)]) //take out the hard coding.
                                        
                                        var i = 0
                                        var emptyArray = [Int]()
                                        cardIndex.shuffledCardIndex = [Int]()
                                        
                                        while i < cards.count {
                                            let inte = Int(cards[i].front)
                                            emptyArray.insert(inte, at:i)
                                            cardIndex.shuffledCardIndex = emptyArray.reversed()
                                            i = i + 1
                                            //take out from view file.
                                        }
                                        
                                    } label: {
                                        Image(systemName: showSpreadedCards == true ?  "lanyardcard.fill" : "lanyardcard")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                            .frame(width: 100, height: 100)
                                            .background(
                                                Circle()
                                                    .fill(.white.opacity(0.15)))
                                            .shadow(radius: 10)
                                            .foregroundColor(.black)
                                    }
                                    .padding(40)
                                    
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
                            }
                } //end of ZStack to take out the background
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
