//
//  SideMenu.swift
//  Tarot2
//
//  Created by stuard bolaños on 05/03/25.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var cardIndex: NumArray
    @EnvironmentObject var sideMenuData: SideMenuData
    @State private var isExpanded = false
    @State private var isCardMenuExpanded = false
    @State private var isPointMenuExpanded = false
    
    @Binding var isMenuVisible: Bool
    
    
    var body: some View {
        ZStack {
            // Background overlay to detect taps outside the menu
            if isMenuVisible {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isMenuVisible = false  // Hide the menu when tapped outside
                        }
                    }
            }
            HStack {
                
                List {
                    Section(header: Text("Setttings")) {
                        DisclosureGroup("Settings", isExpanded: $isCardMenuExpanded) {
                            //disclsureGround is what takes the buttons inside the expansive group.
                            ForEach(CardProfile.data, id:\.self) {profile in
                                
                                //
                                
                                Button {
                                    // activates the view for each card. this is fetched from CardProfile file,
                                    //cardIndex.cardSet = profile.name
                                    cardIndex.cardBack = profile.image
                                    
                                } label: {
                                    Image(profile.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill).frame(width: 45, height:45).cornerRadius(30)
                                }
                                //
                            }
                        }
                        DisclosureGroup("Select Placement Set", isExpanded: $isPointMenuExpanded) {
                            //
                            Button {
                                sideMenuData.showPointSet2 = false
                                sideMenuData.showPointSet3 = false
                                //deactivates the second and third magnetic points
                            } label: {
                                Image(systemName: "ellipsis.circle").resizable().aspectRatio(contentMode: .fill).frame(width: 45, height:45).foregroundColor(Color.black)
                            }
                            Button {
                                sideMenuData.showPointSet2 = true
                                
                                sideMenuData.showPointSet3 = false
                                //activates the second set of magnetic points
                            } label: {
                                Image(systemName: "squareshape.split.2x2.dotted")
                                    .resizable().aspectRatio(contentMode: .fill).frame(width: 45, height:45).foregroundColor(Color.black)
                            }
                            Button {
                                sideMenuData.showPointSet3 = false
                                sideMenuData.showPointSet3 = true
                                //activates the third set of magnetic points
                            } label: {
                                Image(systemName: "ellipsis.circle.fill").resizable().aspectRatio(contentMode: .fill).frame(width: 45, height: 45).rotationEffect(Angle(degrees: 90)).foregroundColor(Color.black)
                            }
                            //
                        }
                    }
                    //}
                    
                    
                    /*
                     ZStack(alignment: .leading) {
                     
                     //RoundedRectangle(cornerRadius: 20)
                     //(Color.white).opacity(0.4)
                     VStack(alignment: .leading) {
                     //List{
                     ForEach(CardProfile.data, id:\.self) {profile in
                     HStack{
                     //
                     Spacer()
                     //ZStack{
                     Button {
                     // activates the view for each card. this is fetched from CardProfile file,
                     //cardIndex.cardSet = profile.name
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
                     }.background(Color.gray.opacity(0.5)) //backgroung for each individual button
                     .clipShape(RoundedRectangle(cornerRadius: 40))
                     }
                     
                     //.scrollContentBackground(.hidden) // Hides the default background
                     //.background(Color.gray).opacity(0.8) // Set custom background color
                     }.background(Color.clear) //background for the whole forEach block
                     .frame(width: 240)
                     HStack {
                     VStack {
                     Button {} label: {
                     Image(systemName: "ellipsis.rectangle")
                     .resizable()
                     .aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(30)
                     .padding(10)
                     }
                     Button {} label: {
                     Image(systemName: "squareshape.split.2x2.dotted") //arreglar que se pongan donde yo quiero!!!!!!!!!!!!!!!!!!!
                     .resizable()
                     .aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(30)
                     .padding(10)
                     }
                     Button {} label: {
                     Image(systemName: "ellipsis")
                     .resizable()
                     .aspectRatio(contentMode: .fill).frame(width: 60, height:60).cornerRadius(30)
                     .padding(10)
                     }
                     }
                     }.background(Color.gray.opacity(0.5)) //backgroung for each individual button
                     .clipShape(RoundedRectangle(cornerRadius: 40))
                     }.frame(width: 240)//.background(Color.clear).cornerRadius(50) // background that goes from the top to the bottom
                     //.edgesIgnoringSafeArea(.all)
                     
                     */
                }.frame(width: 300)
                    .transition(.move(edge: .leading))
                Spacer()  // Pushes menu to the left
            }
        }
    }
}

/*
 #Preview {
 SideMenuView().environmentObject(NumArray())
 }
 */
