//
//  ContentView.swift
//  magicsaldo
//
//  Created by una ivan on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var saldo = 1000000
    @State private var isAnimating = false
    @State private var targetSaldo = 1000000

    var saldoFormatted: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        formatter.currencySymbol = "Rp "

        return formatter.string(from: NSNumber(value: saldo)) ?? "Rp 0"
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 6) {
                Text("Current Balance")
                    .font(.system(size: 14))
                Text(saldoFormatted)
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                    .onAppear {
                        // Trigger the animation when the view appears
                        withAnimation {
                            isAnimating = true
                        }
                    }
                    .scaleEffect(isAnimating ? 1.2 : 1.0)
                    .padding(.leading, 20)
                HStack(spacing: 2){
                    Text("on behalf of ")
                        .font(.system(size: 14))
                        .contrast(0.2)
                    
                    Text("John Doe")
                        .font(.system(size: 16))
                }
                Spacer()
            }
            .padding(.top, 12)
            .padding(.leading, 16)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .navigationBarItems(trailing: Button(action: {
                let randomIncrease = Int.random(in: 100000...10000000)
                targetSaldo += randomIncrease

                withAnimation {
                    isAnimating = false
                }
                
                withAnimation {
                    saldo = targetSaldo
                    isAnimating = true
                }
            }) {
                Text("Do Magic")
                    .font(.system(size: 16))
                    .foregroundColor(.red)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
