//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @Bindable var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationStack{
                List(viewModel.appetizers){appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        //.listRowSeparatorTint(.BrandPrimary)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .disabled(viewModel.isShowingDetail)
                .navigationTitle("Appetizer")
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            if viewModel.isShowingDetail{
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(isPresented:$viewModel.isShowingAlert){
            Alert(
                title: viewModel.alertItem!.title,
                message: viewModel.alertItem?.message,
                dismissButton: viewModel.alertItem?.dismissButton
            )
        }
    }
}

#Preview {
    AppetizerListView()
}
