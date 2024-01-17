//
//  File.swift
//  
//
//  Created by Fadel Sultan on 17/01/2024.
//

import Foundation

public enum CoverFlowType {
    case normal
    case clip
    case slid
    
    var spacing:CGFloat {
        switch self {
        case .normal:
            return 10
        case .clip:
            return 0
        case .slid:
            return 0
        }
    }
    
    var rotation:CGFloat {
        switch self {
        case .normal:
            return 0
        case .clip:
            return 25
        case .slid:
            return 30
        }
    }
}
