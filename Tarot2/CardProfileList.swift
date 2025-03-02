//
//  CardProfileList.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//

import SwiftUI

struct CardProfileList: View {
    var body: some View {
        List{
            ForEach(CardProfile.data, id:\.self) {profile in
                HStack{
                    Spacer()
                    ZStack{
                        // detonat cual imagen está activada. probablemente cambiár a BOTON.
                        Button {
                            
                            
                            //
                            //
                            //activar su carta.
                            //
                            //
                            
                            
                        } label: {
                            Image(profile.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(30)
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

