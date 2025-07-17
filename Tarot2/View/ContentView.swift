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
    @EnvironmentObject var cardOnDots: CardOnDots
    @State var showSpreadedCards = true
    @State var startView = true
    @State private var isMenuOpen = false
    @State var showCardDetail: Bool = false
    @State var card1 = ""
    @State var card2 = ""
    @State var card3 = ""
    @State var card4 = ""
    @State var card5 = ""
    @State var card6 = ""
    @State var card7 = ""
    @State var card8 = ""
    @State var card9 = ""
    @State var geminiInput: String = ""
    @State private var showingSheet = false
    
    
    
    
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
                                    .padding(45)
                                    Spacer()
                                    
                                    //Test
                                    //if to activate tarot reading button
                                    //if for dot set 1 (3 dots)
                                    if cardOnDots.dot1Bool &&
                                        cardOnDots.dot2Bool &&
                                        cardOnDots.dot3Bool &&
                                        sideMenuData.showPointSet2 == false
                                    {
                                    Button {
                                        
                                        //THIS VARIABLES SHOULD BE RESESTED WITH THE RESET BUTTON.
                                        if let readDot1 = cardOnDots.cardOnDot1 {
                                            if let text = CardIDToText(rawValue: readDot1) {
                                                card1 = text.description
                                            }
                                            
                                            print("DOT READED \(card1)")
                                        }
                                        
                                        
                                        if let readDot2 = cardOnDots.cardOnDot2 {
                                            if let text = CardIDToText(rawValue: readDot2) {
                                                card2 = text.description
                                            }
                                            
                                            print("DOT READED \(card2)")
                                        }
                                        
                                        if let readDot3 = cardOnDots.cardOnDot3 {
                                            if let text = CardIDToText(rawValue: readDot3) {
                                                card3 = text.description
                                            }
                                            
                                            print("DOT READED \(card3)")
                                        }
                                        
                                        geminiInput = cardOnDots.TarotReading3Dots(card1, card2, card3)
                                        print(geminiInput)
                                        //gemini generative AI request
                                        
                                        //TAKE OUT THE COMMENT TO START GEMINI
                                        /*Task {
                                         do {
                                         let response = try await model.generateContent(
                                         "Write a short story about a futuristic city within one parragraph."
                                         //geminiInput
                                         //cambiar cuando se compre el apple dev kit para poder pasar el AppCheck en firebase.
                                         )
                                         if let text = response.text {
                                         print(text)
                                         }
                                         } catch {
                                         print("Error generating content: \(error.localizedDescription)")
                                         }
                                         }*/
                                        
                                        //gemini generative AI request end
                                        
                                        showingSheet = true
                                    } label: {
                                        Image("Magic Ball").resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                            .frame(width: 120, height: 120)
                                            .background(
                                                Circle()
                                                    .fill(.white.opacity(0.15)))
                                            .shadow(radius: 10)
                                            .foregroundColor(.black)
                                    }.padding(30)
                                            .sheet(isPresented: $showingSheet) {
                                                        // This is the content of your sheet
                                                        TarotReadView(showingSheet: $showingSheet)
                                                    }
                                }
                                    else if cardOnDots.dot1Bool &&
                                                cardOnDots.dot2Bool &&
                                                cardOnDots.dot3Bool && cardOnDots.dot4Bool &&
                                                cardOnDots.dot5Bool &&
                                                sideMenuData.showPointSet2 == true && sideMenuData.showPointSet3 == false
                                    {
                                        Button {
                                            
                                            //THIS VARIABLES SHOULD BE RESESTED WITH THE RESET BUTTON.
                                            if let readDot1 = cardOnDots.cardOnDot1 {
                                                if let text = CardIDToText(rawValue: readDot1) {
                                                    card1 = text.description
                                                }
                                                
                                                print("DOT READED \(card1)")
                                            }
                                            
                                            
                                            if let readDot2 = cardOnDots.cardOnDot2 {
                                                if let text = CardIDToText(rawValue: readDot2) {
                                                    card2 = text.description
                                                }
                                                
                                                print("DOT READED \(card2)")
                                            }
                                            
                                            if let readDot3 = cardOnDots.cardOnDot3 {
                                                if let text = CardIDToText(rawValue: readDot3) {
                                                    card3 = text.description
                                                }
                                                
                                                print("DOT READED \(card3)")
                                            }
                                            
                                            if let readDot4 = cardOnDots.cardOnDot4 {
                                                if let text = CardIDToText(rawValue: readDot4) {
                                                    card4 = text.description
                                                }
                                                
                                                print("DOT READED \(card4)")
                                            }
                                            if let readDot5 = cardOnDots.cardOnDot5 {
                                                if let text = CardIDToText(rawValue: readDot5) {
                                                    card5 = text.description
                                                }
                                                
                                                print("DOT READED \(card5)")
                                            }
                                            
                                            
                                            
                                            geminiInput = cardOnDots.TarotReading3Dots(card1, card2, card3)
                                            print(geminiInput)
                                            //gemini generative AI request
                                            
                                            //TAKE OUT THE COMMENT TO START GEMINI
                                            /*Task {
                                             do {
                                             let response = try await model.generateContent(
                                             "Write a short story about a futuristic city within one parragraph."
                                             //geminiInput
                                             //cambiar cuando se compre el apple dev kit para poder pasar el AppCheck en firebase.
                                             )
                                             if let text = response.text {
                                             print(text)
                                             }
                                             } catch {
                                             print("Error generating content: \(error.localizedDescription)")
                                             }
                                             }*/
                                            
                                            //gemini generative AI request end
                                            showingSheet = true
                                        } label: {
                                            Image("Magic Ball").resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding()
                                                .frame(width: 120, height: 120)
                                                .background(
                                                    Circle()
                                                        .fill(.white.opacity(0.15)))
                                                .shadow(radius: 10)
                                                .foregroundColor(.black)
                                        }.padding(30)
                                            .sheet(isPresented: $showingSheet) {
                                                        // This is the content of your sheet
                                                        TarotReadView(showingSheet: $showingSheet)
                                                    }
                                    }
                                    else if cardOnDots.dot1Bool &&
                                                cardOnDots.dot2Bool &&
                                                cardOnDots.dot3Bool &&
                                                cardOnDots.dot4Bool &&
                                                cardOnDots.dot5Bool &&
                                                cardOnDots.dot6Bool &&
                                                cardOnDots.dot7Bool &&
                                                cardOnDots.dot8Bool &&
                                                cardOnDots.dot9Bool &&
                                                sideMenuData.showPointSet2 == true && sideMenuData.showPointSet3 == true
                                    {
                                        Button {
                                            
                                            //THIS VARIABLES SHOULD BE RESESTED WITH THE RESET BUTTON.
                                            if let readDot1 = cardOnDots.cardOnDot1 {
                                                if let text = CardIDToText(rawValue: readDot1) {
                                                    card1 = text.description
                                                }
                                                
                                                print("DOT READED \(card1)")
                                            }
                                            
                                            
                                            if let readDot2 = cardOnDots.cardOnDot2 {
                                                if let text = CardIDToText(rawValue: readDot2) {
                                                    card2 = text.description
                                                }
                                                
                                                print("DOT READED \(card2)")
                                            }
                                            
                                            if let readDot3 = cardOnDots.cardOnDot3 {
                                                if let text = CardIDToText(rawValue: readDot3) {
                                                    card3 = text.description
                                                }
                                                
                                                print("DOT READED \(card3)")
                                            }
                                            
                                            if let readDot4 = cardOnDots.cardOnDot4 {
                                                if let text = CardIDToText(rawValue: readDot4) {
                                                    card4 = text.description
                                                }
                                                
                                                print("DOT READED \(card4)")
                                            }
                                            if let readDot5 = cardOnDots.cardOnDot5 {
                                                if let text = CardIDToText(rawValue: readDot5) {
                                                    card5 = text.description
                                                }
                                                
                                                print("DOT READED \(card5)")
                                            }
                                            if let readDot6 = cardOnDots.cardOnDot6 {
                                                if let text = CardIDToText(rawValue: readDot6) {
                                                    card6 = text.description
                                                }
                                                
                                                print("DOT READED \(card6)")
                                            }
                                            if let readDot7 = cardOnDots.cardOnDot7 {
                                                if let text = CardIDToText(rawValue: readDot7) {
                                                    card7 = text.description
                                                }
                                                
                                                print("DOT READED \(card7)")
                                            }
                                            if let readDot8 = cardOnDots.cardOnDot8 {
                                                if let text = CardIDToText(rawValue: readDot8) {
                                                    card8 = text.description
                                                }
                                                
                                                print("DOT READED \(card8)")
                                            }
                                            if let readDot9 = cardOnDots.cardOnDot9 {
                                                if let text = CardIDToText(rawValue: readDot9) {
                                                    card9 = text.description
                                                }
                                                
                                                print("DOT READED \(card9)")
                                            }
                                            
                                            
                                            
                                            geminiInput = cardOnDots.TarotReading3Dots(card1, card2, card3)
                                            print(geminiInput)
                                            //gemini generative AI request
                                            
                                            //TAKE OUT THE COMMENT TO START GEMINI
                                            /*Task {
                                             do {
                                             let response = try await model.generateContent(
                                             "Write a short story about a futuristic city within one parragraph."
                                             //geminiInput
                                             //cambiar cuando se compre el apple dev kit para poder pasar el AppCheck en firebase.
                                             )
                                             if let text = response.text {
                                             print(text)
                                             }
                                             } catch {
                                             print("Error generating content: \(error.localizedDescription)")
                                             }
                                             }*/
                                            
                                            //gemini generative AI request end
                                            showingSheet = true
                                        } label: {
                                            Image("Magic Ball").resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .padding()
                                                .frame(width: 120, height: 120)
                                                .background(
                                                    Circle()
                                                        .fill(.white.opacity(0.15)))
                                                .shadow(radius: 10)
                                                .foregroundColor(.black)
                                        }.padding(30).sheet(isPresented: $showingSheet) {
                                            // This is the content of your sheet
                                            TarotReadView(showingSheet: $showingSheet)
                                        }
                                    }
                                    //checkpoint
                                    //test
                                    Spacer()
                                    Button { //reset button
                                        showSpreadedCards.toggle()
                                        cards = shuffleCardArray()
                                        
                                        cardIndex.resetShuffleCards(cards: cards) // func to reset the cards. it takes the parameter to take into acount the new shuffled cards arrangement
                                        
                                        cardOnDots.cardOnDot1 = nil
                                        cardOnDots.cardOnDot2 = nil
                                        cardOnDots.cardOnDot3 = nil
                                        geminiInput = ""
                                        cardOnDots.dot1Bool = false
                                        cardOnDots.dot2Bool = false
                                        cardOnDots.dot3Bool = false
                                        cardOnDots.dot4Bool = false
                                        cardOnDots.dot5Bool = false
                                        cardOnDots.dot6Bool = false
                                        cardOnDots.dot7Bool = false
                                        cardOnDots.dot8Bool = false
                                        cardOnDots.dot9Bool = false
                                        
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
                                    .padding(45)
                                    
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
        ContentView().environmentObject(ArrayData()).environmentObject(SideMenuData()).environmentObject(CardOnDots())
    }
}
