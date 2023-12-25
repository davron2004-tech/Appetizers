//
//  OrderDetailView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import SwiftUI

struct OrderDetailView: View {
    
    @Environment(\.modelContext) var context
    let appetizer:AppetizerDataModel
    @Binding var isShowingDetail:Bool
    
    var body: some View {
        VStack(alignment: .center){
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 225)
            VStack{
                Text(appetizer.name)
                    .fontWeight(.semibold)
                    .font(.title2)
                Text(appetizer.mealDescription)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40){
                    NutritionInfoForOrder(title: "Calories", value: appetizer.calories)
                    NutritionInfoForOrder(title: "Carbs", value: appetizer.carbs)
                    NutritionInfoForOrder(title: "Protein", value: appetizer.protein)
                }
            }
            Spacer()
            Button{
                context.delete(appetizer)
                isShowingDetail = false
            }label: {
                DeleteButton(title: "Remove from orders")
            }
            .padding(.bottom,30)
            
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing){
            Button{
                isShowingDetail = false
            }label: {
                XDismissButton()
            }
        }
    }
}

#Preview {
    OrderDetailView(appetizer: MockData.sampleOrder, isShowingDetail: .constant(true))
}
struct NutritionInfoForOrder: View {
    let title: String
    let value: Int
    var body: some View {
        VStack(spacing: 15){
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
