//
//  ContentView.swift
//  BlogueSwiftUI
//
//  Created by Yassine Ben-khayat on 2025-02-15.
//

import SwiftUI

struct ChatonVue: View {
    var body: some View {
        NavigationView{
            VStack{
                VueCercleTemplate(couleur: Color(hue: 0.516, saturation: 1.0, brightness: 1.0), nomImage: "kitten2")
                    .navigationTitle("Chaton")
                    .offset(y: -60)
                
                NavigationLink(destination: ChienVue(), label: {
                    Text("Chien")
                        .bold().frame(width: 280, height: 50)
                        .background(Color .blue)
                        .foregroundColor(.white).cornerRadius(10)
                })
            }
        }.accentColor(Color(.label))
    }
}

struct ChienVue: View {
    var body: some View {
        VStack{
            VueCercleTemplate(couleur: Color .yellow, nomImage: "chien3")
                .navigationTitle("Chien")
                .offset(y: -60)
            
            NavigationLink(destination: HamsterVue(), label: {
                Text("Hamster")
                    .bold().frame(width: 280, height: 50)
                    .background(Color .orange)
                    .foregroundColor(.white).cornerRadius(10)
            })
        }
    }
}


struct HamsterVue: View {
    var body: some View {
        VStack{
            VueCercleTemplate(couleur: Color .gray, nomImage: "hamster2")
                .navigationTitle("Hamster")
                .offset(y: -60)
        }
    }
}



struct VueCercleTemplate: View {
    var couleur : Color
    var nomImage : String
    
    var body: some View{
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(couleur)
            Image(nomImage)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .clipShape(.circle)
        }
    }
}

#Preview {
    ChatonVue()
}
