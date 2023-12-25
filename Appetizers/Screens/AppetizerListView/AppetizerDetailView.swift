//
//  DetailView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @Environment(\.modelContext) var context
    let appetizer:Appetizer
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
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            Spacer()
            Button{
                let appetizerToSave = Order(
                    id: appetizer.id,
                    name: appetizer.name,
                    description: appetizer.description,
                    price: appetizer.price,
                    imageURL: appetizer.imageURL,
                    calories: appetizer.calories,
                    protein: appetizer.protein,
                    carbs: appetizer.carbs
                )
                context.insert(appetizerToSave)
                isShowingDetail = false
            }label: {
                APButton(title: "$\(appetizer.price,specifier: "%.2f") - Add To Order")
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
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
struct NutritionInfo: View {
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
