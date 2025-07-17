//
//  CardView.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//
import SwiftUI

struct CardView: View {
    
    
    
    @EnvironmentObject var cardIndex: ArrayData // comes from ArrayData file.
    @EnvironmentObject var sideMenuData: SideMenuData
    @EnvironmentObject var cardOnDots: CardOnDots
    
    let card: Card // Comes from the Card file.
    
    
    @State var isShowingCard = false // This is what makes the cards show in their backs at the beginning and toogles to change between back and front. start on false so is showing the back.
    @State private var xdragAmount: CGFloat = UIScreen.main.bounds.width/8 //gets the width of the screen divided by 8
    @State private var ydragAmount: CGFloat = UIScreen.main.bounds.height/10 //gets the height of the screen divided by 8
    
    @State var zIndVal: Int = 0 // changed from Double to Int
    @State var offsetBack:CGFloat = 1 //it starts in 1 so later when we add the index of each card * 28 it sets back the self.xDragAmount to the magnetic point.
    @State var showCardDetail: Bool = false
    @State private var timer: Timer? //this is used in the func for the timer that makes the detail view wait a bit on the longPress gesture before showing the view
    var offset1 = CrossView().xoffset1 //x offset for points 1,2,3
    var xoffset2 = CrossView2().xoffset2 //x offset for points 4,5
    var yoffset2 = CrossView2().yoffset2 //y offset for points 4,5
    var xoffset3 = CrossView3().x2offset3 //x offset for points 6,7,8,9
    var yoffset3 = CrossView3().y2offset3 //x offset for points 6,7,8,9
    var dotPlacementOnX = CrossView().xPlacement1
    var dotPlacementOnY = CrossView().yPlacement1
    
    
    /*@State var showPointSet2: Bool = false
    @State var showPointSet3: Bool = false    //change to observedObject
     */
    

    @State private var imageSize: CGSize = .zero //Use for getting the card size.
    
    
   
    
    
    
    
