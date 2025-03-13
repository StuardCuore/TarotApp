//
//  CrossView.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//


import SwiftUI


// placement of the magnetic points.
// this needs to be more dinamic for different screen sizes
struct CrossView: View {
    
    @State var xPlacement1: CGFloat = UIScreen.main.bounds.width/2
    @State var yPlacement1: CGFloat = UIScreen.main.bounds.height/1.45
    
    @State var xoffset1 : CGFloat = 130
    @State var yoffset1 : CGFloat = 0
    
    var body: some View {
        ZStack{
            //1st magnetic point
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: +xoffset1, y: yoffset1) //250 should be stored in a variable so it can be changed to fit different screens and to be applied inside the CardView file.
            // 2nd magnetic point
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: 0, y: 0)
            //3rd magnetic point
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: -xoffset1, y: yoffset1)
        }
    }
}

struct CrossView_Previews: PreviewProvider {
    static var previews: some View {
        CrossView()
    }
}
