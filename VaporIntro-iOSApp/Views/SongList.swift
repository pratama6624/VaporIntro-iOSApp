//
//  ContentView.swift
//  VaporIntro-iOSApp
//
//  Created by Pratama One on 08/01/25.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
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
        }
    }
}

#Preview {
    SongList()
}
