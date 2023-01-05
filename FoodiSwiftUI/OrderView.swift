//
//  OrderView.swift
//  FoodiSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 04/01/2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        
        if order.items.isEmpty{
            Text("NO Items Added Yet")
                .fontWeight(.bold)
        } else{
            NavigationStack{
                List{
                    Section{
                        ForEach(order.items){ item in
                            HStack{
                                Text(item.name)
                                Spacer()
                                Text("$\(item.price)")
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    Section{
                        NavigationLink("Place Order"){
                            CheckOutView()
                        }
                    }
                    .navigationTitle("Order")
                    .toolbar {
                        EditButton()
                    }
                }
            }
        }
    }
    func deleteItems(at offsets : IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
