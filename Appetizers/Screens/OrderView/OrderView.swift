//
//  OrderView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI
import SwiftData

struct OrderView: View {
    
    @Query var orders: [Order]
    @Environment(\.modelContext) var context
    @Bindable var viewModel = OrderViewModel()
    
    var body: some View {
        if orders.isEmpty {
            EmptyOrderView()
        }
        else{
            ZStack{
                NavigationStack{
                    VStack{
                        List(){
                            ForEach(orders){appetizer in
                                OrderListCell(order: appetizer)
                                    .onTapGesture {
                                        viewModel.selectedOrder = appetizer
                                        viewModel.isShowingDetail = true
                                    }
                            }
                            .onDelete{ indexSet in
                                for index in indexSet{
                                    context.delete(orders[index])
                                }
                            }
                        }
                        .listStyle(InsetListStyle())
                        Spacer()
                        APButton(title: "$\(viewModel.calculateTotalCost(orders: orders),specifier: "%.2f") - Place Order")
                            .padding(.bottom)
                    }
                    .disabled(viewModel.isShowingDetail)
                    .navigationTitle("Order")
                }
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
                if viewModel.isShowingDetail{
                    OrderDetailView(order: viewModel.selectedOrder!, isShowingDetail: $viewModel.isShowingDetail)
                }
            }
        }
    }
}

#Preview {
    OrderView()
}
struct EmptyOrderView:View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("empty-order")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150,height: 150)
                Text("No Orders")
                    .foregroundStyle(.secondary)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .fontWeight(.semibold)
                    .navigationTitle("Order")
                    .padding()
            }
            .offset(y:-50)
            
        }
    }
}
