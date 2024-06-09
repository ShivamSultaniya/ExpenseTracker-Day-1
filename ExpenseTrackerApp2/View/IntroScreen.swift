//
//  IntroScreen.swift
//  ExpenseTrackerApp2
//
//  Created by Shivam Sultaniya on 08/06/24.
//

import SwiftUI

struct IntroScreen: View {
    
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    var body: some View {
        VStack(spacing:15){
            Text("What's New in the\n Expense Tracker")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top,65)
                .padding(.bottom,35)
            
            VStack(alignment:.leading, spacing: 25){
                PointView(symbol:"dollarsign", title: "Transactions", subtitle: "Keep Track of your earnings and expenses")
                PointView(symbol: "chart.bar.fill", title: "Visual Charts", subtitle: "View your Transactions using eye-catching graphic representations")
                PointView(symbol: "magnifyingglass", title: "Advance Filters", subtitle: "Find the expenses you want by advance search and filtering.")
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,15)
            
            Spacer()
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,14)
                    .background(.blue)
                    .cornerRadius(12)
                    .contentShape(.rect)
            })
        }
        .padding(15)
    }
    
    @ViewBuilder
    func PointView(symbol:String, title:String, subtitle:String) -> some View{
        HStack(spacing:20){
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(.blue.gradient)
                .frame(width: 45)
            VStack(alignment:.leading, spacing: 6){
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subtitle)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    IntroScreen()
}
