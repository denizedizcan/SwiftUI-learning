//
//  landmarkList.swift
//  Landmarks
//
//  Created by Deniz Edizcan on 6.02.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filtredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                
                ForEach(filtredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    }  label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filtredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())

}
