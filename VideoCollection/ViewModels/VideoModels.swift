//
//  VideoModels.swift
//  VideoCollection
//
//  Created by M. A. Alim Mukul on 19.09.22.
//

import Foundation

class VideoModels: ObservableObject {
    
    @Published var model = [Models]()
    
    @Published var getVideoUrl: Models?
    var videoUrl = ""
    
    init() {
        
        getJsonData()
    }
    
    func getJsonData() {
        
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        if let path = pathString {
            
            let url = URL(fileURLWithPath: path)
            
            do {
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                do {
                    let recallData = try decoder.decode([Models].self, from: data)
                    
                    for i in 0..<model.count {
                        
                        model[i].uid = UUID()
                    }
                    self.model = recallData
                }
                catch {
                    print(error)
                }
            }
            catch {
                
                print(error)
            }
        }
    }
    
    func retrieveVideoUrl() {
        
        for i in 0..<model.count {
            
            videoUrl = model[i].url
        }
    }
}
