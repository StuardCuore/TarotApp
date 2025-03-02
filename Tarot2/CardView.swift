//
//  CardView.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//
import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var cardIndex: NumArray
    
    let card: Card

    
    @State private var isShowingCard = false 
    @State private var xdragAmount: CGFloat = UIScreen.main.bounds.width/8
    @State private var ydragAmount: CGFloat = UIScreen.main.bounds.height/8
    
    @State var zIndVal: Double = 0
    @State var offsetBack:CGFloat = 0
    
    
    
    var body: some View {
        
        HStack {
            
            if isShowingCard {
                if card.booly == true {
                    Image(cardIndex.cardSet+String(card.front))
                        .resizable().aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                }
                else if card.booly == false {
                    Image(cardIndex.cardSet+String(card.front))
                        .resizable().aspectRatio(contentMode: .fit).rotationEffect(.degrees(180))
                        .cornerRadius(10)
                }
            }
            else if isShowingCard == false {
                
                Image(cardIndex.cardBack+card.back)
                        .resizable().aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    
                
            }
        }
        .frame(width:200, height: 320)
        .zIndex(zIndVal)
        .position(x: self.xdragAmount, y: self.ydragAmount)
        
        .gesture(
            DragGesture()
                .onChanged({value in
                    //self.offset(x: 0, y: 0)
                    self.xdragAmount = value.location.x
                    self.ydragAmount = value.location.y
                    
                    if cardIndex.zInd < cardIndex.zVar {
                        cardIndex.zInd += 1
                    }
                    else if cardIndex.zInd > cardIndex.zVar{
                        cardIndex.zVar += 1
                    }
                    cardIndex.zInd = cardIndex.zVar
                    print(cardIndex.zInd)
                    zIndVal = cardIndex.zInd
                }
                          )
                .onEnded(
                    {value in
                        
                        //accediendo al index de la carta en el shuffled array
                        
                        
                        //me quitó el error.
                        /*for (index, shufIndex) in cardIndex.shuffledCardIndex.enumerated() {
                            if shufIndex == card.front {
                                print("found at")
                                print(index)
                                offsetBack = CGFloat(index + 1) //offsetBack = CGFloat(index + 1)
                                print("offset number: \(offsetBack)")
                            }
                        }*/
                        //me quitó el error
                        
                        
                        if cardIndex.zVar == cardIndex.zInd {
                            cardIndex.zInd += 1
                        }
                        cardIndex.zVar += 2
                        
                        // magnet del 1er punto
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount + 250 + (28 * offsetBack))) < 100  && abs((UIScreen.main.bounds.height/1.5) - self.ydragAmount) < 150  {
                            
                            self.xdragAmount = 410 - 250 - (28 * offsetBack)
                            self.ydragAmount = 787
                        }
                        // magnet del punto medio
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount + (28 * offsetBack))) < 100  && abs((UIScreen.main.bounds.height/1.5) - self.ydragAmount) < 150  {
                            self.xdragAmount = 410 - (28 * offsetBack)
                            self.ydragAmount = 787
                        }
                        // magnet del tercer punto
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount - 250 + (28 * offsetBack))) < 100  && abs((UIScreen.main.bounds.height/1.5) - self.ydragAmount) < 150  {
                         
                            self.xdragAmount = 410 + 250 - (28 * offsetBack)
                            self.ydragAmount = 787
                        }
                            
                    }
                )
        )
        
        .onTapGesture {
            isShowingCard.toggle()
        }
        
        
    }
    
}
    
    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            CardView(card: Card.example2)
        }
    }


