//
//  Functions.swift
//  FavoriteAlbums
//
//  Created by Justin Hui on 16/11/2023.
//

import Foundation

func filtering(originalList: [Album], on filteringSelection: Int) -> [Album] {
    
    if filteringSelection == 0 {
        return originalList
    }
    
    var filteredResults: [Album] = []
    
    for result in originalList {
        
        if result.ratingProvided == filteringSelection {
            filteredResults.append(result)
        }
    }
    
    return filteredResults
    
}

