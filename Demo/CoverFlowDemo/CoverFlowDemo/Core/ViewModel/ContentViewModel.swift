//
//  ContentViewModel.swift
//  CoverFlowDemo
//
//  Created by Fadel Sultan on 17/01/2024.
//

import Foundation
import SwiftUI

final class ContentViewModel:ObservableObject {
    private let dataService = CoverFlowDataService()
    
    @Published var imagesList:[UIImage] = []
    
    @MainActor
    func getData() async {
        do {
            let data = try await dataService.fetchData()
            for url in data.map({$0.downloadURL}) {
                let image = try await dataService.downloadImage(stringUrl: url)
                if let image {
                    imagesList.append(image)
                }
            }
        }catch {
            //TODO:  [⚠️] Make Published var errorMessage to user and display with refresh option
            print(error)
        }
    }

}
