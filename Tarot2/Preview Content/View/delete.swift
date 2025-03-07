//
//  delete.swift
//  Tarot2
//
//  Created by stuard bolaños on 05/03/25.
//

import SwiftUI

struct SideMenuView2: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Menu Item 1")
            Text("Menu Item 2")
            Text("Menu Item 3")
            Spacer()
        }
        .frame(width: 250)
        .background(Color.gray.opacity(0.9))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView2: View {
    @State private var isMenuOpen = false
    
    var body: some View {
        ZStack {
            // Main content
            VStack {
                Button("Toggle Menu") {
                    withAnimation {
                        isMenuOpen.toggle()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
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
            )
            // Side Menu
            SideMenuView()
                .offset(x: isMenuOpen ? 0 : -533) //-533 is what completely hides the side menu
                .animation(.easeInOut, value: isMenuOpen)
            // Dimmed background when menu is open
            if isMenuOpen {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isMenuOpen = false
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
