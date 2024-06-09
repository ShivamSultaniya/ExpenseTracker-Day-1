//
//  Recents.swift
//  ExpenseTrackerApp2
//
//  Created by Shivam Sultaniya on 08/06/24.
//

import SwiftUI

struct Recents: View {
    @AppStorage("userName") private var userName: String = ""
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    @State private var selectedCategory: Category = .expense
    @State private var showFilterView: Bool = false
    
    //FOR ANIMATION
    @Namespace private var animation
    
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]){
                    Section {
                        //Date filter Button
                        Button(action: {
                            showFilterView = true
                        }, label: {
                            Text("\(format(date: startDate, format: "dd - MMM - yy")) to \(format(date: endDate, format: "dd - MMM - yy"))")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        })
                        .hSpacing(.leading)
                        
                        // Card View
                        CardView(income: 10000, expense: 7000)
                        
                        //Custom Segmented Control
                        CustomSegmentedControl()
                            .padding(.bottom,5)
                        
                        //Transaction Cards
                        ForEach(sampleTransactions.filter( { $0.category == selectedCategory.rawValue } )){ transaction in
                            TransactionCardView(transaction: transaction)
                        }
                    } header: {
                        HeaderView()
                    }
                }
                .padding(15)
            }
            .background(.gray.opacity(0.15))
            .blur(radius: showFilterView ? 8:0)
            .disabled(showFilterView)
        }
        .overlay{

                if showFilterView{
                    DateFilterView(start:.now.startOfMonth , end: .now.endOfMonth) { start, end in
                        startDate = start
                        endDate = end
                        showFilterView = false
                    } onClose: {
                        showFilterView = false
                    }
                    .transition(.move(edge: .leading))
                }
            
        }
        .animation(.snappy,value: showFilterView)
    }
    
    @ViewBuilder
    func HeaderView() -> some View{
        
        HStack(spacing:10){
            VStack(alignment: .leading, spacing: 5){
                Text("Welcome")
                    .font(.title.bold())
                
                if !userName.isEmpty{
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            
            
            Spacer()
            
            NavigationLink {
                
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(.blue, in: .circle)
                    .contentShape(.circle)
            }
        }
        .hSpacing(.leading)
        .background{
            Rectangle()
                .fill(.clear)
                .padding(.horizontal,-15)
                .padding(.top,-(safeArea.top + 15))
        }
    }
    
    @ViewBuilder
    func CustomSegmentedControl() -> some View{
        HStack(spacing: 0){
            ForEach(Category.allCases, id: \.rawValue){ category in
                Text(category.rawValue)
                    .hSpacing()
                    .padding(.vertical,10)
                    .background{
                        if category == selectedCategory{
                            Capsule()
                                .fill(.background)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .contentShape(.capsule)
                    .onTapGesture {
                        withAnimation(.snappy){
                            selectedCategory = category
                        }
                    }
            }
        }
        .background(.gray.opacity(0.15), in: .capsule)
        .padding(.top,5)
    }
}

#Preview {
    Recents()
}
