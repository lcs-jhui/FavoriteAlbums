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
    @State var rating = 3
    @State var filteringSelection = 3
    
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
                        
                    }, label: {
                        Text("Add")
                    })
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding()
                
                VStack {
                    
                    Picker("Filtering On", selection: $filteringSelection) {
                        Text("1 Star").tag(1)
                        Text("2 Stars").tag(2)
                        Text("3 Stars").tag(3)
                        Text("4 Stars").tag(4)
                        Text("5 Stars").tag(5)
                    }
                    .padding(.horizontal)
                    
                    List {
                        
                        HStack{
                            
                            AsyncImage(url: URL(string: "https://m.media-amazon.com/images/I/71dSVXIhLoL._UF1000,1000_QL80_.jpg")) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } else if phase.error != nil {
                                    Text("Error Image")
                                    
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 65, height: 65)
                            
                            VStack(alignment: .leading){
                                
                                Text("Voulez-Vous")
                                    .bold()
                                    .font(.title3)
                                Text("ABBA")
                                    .font(.subheadline)
                                
                            }
                            
                            Spacer()
                            
                            Text("\(rating)/5")
                                .font(.title)
                            
                        }
                    }
                    
                }
                
            }
    }
}

#Preview {
    AlbumsView()
}
