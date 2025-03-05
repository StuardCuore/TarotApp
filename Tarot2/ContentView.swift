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
    
    
    //random bool
    //var randomBool = Bool.random()  //commented out, delete later
    //
    

    
    //this should be a loop
    @State var cards = shuffledArray(nums:[Card(front: 1),Card(front: 2),
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
                    }

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
                    
                    VStack{
                        Spacer()
                        HStack{
                            Button {
                                cardIndex.clowCards.toggle()
                                if cardIndex.clowCards == true {
                                    cardIndex.cardSet = cardIndex.cardSet2
                                    cardIndex.cardBack = cardIndex.cardBackSet2
  
                                }
                                else if cardIndex.clowCards == false {
                                    cardIndex.cardSet = cardIndex.cardSet1
                                    cardIndex.cardBack = cardIndex.cardBackSet1
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
                                    .font(.title)
                                .foregroundColor(.black)}
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
                                
                                    .font(.title)
                                .foregroundColor(.black)}
                            
                            .padding(40)
                            
                        }
                    }
                    
                }}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
