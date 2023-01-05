//
//  CheckOutView.swift
//  FoodiSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 04/01/2023.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    let payments = ["Cash" , "Credit Card" , "Visa" , "Foodi Points"]
    @State private var payment = "Cash"
    @State private var foodiPoints = false
    @State private var yourFoodiNumber = ""
    let tipsAmount = [10 , 15 , 20 ,25 ,0]
    @State private var tipAmount = 10
    @State private var showPaymentAlert = false
    var totalPrice : String {
        let total = Double(order.total)
        let tip = total / 100 * Double(tipAmount)
        return (total + tip ).formatted(.currency(code: "USD"))
    }
    var body: some View {
        
        Form{
            Section("Payment method"){
                Picker("How do you want to pay?", selection: $payment) {
                    ForEach(payments , id: \.self){
                        Text($0)
                    }
                }

                Toggle("Add your foodi Number?", isOn: $foodiPoints.animation())
                if foodiPoints{
                    TextField("Enter your number", text: $yourFoodiNumber)
                }
            }
            Section("tips amount"){
                Picker("ss", selection: $tipAmount) {
                    ForEach(tipsAmount , id: \.self){
                        Text("\($0)%")
                    }
                }
            }.pickerStyle(.segmented)
            
            Section("Total : \(totalPrice) "){
                Button("Confirm order"){
                    showPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showPaymentAlert) {
            //
        }message: {
            Text("you paid \(totalPrice) , Thank you")
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView()
            .environmentObject(Order())
    }
}
