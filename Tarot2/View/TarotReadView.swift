//
//  TarotReadView.swift
//  Tarot2
//
//  Created by stuard bolaños on 16/07/25.
//

import SwiftUI

struct TarotReadView: View {
    @Binding var showingSheet: Bool

    var body: some View {
        NavigationView { // Often good to embed in a NavigationView for a title and dismiss button
            VStack {
                Text("This is a modal sheet!")
                    .font(.title)
                    .padding()
                Button("Dismiss") {
                    showingSheet = false
                }
            }
            .navigationTitle("Sheet Title")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        showingSheet = false
                    }
                }
            }
        }
    }
}

struct TarotReadView_Previews: PreviewProvider {
    static var previews: some View {
        CrossView3().environmentObject(ArrayData())
    }
}
