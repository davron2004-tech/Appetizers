//
//  OrderView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI
import SwiftData

struct OrderView: View {
    @Query var appetizers: [AppetizerDataModel]
    var viewModel = OrderViewModel()
    var body: some View {
        NavigationStack{
            List(MockData.appetizers){appetizer in
                AppetizerListCell(appetizer: appetizer)
                    .onTapGesture {
                        viewModel.selectedAppetizer = appetizer
                        viewModel.isShowingDetail = true
                    }
            }
        }
    }
}

#Preview {
    OrderView()
}
