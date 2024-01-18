//
//  CoverFlowModel.swift
//  CoverFlowDemo
//
//  Created by Fadel Sultan on 17/01/2024.
//

import Foundation

struct CoverFlowModel: Codable , Hashable {
    let id: String
    let author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
