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


// this is spreading the cards
extension View {
    func stacked(at place: Int, in total: Int) -> some View {
        let offset = Double(total - place)
        
        return self.offset(x: offset * 28, y: 0) //This sets how separated the cards are between them
    }
}


struct ContentView: View {
    
    @EnvironmentObject var cardIndex: NumArray
    @State var show = true
    @State var startView = true
    @State private var isMenuOpen = false
    
    
    //random bool
    //var randomBool = Bool.random()  //commented out, delete later
    //
    

    
    //this should be a loop
    @State var cards = shuffledArray(nums:[Card(front: 1),
                                           Card(front: 2),
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
            
            // Add logo, add captio 'tap to spread the cards', add shadows,
            if startView { // start view, just a card
                ZStack{
                    Image("Background").resizable() //See if this could be outside this 'if' statement
                        .aspectRatio(contentMode: .fill).ignoresSafeArea()
                    VStack{
                        Spacer()
                        VStack {
                            Button {
                                var i = 0
                                var emptyArray = [Int]()
                                cardIndex.shuffledCardIndex = [Int]()
                                
                                while i < cards.count {
                                    let inte = Int(cards[i].front)
                                    emptyArray.insert(inte, at:i)
                                    cardIndex.shuffledCardIndex = emptyArray.reversed()
                                    i = i + 1
                                }
                                withAnimation{
                                    startView = false
                                }
                                print(cardIndex.shuffledCardIndex)
                            } label: {
                                Image("Back") //at some point animate this to suffle the cards
                            }.padding(.top, 330)
                            
                            Text("Tap the card to begin").font(.headline).fontWeight(.thin).foregroundColor(.white)
                        }
                        Spacer()
                        Image("Stuard Cuore logo-01").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200).opacity(0.7).padding(.bottom, 80)
                    } // VStack ends here

                }
            } // ends start view.
        
            if startView == false{ // changes to spreading cards view
                ZStack {
                    Image("Background").resizable()
                        .aspectRatio(contentMode: .fill).ignoresSafeArea() //should probably be outside this 'if' statement
                    
                    CrossView() //brings out the magnetic dots.
                    
                    if show == true{ //refactor the 'show' var
                        
                        ZStack {
                           
                            ForEach(0..<cards.count, id: \.self) { index in
                                
                                CardView(card: cards[index])
                                    .stacked(at: index, in: cards.count) // .stacked is what is spreading the cards by offset. we use the index and the card.count to place them and later we use the index to offset back the card placement to the magnetic point.
                                
                                //cardIndex.shuffledCardIndex.append(index) //commented out before hand
                            }
                        }
                    }
                    
                                //
                                SideMenuView()
                                    .offset(x: isMenuOpen ? -300 : -560)
                                    .animation(.easeInOut, value: isMenuOpen)
                                // Dimmed background when menu is open
                                if isMenuOpen {
                                    /*Color.black.opacity(0.5)
                                        .edgesIgnoringSafeArea(.all)
                                        .onTapGesture {
                                            withAnimation {
                                                isMenuOpen = false
                                            }
                                        }*/
                                }
                                // Dimmed background when menu is open
                                //
                    
                        HStack {
                            VStack {
                                Spacer()
                                HStack {
                                    Button {
                                        //starts SIDE MENU action
                                        
                                        withAnimation {
                                            isMenuOpen.toggle()
                                        }
                                        
                                        //ends SIDE MENU action
                                        
                                        // this button needs to be changed to instead bring up a SIDE MENU to chose from different cards.
                                        cardIndex.clowCards.toggle() // change this in this file and in the arrayData file when SIDE MENU is set.
                                        if cardIndex.clowCards == true {
                                            cardIndex.cardSet = cardIndex.cardSet2 // This needs a refactor to get the information from somewhere else. //TRY GET THIS FROM CardProfile File
                                            cardIndex.cardBack = cardIndex.cardBackSet2 // This needs a refactor to get the information from somewhere else. //TRY GET THIS FROM CardProfile File
                                            
                                        }
                                        else if cardIndex.clowCards == false {
                                            cardIndex.cardSet = cardIndex.cardSet1 // This needs a refactor to get the information from somewhere else. //TRY GET THIS FROM CardProfile File
                                            cardIndex.cardBack = cardIndex.cardBackSet1// This needs a refactor to get the information from somewhere else. //TRY GET THIS FROM CardProfile File
                                        }
                                        
                                    } label: {
                                        Image(systemName: cardIndex.clowCards == true ?  "menucard.fill" : "menucard")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                            .frame(width: 100, height: 100)
                                            .background(
                                                Circle()
                                                    .fill(.white.opacity(0.15)))
                                            .shadow(radius: 10)
                                        //.font(.title)
                                        .foregroundColor(.black)} // is menuOpen.toggle is here
                                    .padding(40)
                                    Spacer()
                                    
                                    //Image(systemName: "circle.dotted")
                                    
                                    Button {
                                        show.toggle()
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
                                                                    Card(front: 21),Card(front: 22)])
                                        
                                        print("new array")
                                        print(cardIndex.shuffledCardIndex)
                                        
                                        var i = 0
                                        var emptyArray = [Int]()
                                        cardIndex.shuffledCardIndex = [Int]()
                                        
                                        while i < cards.count {
                                            let inte = Int(cards[i].front)
                                            emptyArray.insert(inte, at:i)
                                            cardIndex.shuffledCardIndex = emptyArray.reversed()
                                            
                                            
                                            i = i + 1
                                        }
                                        
                                    } label: {
                                        Image(systemName: show == true ?  "lanyardcard.fill" : "lanyardcard")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                        
                                            .frame(width: 100, height: 100)
                                            .background(
                                                //RoundedRectangle(cornerRadius: 10)
                                                Circle()
                                                    .fill(.white.opacity(0.15)))
                                            .shadow(radius: 10)
                                        //.font(.title)
                                            .foregroundColor(.black)
                                    }
                                    .padding(40)
                                    
                                } //starts Add-Ons for Side Menu // ends HStack
                                //.frame(maxWidth: .infinity, maxHeight: .infinity)
                                //.background(Color.white)//delete
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
                                )
                            }
                        }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