    var body: some View {
        
        HStack {
            
            if isShowingCard { //toogle for front and back of the card
                if card.booly == true { // true puts the card upwards
                    Image(cardIndex.cardSet+String(card.front))
                        .resizable().aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
                
                else if card.booly == false { // false puts the card downwards/upside down
                    Image(cardIndex.cardSet+String(card.front)) // AQUI!!!!!!!!!!!!
                        .resizable().aspectRatio(contentMode: .fit).rotationEffect(.degrees(180))
                        .cornerRadius(10)
                }
            }
            else if isShowingCard == false { //toogle for front and back of the card
                //VStack {
                    Image(cardIndex.cardBack) // Image(cardIndex.cardBack+card.back)
                        .resizable().aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .overlay( //this overlay is to get the width and height of each card.
                                            GeometryReader { geometry in
                                                Color.clear
                                                    .onAppear {
                                                        imageSize = geometry.size
                                                    }
                                                    .onChange(of: geometry.size) { newSize in
                                                        imageSize = newSize
                                                    }
                                            }
                                        )

                                   // Text("Width: \(imageSize.width, specifier: "%.2f"), Height: \(imageSize.height, specifier: "%.2f")")
                                        //.padding()
                //}
            } //end of toogle for front and back of the card
        }
        .frame(width:200, height: 190) //.frame(width:200, height: 320) //REVIEW FIXED VALUES
        .zIndex(Double(zIndVal))
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
                    stopTimer()
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
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount + offset1 + (28 * offsetBack))) < imageSize.width/2  && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount) < imageSize.height/2  {
                            self.xdragAmount = dotPlacementOnX - offset1 - (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                            // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                            self.ydragAmount = dotPlacementOnY
                            //dotPlacementOnY is the value of the magnetic point placement on the Y axe
                        }
                        //Getting the cardname /number of point 1
                        if self.xdragAmount == dotPlacementOnX - offset1 - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY && isShowingCard {
                        
                            print(self.card.front)
                            cardOnDots.cardOnDot1 = self.card.front //gets me the card number to be changed to the card name.
                            print("test1 \(cardOnDots.cardOnDot1)") //prints: test Optional(13)
                            
                            cardOnDots.dot1Bool = true
                        }
                        //Getting the cardname /number of point 1 end
                        // magnet gesture to the 2nd point.
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount + (28 * offsetBack))) < imageSize.width/2  && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount) < imageSize.height/2  {
                            self.xdragAmount = dotPlacementOnX - (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                            // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                            self.ydragAmount = dotPlacementOnY //dotPlacementOnY is the value of the magnetic point placement on the Y axe
                        }
                        
                        //Getting the cardname /number of point 2
                        if self.xdragAmount == dotPlacementOnX - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY && isShowingCard
                        {
                        
                            cardOnDots.cardOnDot2 = self.card.front //gets me the card number to be changed to the card name.
                            print("test2 \(cardOnDots.cardOnDot2)") //prints: test Optional(13)
                            cardOnDots.dot2Bool = true
                        }
                        //Getting the cardname /number of point 2 end
                        // magnet magnet gesture to the 3rd point.
                        if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount - offset1 + (28 * offsetBack))) < imageSize.width/2 && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount) < imageSize.height/2  {
                            self.xdragAmount = dotPlacementOnX + offset1 /*xOffset*/- (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                            // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                            self.ydragAmount = dotPlacementOnY //dotPlacementOnY is the value of the magnetic point placement on the Y axe
                        }
                        
                        //Getting the cardname /number of point 3
                        if self.xdragAmount == dotPlacementOnX + offset1 /*xOffset*/- (28 * offsetBack) && self.ydragAmount == dotPlacementOnY && isShowingCard
                        {
                        
                            cardOnDots.cardOnDot3 = self.card.front //gets me the card number to be changed to the card name.
                            print("test3 \(cardOnDots.cardOnDot3)") //prints: test Optional(13)
                            cardOnDots.dot3Bool = true
                        }
                        //Getting the cardname /number of point 3 end
                        
                        // magnetic set crossview2
                        if sideMenuData.showPointSet2 == true { //change value through sideMenuView
                            //point 4:
                            if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount + (28 * offsetBack))) < imageSize.width/2  && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount + yoffset2) < imageSize.height/2  {
                                self.xdragAmount = dotPlacementOnX /*add xOffset*/ - (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                                // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                                self.ydragAmount = dotPlacementOnY + yoffset2/*add yOffset*/
                            }
                            //Getting the cardname /number of point 4
                            if self.xdragAmount == dotPlacementOnX /*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY + yoffset2 && isShowingCard
                            {
                            
                                cardOnDots.cardOnDot4 = self.card.front //gets me the card number to be changed to the card name.
                                print("test4 \(cardOnDots.cardOnDot4)") //prints: test Optional(13)
                                cardOnDots.dot4Bool = true
                            }
                            //Getting the cardname /number of point 4 end
                            
                            //point 5:
                            if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount + (28 * offsetBack))) < imageSize.width/2  && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount - yoffset2) < imageSize.height/2  {
                                self.xdragAmount = dotPlacementOnX /*add xOffset*/ - (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                                // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                                self.ydragAmount = dotPlacementOnY - yoffset2/*add yOffset*/
                            }
                            //Getting the cardname /number of point 5
                            if self.xdragAmount == dotPlacementOnX /*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY - yoffset2 && isShowingCard
                            {
                            
                                cardOnDots.cardOnDot5 = self.card.front //gets me the card number to be changed to the card name.
                                print("test5 \(cardOnDots.cardOnDot5)") //prints: test Optional(13)
                                cardOnDots.dot5Bool = true
                            }
                            //Getting the cardname /number of point 5 end
                        }
                        // magnetic points 2
                        
                        // magnetic points 3
                        if sideMenuData.showPointSet3 == true { //change back to true
                            //point 6
                            if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount - xoffset3/*xOffset*/ + (28 * offsetBack))) < imageSize.width/2  && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount + yoffset3) < imageSize.height/2  {
                                self.xdragAmount = dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                                // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                                self.ydragAmount = dotPlacementOnY + yoffset3/*add yOffset*/
                            }
                            //Getting the cardname /number of point 6
                            if self.xdragAmount == dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY + yoffset3 && isShowingCard
                            {
                            
                                cardOnDots.cardOnDot6 = self.card.front //gets me the card number to be changed to the card name.
                                print("test6 \(cardOnDots.cardOnDot6)") //prints: test Optional(13)
                                cardOnDots.dot6Bool = true
                            }
                            //Getting the cardname /number of point 6 end
                            //point 7:
                            if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount - xoffset3/*xOffset*/ + (28 * offsetBack))) < imageSize.width/2  && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount /*yOffset*/) < imageSize.height/2  {
                                self.xdragAmount = dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                                // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                                self.ydragAmount = dotPlacementOnY /*add yOffset*/
                            }
                            
                            //Getting the cardname /number of point 7
                            if self.xdragAmount == dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY && isShowingCard
                            {
                            
                                cardOnDots.cardOnDot7 = self.card.front //gets me the card number to be changed to the card name.
                                print("test7 \(cardOnDots.cardOnDot7)") //prints: test Optional(13)
                                cardOnDots.dot7Bool = true
                            }
                            //Getting the cardname /number of point 7 end
                            
                            //point 8
                            if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount - xoffset3/*xOffset*/ + (28 * offsetBack))) < imageSize.width/2  && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount - yoffset3) < imageSize.height/2  {
                                self.xdragAmount = dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                                // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                                self.ydragAmount = dotPlacementOnY - yoffset3/*add yOffset*/
                            }
                            
                            //Getting the cardname /number of point 8
                            if self.xdragAmount == dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY - yoffset3 && isShowingCard
                            {
                            
                                cardOnDots.cardOnDot8 = self.card.front //gets me the card number to be changed to the card name.
                                print("test8 \(cardOnDots.cardOnDot8)") //prints: test Optional(13)
                                cardOnDots.dot8Bool = true
                                
                            }
                            //Getting the cardname /number of point 8 end
                            
                            //point 9
                            if abs((UIScreen.main.bounds.width/2) - (self.xdragAmount - xoffset3/*xOffset*/ + (28 * offsetBack))) < imageSize.width/2  && abs((UIScreen.main.bounds.height/1.45) - self.ydragAmount - (yoffset3*2)) < imageSize.height/2  {
                                self.xdragAmount = dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) //dotPlacementOnX is the value of the magnetic point placement on the X axe
                                // var offsetback is what takes the card to the magnetic place, taking out the offset/displacement created in the extension for the card view in the ContentView.swift file.
                                self.ydragAmount = dotPlacementOnY - (yoffset3*2)/*add yOffset*/
                            }
                            //Getting the cardname /number of point 9
                            if self.xdragAmount == dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY - (yoffset3*2) && isShowingCard
                            {
                            
                                cardOnDots.cardOnDot9 = self.card.front //gets me the card number to be changed to the card name.
                                print("test9 \(cardOnDots.cardOnDot9)") //prints: test Optional(13)
                                cardOnDots.dot9Bool = true
                            }
                            //Getting the cardname /number of point 9 end
                            
                        }
                        // magnetic points 3
                    }
                )
        )
        .onTapGesture {
            isShowingCard.toggle() // onTapGesture to toggle back and front.
            if cardIndex.zInd < cardIndex.zVar {
                cardIndex.zInd += 1 // sets the zInd of the touched card
            }
            else if cardIndex.zInd > cardIndex.zVar{
                cardIndex.zVar += 1// sets the zInd of the touched card
            }
            cardIndex.zInd = cardIndex.zVar // sets the zInd of the touched card
            print(cardIndex.zInd)
            zIndVal = cardIndex.zInd // sets the zInd of the touched card
            //secind block
            /*if cardIndex.zVar == cardIndex.zInd {
                cardIndex.zInd += 1 // sets the zInd of the touched card
            }
            cardIndex.zVar += 2 // Brings the touched card to the front.*/
            
            //getting cardname on tap start
            //Getting the cardname /number of point 1
            if self.xdragAmount == dotPlacementOnX - offset1 - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY && isShowingCard {
            
                print(self.card.front)
                cardOnDots.cardOnDot1 = self.card.front //gets me the card number to be changed later to the card name.
                print("test1 \(cardOnDots.cardOnDot1)") //REMOVE LATER
                cardOnDots.dot1Bool = true
            }
            //Getting the cardname /number of point 1 end
            
            //Getting the cardname /number of point 2
            if self.xdragAmount == dotPlacementOnX - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY && isShowingCard
            {
            
                cardOnDots.cardOnDot2 = self.card.front //gets me the card number to be changed to the card name.
                print("test2 \(cardOnDots.cardOnDot2)") //REMOVE LATER
                cardOnDots.dot2Bool = true
            }
            //Getting the cardname /number of point 2 end
            
            //Getting the cardname /number of point 3
            if self.xdragAmount == dotPlacementOnX + offset1 /*xOffset*/- (28 * offsetBack) && self.ydragAmount == dotPlacementOnY && isShowingCard
            {
            
                cardOnDots.cardOnDot3 = self.card.front //gets me the card number to be changed to the card name.
                print("test3 \(cardOnDots.cardOnDot3)") //REMOVE LATER
                cardOnDots.dot3Bool = true
            }
            //Getting the cardname /number of point 3 end
            if sideMenuData.showPointSet2 == true {
                //Getting the cardname /number of point 4
                if self.xdragAmount == dotPlacementOnX /*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY + yoffset2 && isShowingCard
                {
                    
                    cardOnDots.cardOnDot4 = self.card.front //gets me the card number to be changed to the card name.
                    print("test4 \(cardOnDots.cardOnDot4)") //REMOVE LATER
                    cardOnDots.dot4Bool = true
                }
                //Getting the cardname /number of point 4 end
                //Getting the cardname /number of point 5
                if self.xdragAmount == dotPlacementOnX /*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY - yoffset2 && isShowingCard
                {
                    
                    cardOnDots.cardOnDot5 = self.card.front //gets me the card number to be changed to the card name.
                    print("test5 \(cardOnDots.cardOnDot5)") //REMOVE LATER
                    cardOnDots.dot5Bool = true
                }
                //Getting the cardname /number of point 5 end
            }
            if sideMenuData.showPointSet3 == true {
                //Getting the cardname /number of point 6
                if self.xdragAmount == dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY + yoffset3 && isShowingCard
                {
                    
                    cardOnDots.cardOnDot6 = self.card.front //gets me the card number to be changed to the card name.
                    print("test6 \(cardOnDots.cardOnDot6)") //REMOVE LATER
                    cardOnDots.dot6Bool = true
                }
                //Getting the cardname /number of point 6 end
                
                //Getting the cardname /number of point 7
                if self.xdragAmount == dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY && isShowingCard
                {
                    
                    cardOnDots.cardOnDot7 = self.card.front //gets me the card number to be changed to the card name.
                    print("test7 \(cardOnDots.cardOnDot7)") //REMOVE LATER
                    cardOnDots.dot7Bool = true
                }
                //Getting the cardname /number of point 7 end
                
                //Getting the cardname /number of point 8
                if self.xdragAmount == dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY - yoffset3 && isShowingCard
                {
                    
                    cardOnDots.cardOnDot8 = self.card.front //gets me the card number to be changed to the card name.
                    print("test8 \(cardOnDots.cardOnDot8)") //REMOVE LATER
                    cardOnDots.dot8Bool = true
                }
                //Getting the cardname /number of point 8 end
                
                //Getting the cardname /number of point 9
                if self.xdragAmount == dotPlacementOnX + xoffset3/*add xOffset*/ - (28 * offsetBack) && self.ydragAmount == dotPlacementOnY - (yoffset3*2) && isShowingCard
                {
                    
                    cardOnDots.cardOnDot9 = self.card.front //gets me the card number to be changed to the card name.
                    print("test9 \(cardOnDots.cardOnDot9)") //prints: test Optional(13)
                    cardOnDots.dot9Bool = true
                }
                //Getting the cardname /number of point 9 end
            }
            
            //getting cardname on tap ends
            
        }
        
        .onLongPressGesture(minimumDuration: 0.8, pressing: { pressing in
            if isShowingCard {
                if pressing {
                    startTimer() //missing if statement to work only when the image is showing the front
                } else {
                    stopTimer()
                }
            }
            
            if cardIndex.zInd < cardIndex.zVar {
                cardIndex.zInd += 1 // sets the zInd of the touched card
            }
            else if cardIndex.zInd > cardIndex.zVar{
                cardIndex.zVar += 1// sets the zInd of the touched card
            }
            cardIndex.zInd = cardIndex.zVar // sets the zInd of the touched card
            print(cardIndex.zInd)
            print("width: \(imageSize.width), Height: \(imageSize.height)")
            zIndVal = cardIndex.zInd // sets the zInd of the touched card
            if cardIndex.zVar == cardIndex.zInd {
                cardIndex.zInd += 1 // sets the zInd of the touched card
            }
            cardIndex.zVar += 2
            
        }) {
            
        }
        .overlay(showCardDetail ? ZStack{
            
                Image(cardIndex.cardSet+String(card.front)
                )
                .resizable().scaledToFit()
                //.cornerRadius(10) //taking out cornerRadius. the image of the cards should already have rounded corners.
                .frame(width: 500)
                .offset(x: -(28 * offsetBack), y: 0)
                .presentationBackground(Color.clear)
            }.animation(.easeInOut(duration: 0.3), value: showCardDetail).zIndex(100)
                 
            //.offset(x: -(28 * offsetBack), y: 0)
                 : nil)
        //.offset(x: -(28 * offsetBack), y: 0)
        /*.fullScreenCover(isPresented: $showCardDetail) {
            ZStack {
                Image(cardIndex.cardSet+String(card.front)).resizable().scaledToFit().cornerRadius(10).frame(width: 500).presentationBackground(Color.clear)
            }
        }*/ //Changed .fullScreenCover/.sheet() to .overlay so the image can appear in the center of the screen instead of coming up from the bottom.
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
            showCardDetail = true
        }
    }
    
    // Stop the timer and hide the sheet immediately
    func stopTimer() {
        timer?.invalidate()
        showCardDetail = false
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
            .environmentObject(ArrayData())
                .environmentObject(SideMenuData())
                .environmentObject(CardOnDots())//This allows the preview to load by been able to read the environmentObject
    }
}


