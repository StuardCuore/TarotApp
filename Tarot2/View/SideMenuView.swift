//
//  SideMenu.swift
//  Tarot2
//
//  Created by stuard bolaños on 05/03/25.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var cardIndex: NumArray
    
    var body: some View {
        //
        
        
        VStack(alignment: .leading) {
            //List{
                ForEach(CardProfile.data, id:\.self) {profile in
                    HStack{
                        //
                        Spacer()
                        //ZStack{
                        // detona cual imagen está activada. probablemente cambiár a BOTON.
                        Button {
                            // activates the view for each card. this is fetch from CardProfile file,
                            cardIndex.cardSet = profile.name
                            cardIndex.cardBack = profile.image
                            
                            
                        } label: {
                            Image(profile.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(30)
                                .padding(10)
                            //.aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(0)
                        }
                        
                        //Circle().background(.gray).frame(width: 70, height:70).cornerRadius(35)
                        
                        //
                        //}
                    }.background(Color.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                }
            /*}
            .scrollContentBackground(.hidden) // Hides the default background
            //.background(Color.gray).opacity(0.8) // Set custom background color
            */
           
        }//.background(Color.blue.opacity(0.5))
        .frame(width: 120)
        
        //.background(Color.blue.opacity(0.9))
        //.edgesIgnoringSafeArea(.all)
        
        //
    }
}


#Preview {
    SideMenuView()
}
