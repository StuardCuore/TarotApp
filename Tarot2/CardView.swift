//
//  CardView.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//
import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var cardIndex: NumArray // comes from ArrayData file.
    
    let card: Card // Comes from the Card file.

    
    @State private var isShowingCard = false // This is what makes the cards show in their backs at the beginning and toogles to change between back and front. start on false so is showing the back.
    @State private var xdragAmount: CGFloat = UIScreen.main.bounds.width/8 //gets the width of the screen divided by 8
    @State private var ydragAmount: CGFloat = UIScreen.main.bounds.height/8 //gets the height of the screen divided by 8
    
    @State var zIndVal: Double = 0
    @State var offsetBack:CGFloat = 1 //it starts in 1 so later when we add the index of each card * 28 it sets back the self.xDragAmount to the magnetic point.
    
    
    
    var body: some View {
        
        HStack {
            
            if isShowingCard { //toogle for front and back of the card
                if card.booly == true { // true puts the card upwards
                    Image(cardIndex.cardSet+String(card.front))
                        .resizable().aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
                
                else if card.booly == false { // false puts the card downwards/upside down
                    Image(cardIndex.cardSet+String(card.front))
                        .resizable().aspectRatio(contentMode: .fit).rotationEffect(.degrees(180))
                        .cornerRadius(10)
                }
            }
            else if isShowingCard == false { //toogle for front and back of the card
                
                Image(cardIndex.cardBack+card.back)
                        .resizable().aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
            } //end of toogle for front and back of the card
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
                        cardIndex.zInd += 1 // sets the zInd of the touched card
                    }
                    else if cardIndex.zInd > cardIndex.zVar{
                        cardIndex.zVar += 1// sets the zInd of the touched card
                    }
                    cardIndex.zInd = cardIndex.zVar // sets the zInd of the touched card
                    print(cardIndex.zInd)
                    zIndVal = cardIndex.zInd // sets the zInd of the touched card
                }
                          )
                .onEnded(
                    {value in
                        
                        // accessing to the card index with .enumerated() to set the offsetBack variable.
                        for (index, shufIndex) in cardIndex.shuffledCardIndex.enumerated() { //gets the index so the card can be offset back to match the magnet point. without this the cards get offsetted due to the original offset placement.
                            if shufIndex == card.front {
                                print("found at \(index)") //console debugging
                                offsetBack = CGFloat(index) + CGFloat(1)
                                print("offset number: \(offsetBack)")
                            }
                        }
                        
                        if cardIndex.zVar == cardIndex.zInd {
                            cardIndex.zInd += 1 // sets the zInd of the touched card
                        }
                        cardIndex.zVar += 2 // Brings the touched card to the front.
                        
                        // magnet gesture to the 1st point.
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount + 250 + (28 * offsetBack))) < 100  && abs((UIScreen.main.bounds.height/1.5) - self.ydragAmount) < 150  {
                            self.xdragAmount = 410 - 250 - (28 * offsetBack) //FIND OUT where does the 410 comes from.
                            // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                            self.ydragAmount = 787
                        }
                        // magnet gesture to the 2nd point.
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount + (28 * offsetBack))) < 100  && abs((UIScreen.main.bounds.height/1.5) - self.ydragAmount) < 150  {
                            self.xdragAmount = 410 - (28 * offsetBack)// var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                            self.ydragAmount = 787
                        }
                        // magnet magnet gesture to the 3rd point.
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount - 250 + (28 * offsetBack))) < 100  && abs((UIScreen.main.bounds.height/1.5) - self.ydragAmount) < 150  {
                            self.xdragAmount = 410 + 250 - (28 * offsetBack)// var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                            self.ydragAmount = 787
                        }
                    }
                )
        )
        .onTapGesture {
            isShowingCard.toggle() // onTapGesture to toggle back and front.
            // MISSING a long press gesture to see the card in big
        }
    }
}
    
    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            CardView(card: Card.example2)
                .environmentObject(NumArray()) //This allows the preview to load by been able to read the environmentObject
        }
    }


