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
    
    init() {
        
//        getJsonData()
        
        getRemoteData()
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
    
    func getRemoteData() {
        
        // https://mukulsustcse.github.io/VideoCollectionApp_data/Data.json
        
        let urlString = "https://mukulsustcse.github.io/VideoCollectionApp_data/Data.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            
            // cannot create url
            return
        }
        
        // create a URL Request object
        let request = URLRequest(url: url!)
        
        // get the session and kick off the task
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            // check if there is an error
            guard error == nil else {
                
                // there was an error
                return
            }
            
            do {
                // create json decoder
                let decoder = JSONDecoder()
                
                // decode
                let modules = try decoder.decode([Models].self, from: data!)
                
                DispatchQueue.main.async {
                    
                    // append parsed modules into modules property
                    self.model = modules
                }
            }
            catch {
                
                print(error)
            }
        }
        
        // kick off data task
        dataTask.resume()
    }
    
}
