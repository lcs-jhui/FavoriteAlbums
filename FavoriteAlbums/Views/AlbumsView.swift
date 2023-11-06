//
//  AlbumsView.swift
//  FavouriteAlbums
//
//  Created by Justin Hui on 2/11/2023.
//

import SwiftUI

struct AlbumsView: View {
    
    //MARK: Stored Properties
    @State var albumName = ""
    @State var artistName = ""
    @State var albumImageLink = ""
    @State var rating = 0
    @State var filteringSelection = 0
    @State var saved: [Album] = []
    
    //MARK: Computed Properties
    var body: some View {
        
            HStack{
                
                VStack{
                    
                    TextField("Enter Album Name", text: $albumName)
                        .textFieldStyle(.roundedBorder)

                    TextField("Enter Artist Name", text: $artistName)
                        .textFieldStyle(.roundedBorder)

                    TextField("Enter Album Image Link", text: $albumImageLink)
                        .textFieldStyle(.roundedBorder)
                    
                    Picker("", selection: $rating){
                        Text("★").tag(1)
                        Text("★★").tag(2)
                        Text("★★★").tag(3)
                        Text("★★★★").tag(4)
                        Text("★★★★★").tag(5)
                    }
                    .pickerStyle(.segmented)
                    
                    Button(action: {
                        
                        saveToList()
                        
                    }, label: {
                        Text("Add")
                    })
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding()
                
                VStack {
                    
                    Picker("Filtering On", selection: $filteringSelection) {
                        Text("All Results").tag(0)
                        Text("1 Star").tag(1)
                        Text("2 Stars").tag(2)
                        Text("3 Stars").tag(3)
                        Text("4 Stars").tag(4)
                        Text("5 Stars").tag(5)
                    }
                    .padding(.horizontal)
                    
                    List(filtering(originalList: saved, on: filteringSelection)) { currentAlbum in
                        
                        HStack{
                            
                            AsyncImage(url: URL(string: currentAlbum.linkProvided)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } else if phase.error != nil {
                                    Text("Invalid Link")
                                    
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 65, height: 65)
                            
                            VStack(alignment: .leading){
                                
                                Text(currentAlbum.albumProvided)
                                    .bold()
                                    .font(.title3)
                                Text(currentAlbum.artistProvided)
                                    .font(.subheadline)
                                
                            }
                            
                            Spacer()
                            
                            Text("\(currentAlbum.ratingProvided)/5")
                                .font(.title)
                            
                        }
                    }
                    
                }
                
            }
    }
    
    //MARK: Functions
    
    func saveToList() {
        
        saved.insert(
            Album(
                albumProvided: albumName,
                artistProvided: artistName,
                linkProvided: albumImageLink, ratingProvided: rating
            ),
            at: 0
        )
        
        print(saved)
        
        albumName = ""
        artistName = ""
        albumImageLink = ""
        rating = 0
    }
    
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
            if result.ratingProvided == filteringSelection {
                filteredResults.append(result)
            }
        }
        
        //Return only the filtered list
        return filteredResults
        
    }

    
}

#Preview {
    AlbumsView()
}
