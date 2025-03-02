//
//  CrossView.swift
//  Tarot2
//
//  Created by stuard bolaños on 01/03/25.
//


import SwiftUI



struct CrossView: View {
    
    @State private var xPlacement1: CGFloat = UIScreen.main.bounds.width/2
    
    @State private var yPlacement1: CGFloat = UIScreen.main.bounds.height/1.5
    
    var body: some View {
        ZStack{
            
            Image(systemName: "circle.dotted").position(x: self.xPlacement1 + 250, y: self.yPlacement1)
            Image(systemName: "circle.dotted")
                .position(x: self.xPlacement1, y: self.yPlacement1)
                .offset(x: 0, y: 0)
            Image(systemName: "circle.dotted").position(x: self.xPlacement1 - 250, y: self.yPlacement1)
            
            
        }
    }
}

struct CrossView_Previews: PreviewProvider {
    static var previews: some View {
        CrossView()
    }
}
