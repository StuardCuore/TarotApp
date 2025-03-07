//
//  SideMenu.swift
//  Tarot2
//
//  Created by stuard bolaños on 05/03/25.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        //
        VStack(alignment: .leading) {
            List{
                ForEach(CardProfile.data, id:\.self) {profile in
                    HStack{ //
                        Spacer()
                        //ZStack{
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
                                    .aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(30)//.aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(0)
                            }
                            //Circle().background(.gray).frame(width: 70, height:70).cornerRadius(35)
                            
                           //
                        //}
                    }
                }
            }
            
            //
                    /*Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                    Spacer()*/
            
            //
                }
                .frame(width: 300)
                //.background(Color.gray.opacity(0.9))
                //.edgesIgnoringSafeArea(.all)
        
        //
    }
}

#Preview {
    SideMenuView()
}
