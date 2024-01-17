//
//  CoverFlowView.swift
//  FSCoverFlow
//
//  Created by Fadel Sultan on 17/01/2024.
//

import SwiftUI

@available(iOS 17.0, *)
public struct CoverFlowContent<Content:View , Item:RandomAccessCollection>: View where Item.Element:Identifiable {
    
    ///Customization properties
    var itemWidth:CGFloat
    var enableReflection:Bool = false
    var displayType:CoverFlowType = .normal
    var items:Item
    var content:(Item.Element) -> Content
    
    
    public var body: some View {
        
        GeometryReader {
            let size = $0.size
            ScrollView(.horizontal) {
                LazyHStack(spacing:0) {
                    ForEach(items) { item in
                        content(item)
                            .frame(width: itemWidth)
                            .reflection(enableReflection)
                            .visualEffect { content, geometryProxy in
                                content
                                    .rotation3DEffect(.init(degrees: rotation(geometryProxy)), axis: (x: 0, y: 1, z: 0),anchor: .center)
                            }
                            .padding(.trailing , item.id == items.last?.id ? 0 : displayType.spacing)
                    }
                }
                .padding(.horizontal , (size.width - itemWidth) / 2)
                .scrollTargetLayout()
                
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .scrollClipDisabled()
        }
    }
    
    func rotation(_ proxy: GeometryProxy) -> Double  {
        let scrollViewWidth = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        let midX = proxy.frame(in: .scrollView(axis: .horizontal)).midX
        
        ///Converting to progress
        let progress = midX / scrollViewWidth
        
        ///Limiting Progress Between 0-1
        let cappedProgress = max(min(progress, 1), 0)
        
        /// to add another effect
        let cappedRotation = max(min(displayType.rotation, 90), 0)
        
        if displayType == .slid {
            return cappedRotation
        }
        
        let degree = cappedProgress * (cappedRotation * 2)
        return cappedRotation - degree
    }
}



//Extension View
fileprivate extension View {
    @ViewBuilder
    func reflection(_ added:Bool) -> some View {
        overlay {
            
            if added {
                GeometryReader {
                    let size = $0.size
                    
                    ///Flipping Upside Down
                    self.scaleEffect(y: -1)
                        .mask {
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            .white ,
                                            .white.opacity(0.7),
                                            .white.opacity(0.5),
                                            .white.opacity(0.3),
                                            .white.opacity(0.1),
                                            .white.opacity(0.0),
                                        ] + Array (repeating: Color.clear, count: 5),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                        }
                        .offset(y: size.height + 5)
                        .opacity(0.5)
                }
            }
        }
    }
}


