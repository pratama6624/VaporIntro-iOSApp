//
//  ContentView.swift
//  VaporIntro-iOSApp
//
//  Created by Pratama One on 08/01/25.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    @State var modal: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.songs) { song in
                    Button {
                        print("selected")
                    } label : {
                        Text("\(song.title), \(song.artist), \(song.album), \(song.genre)")
                            .font(.title3)
                            .foregroundStyle(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("Songs"))
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        modal = .add
                    } label: {
                        Label("Add Song", systemImage: "plus.circle")
                    }
                }
            }
        }
        .sheet(item: $modal, onDismiss: {
            // on dismiss
        }) { modal in
            switch modal {
            case .add:
                Text("Add Song")
            case .update(let song):
                Text("Update Song: \(song.title)")
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
        }
    }
}

#Preview {
    SongList()
}
