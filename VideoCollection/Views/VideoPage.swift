//
//  VideoPage.swift
//  VideoCollection
//
//  Created by M. A. Alim Mukul on 19.09.22.
//

import SwiftUI
import AVKit

struct VideoPage: View {
    
    @EnvironmentObject var base_model:VideoModels
    let videoRatio: CGFloat = 1080 / 1920
    
    let link:String
    let heading:String
    
    var body: some View {
        
        let url = URL(string: link)
        
        if url != nil {
            
            VStack(alignment: .leading) {
                
                Text(heading)
                    .bold()
                    .padding()
                    
                
                GeometryReader  { geo in
                    
                    VideoPlayer(player: AVPlayer(url: url!))
                        .frame(height: geo.size.width * videoRatio)
                }
            }
        }
        else {
            Text("Failed")
        }
    }
}
