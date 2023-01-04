//
//  itemView.swift
//  FoodiSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 04/01/2023.
//

import SwiftUI

struct itemView: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item : MenuItem
    var body: some View {
        HStack{
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray , lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
         Spacer()
            ForEach(item.restrictions , id : \.self){ restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .foregroundColor(.white)
                    .background(colors[restriction])
                    .clipShape(Circle())
            }
        }
    }
}

struct itemView_Previews: PreviewProvider {
    static var previews: some View {
        itemView(item: MenuItem.example)
    }
}
