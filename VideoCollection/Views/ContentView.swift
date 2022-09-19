//
//  ContentView.swift
//  VideoCollection
//
//  Created by M. A. Alim Mukul on 19.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var base_model:VideoModels
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                List(base_model.model) { item in
                    
                    NavigationLink(destination: {
                        
                        VideoPage(link: item.url, heading: item.title)
                        
                    }, label: {
                        
                        Text(item.title)
                            .foregroundColor(.black)
                        
                    })
                }
                .navigationTitle("Video Collection")
            }
            .navigationViewStyle(.stack)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//
//    }
//}
