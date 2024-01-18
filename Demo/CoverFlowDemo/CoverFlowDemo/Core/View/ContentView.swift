//
//  ContentView.swift
//  CoverFlowDemo
//
//  Created by Fadel Sultan on 17/01/2024.
//

import SwiftUI
import FSCoverFlow

struct ContentView: View {
    
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var typeSelected:Int = 0
    private let coverFlowTypes:[String] = ["Normal" , "Clip" , "Slid"]
    @State private var selected:CoverFlowType = .normal
    @State private var isAddReflection:Bool = true
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                CoverFlowView(
                    enableReflection:isAddReflection ,
                    displayType: selected ,
                    images: viewModel.imagesList,
                    itemWidth: 300
                )
                Spacer()
                displayTypes
            }.task {
                await viewModel.getData()
            }
            .navigationTitle("FSCoverFlow")
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    private var displayTypes: some View {
        VStack(alignment:.leading , spacing: 15){
            Toggle("Add reflection", isOn: $isAddReflection)
            Divider()
            
            Text("Cover type")
                .font(.headline)
            
            Picker("Cover Type", selection: $typeSelected) {
                ForEach(coverFlowTypes.indices , id: \.self) { index in
                    Text(coverFlowTypes[index])
                }
            }
            
            .pickerStyle(.segmented)
            .onChange(of: typeSelected) { oldValue, newValue in
                selected = newValue == 0 ? .normal : newValue == 1 ? .clip : .slid
            }
        }.padding()
            .background(.ultraThinMaterial , in:.rect(cornerRadius: 10))
            .padding()
    }
}
