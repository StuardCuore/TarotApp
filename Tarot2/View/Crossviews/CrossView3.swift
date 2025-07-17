//
//  CrossView.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//


import SwiftUI


// placement of the magnetic points.
// this needs to be more dinamic for different screen sizes

struct CrossView3: View {
    
    @State private var xPlacement1: CGFloat = UIScreen.main.bounds.width/2
    @State private var yPlacement1: CGFloat = UIScreen.main.bounds.height/1.93
    
    
    @State var xoffset3 : CGFloat = 130
    @State var yoffset3 : CGFloat = 200     // 1
    @State var x2offset3 : CGFloat = 260
    @State var y2offset3 : CGFloat = 195    // 2 solo se esta usando este
    @State var y3offset3 : CGFloat = 0      // 3
    
    var body: some View {
        ZStack{
            //1st magnetic point
            /*Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: +xoffset3, y: 0) //250 should be stored in a variable so it can be changed to fit different screens and to be applied inside the CardView file.
            // 2nd magnetic point
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: 0, y: 0)
            //3rd magnetic point
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: -xoffset3, y: 0)
            //4rd magnetic point
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: 0, y: +yoffset3)
            //5rd magnetic point
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: 0, y: -yoffset3)*/
            //
            //6rd magnetic point bottom
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: x2offset3, y: y2offset3) //195
            //7rd magnetic point bottom
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: x2offset3, y: 0)
            //8rd magnetic point bottom
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: x2offset3, y: -(y2offset3)) // -195
            //9rd magnetic point bottom
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: x2offset3, y: (y2offset3 * 2)) // -(195*2) //-(y2offset3 * 2))
            
            //
            
            
        }
    }
}

struct CrossView3_Previews: PreviewProvider {
    static var previews: some View {
        CrossView3().environmentObject(ArrayData())
    }
}
