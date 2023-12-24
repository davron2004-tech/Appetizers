//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI

struct AppetizerListView: View {
    let viewModel = AppetizerListViewModel()
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers){appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("Appetizer")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }
       
    }
    
}

#Preview {
    AppetizerListView()
}
