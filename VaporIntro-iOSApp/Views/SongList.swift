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
                        Text(song.title)
                            .font(.title3)
                            .foregroundStyle(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("Songs"))
            .toolbar {
                Button {
                    print("Add song")
                } label: {
                    Label("Add song", systemImage: "plus.circle")
                }
            }
        }
        .sheet(item: $modal, onDismiss: {
            // on dismiss
        }) { modal in
            switch _modal {
            case .add:
                print("add song")
            case .update:
                printf("update song")
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
