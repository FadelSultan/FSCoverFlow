//
//  CoverFlowView.swift
//  FSCoverFlow
//
//  Created by Fadel Sultan on 17/01/2024.
//

import SwiftUI

@available(iOS 17.0, *)
public struct CoverFlowView: View {
    
   public let enableReflection:Bool
   public let displayType:CoverFlowType
   public let images:[UIImage]
   public let itemWidth:CGFloat = 300
    
    private var item:[CoverFlowItem] {
        images.compactMap{
            return .init(image: $0)
        }
    }
    
    public var body: some View {
        CoverFlowContent(
            itemWidth: itemWidth,
            enableReflection: enableReflection,
            displayType: displayType,
            items: item
        ) { item in
            Image(uiImage: item.image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(height: 280)
        
    }
}
