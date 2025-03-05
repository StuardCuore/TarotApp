//
//  Untitled.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

//
//  PruebaCard.swift
//  Tarot.app
//
//  Created by stuard bolaños on 19/09/23.
//

import SwiftUI


var tarArray = [1,2,3,4,5]



/*FIRST TRY TO GET THE TOUCHED CARD ABOVE THE OTHERS. SHOULD DELETE FILE.*/

struct PruebaCard: View {
    
    var body: some View {
        HStack{
            
            //tarArray.shuffle
            Text(String(tarArray[0]))
        }
    }
    
    /*@EnvironmentObject var cardIndex: NumArray
     
     @State var zInd: Double = 1
     @State var zVar: Double = 1
     @State var zIndSetter  = false
     @State var zIndVal1: Double = 0
     @State var zIndVal2: Double = 0
     
     
     @State private var cards = [Card(front: 1),Card(front: 2),
     Card(front: 3),Card(front: 4)]
     
     
     
     
     @State private var xdragAmount: CGFloat = UIScreen.main.bounds.width/2
     @State private var ydragAmount: CGFloat = UIScreen.main.bounds.height/2
     
     
     @GestureState var locationState = CGPoint(x: 100, y: 100)
     @State var location = CGPoint(x:100, y:100)
     
     
     
     var body: some View {
     
     
     ZStack{
     /*HStack{
      
      CardView(card: cards[2])
      //Rectangle().fill(Color(.red))
      .frame(width:125, height: 200)
      .position(x: self.xdragAmount, y: self.ydragAmount)
      
      .gesture(
      DragGesture()
      
      .onChanged({value in
      
      self.xdragAmount = value.location.x
      self.ydragAmount = value.location.y
      if zInd < zVar {
      zInd += 1
      }
      else if zInd > zVar{
      zVar += 1
      }
      zIndVal1 = zInd
      zIndSetter = true
      zInd = zVar
      print(zInd)
      
      })
      .onEnded({value in
      if zVar == zInd {
      zInd += 1
      }
      zIndSetter = false
      zVar += 2
      print(zInd)
      print(zIndVal1)
      })
      )
      }
      .zIndex(
      zIndVal1
      )
      HStack{
      CardView(card: cards[1])
      //Circle().fill(.blue)
      .frame(width:125, height: 200)
      .position(location)
      
      .gesture(DragGesture()
      
      .onChanged{state in location = state.location
      
      if zInd < zVar {
      zInd += 1
      }
      else if zInd > zVar{
      zVar += 1
      }
      zIndVal2 = zInd
      zInd = zVar
      print(zInd)
      }
      .onEnded({value in
      if zVar == zInd {
      zInd += 1
      }
      zIndSetter = true
      zVar += 2
      print(zInd)
      })
      .updating($locationState){
      currentState, pastLocation, transaction in pastLocation = currentState.location
      }
      )
      
      }.zIndex(zIndVal2)*/
     
     
     HStack{
     
     CardView(card: cards[2])
     //Rectangle().fill(Color(.red))
     //Image("card1").resizable().aspectRatio(contentMode: .fit)
     .frame(width:125, height: 200)
     //.position(x: self.xdragAmount, y: self.ydragAmount)
     /*.zIndex(
      //zIndSetter == true ? 2 : 0
      zIndVal1
      )*/
     .gesture(
     DragGesture()
     .onChanged({value in
     //EL PROBLEMA ESTA EN .gesture...onChanged EL DE UNA VISTA ESTÁ CANCELANDO AL OTRO.
     //self.xdragAmount = value.location.x
     //self.ydragAmount = value.location.y
     if zInd < zVar {
     zInd += 1
     }
     else if zInd > zVar{
     zVar += 1
     }
     zIndVal1 = zInd
     zIndSetter = true
     zInd = zVar
     //print(zInd)
     
     })
     .onEnded({value in
     if zVar == zInd {
     zInd += 1
     }
     zIndSetter = false
     zVar += 2
     //print(zInd)
     //print(zIndVal1)
     })
     )
     
     //CardView(card: cards[1])
     //Circle().fill(.blue)
     Image("card2").resizable().aspectRatio(contentMode: .fit)
     .frame(width:125, height: 200)
     .position(location)
     .zIndex(zIndVal2)
     
     .gesture(DragGesture()
     
     .onChanged{state in location = state.location
     
     if zInd < zVar {
     zInd += 1
     }
     else if zInd > zVar{
     zVar += 1
     }
     zIndVal2 = zInd
     zInd = zVar
     print(zInd)
     }
     .onEnded({value in
     if zVar == zInd {
     zInd += 1
     }
     zIndSetter = true
     zVar += 2
     print(zInd)
     })
     .updating($locationState){
     currentState, pastLocation, transaction in pastLocation = currentState.location
     }
     )
     
     }
     
     }
     }
     
     }*/
    
}

struct PruebaCard_Previews: PreviewProvider {
    static var previews: some View {
        PruebaCard()
    }
}
