//
//  AddUpdateSongViewModel.swift
//  VaporIntro-iOSApp
//
//  Created by Pratama One on 09/01/25.
//

import SwiftUI

final class AddUpdateSongViewModel: ObservableObject {
    @Published var songTitle: String = ""
    @Published var songArtist: String = ""
    @Published var songAlbum: String = ""
    @Published var songGenre: String = ""
    
    var songID: UUID?
    
    var isUpdating: Bool {
        songID != nil
    }
    
    var buttonTitle: String {
        songID != nil ? "Update Song" : "Add Song"
    }
    
    init() { }
    
    init(currentSong: Song) {
        self.songTitle = currentSong.title
        self.songID = currentSong.id
    }
    
    func addSong() async throws {
        let urlString = Constants.baseURL + EndPoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badUrl
        }
        
        let song = Song(id: nil, title: songTitle, artist: songArtist, album: songAlbum, genre: songGenre)
    }
}
