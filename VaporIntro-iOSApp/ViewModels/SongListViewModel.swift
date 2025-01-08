//
//  SongListViewModel.swift
//  VaporIntro-iOSApp
//
//  Created by Pratama One on 08/01/25.
//

import SwiftUI

@MainActor
class SongListViewModel: ObservableObject {
    @Published var songs = [Song]()
    
    func fetchSongs() async throws {
        let urlString = Constants.baseURL + EndPoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badUrl
        }
        
        let songResponse: [Song] = try await HttpClient.shared.fetch(url: url)
        
        self.songs = songResponse
    }
}
