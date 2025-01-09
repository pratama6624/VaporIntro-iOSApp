//
//  AddUpdateSong.swift
//  VaporIntro-iOSApp
//
//  Created by Pratama One on 09/01/25.
//

import SwiftUI

struct AddUpdateSong: View {
    
    @ObservedObject var viewModel: AddUpdateSongViewModel
    
    var body: some View {
        VStack {
            TextField("song title", text: $viewModel.songTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button {
                
            } label: {
                Text(viewModel.buttonTitle)
            }
        }
    }
}

#Preview {
    AddUpdateSong(viewModel: AddUpdateSongViewModel())
}
