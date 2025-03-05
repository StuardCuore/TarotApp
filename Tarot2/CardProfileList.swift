//
//  CardProfileList.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import SwiftUI

//circle back to this after rearranging the files in MVC
//This view is to be shown when wanting to change the card appearance
//This is a view that is not activated at the moment hence the button has no actions.

struct CardProfileList: View {
    var body: some View {
        List{
            ForEach(CardProfile.data, id:\.self) {profile in
                HStack{
                    Spacer()
                    ZStack{
                        // detona cual imagen está activada. probablemente cambiár a BOTON.
                        Button {
                            
                            
                            //
                            //
                            //activar su carta.
                            //
                            //
                            
                            
                        } label: {
                            Image(profile.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(0)//.aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(0)
                        }
                        //Circle().background(.gray).frame(width: 70, height:70).cornerRadius(35)
                        
                       
                    }
                }
            }
        }
    }
}

struct CardProfileList_Previews: PreviewProvider {
    static var previews: some View {
        CardProfileList()
    }
}

