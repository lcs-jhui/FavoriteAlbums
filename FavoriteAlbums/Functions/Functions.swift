//
//  Functions.swift
//  FavoriteAlbums
//
//  Created by Justin Hui on 16/11/2023.
//

import Foundation

func filtering(originalList: [Album], on desiredOutcome: Int) -> [Album] {
    
    //When the desired outcome is undetermined, just stop and return the original list
    if desiredOutcome == 0 {
        return originalList
    }
    
    //Create an empty list to opoulate before returning
    var filteredResults: [Album] = []
    
    //Iterate over the entire original list
    for result in originalList {
        
        //Copy any results that match the desired outcome to the new list
        if result.ratingProvided == desiredOutcome {
            filteredResults.append(result)
        }
    }
    
    //Return only the filtered list
    return filteredResults
    
}

