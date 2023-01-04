//
//  DetailView.swift
//  FoodiSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 04/01/2023.
//

import SwiftUI

struct DetailView: View {
    let item : MenuItem
    
    var body: some View {
        VStack{
            Image(item.mainImage)
               
            Text(item.description)
                .padding()
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DetailView(item: MenuItem.example)
        }
    }
}
