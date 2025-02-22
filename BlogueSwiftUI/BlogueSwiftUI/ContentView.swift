//
//  ContentView.swift
//  BlogueSwiftUI
//
//  Created by Yassine Ben-khayat on 2025-02-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom){
            Image("john")
                .resizable()
                .scaledToFit()
            HStack{
                VStack(alignment: .leading){
                    Text("John Dump").bold()
                    
                    Text("Étudiant au collège de Rosemont")
                    
                }
                Spacer()
                
            }
            .padding()
            .foregroundStyle(.primary)
            .background(Color.primary.colorInvert().opacity(0.80))
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
