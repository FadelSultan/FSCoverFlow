//
//  CoverFlowDataService.swift
//  CoverFlowDemo
//
//  Created by Fadel Sultan on 17/01/2024.
//

import Foundation
import SwiftUI

final class CoverFlowDataService {
    
    func fetchData() async throws -> [CoverFlowModel] {
        do {
            guard let url = URL(string: "https://picsum.photos/v2/list?page=\(Int.random(in: 1...10))&limit=10") else {
                throw URLError(.badURL)
            }
            print("url: \(url)")
            let (result, _ ) =  try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([CoverFlowModel].self, from: result)
        }catch {
            throw error
        }
    }
    
    
    func downloadImage(stringUrl:String) async throws -> UIImage? {
        guard let url = URL(string: stringUrl) else {
            throw URLError(.badURL)
        }
        do {
            let (dataImage , _ ) = try await URLSession.shared.data(from: url)
            return UIImage(data: dataImage)
        }catch {
            throw error
        }
    }
    
}
