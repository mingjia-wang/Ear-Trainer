//
//  Note.swift
//  Ear Trainer
//
//  Created by Mingjia Wang on 9/8/19.
//  Copyright © 2019 Mingjia Wang. All rights reserved.
//

import Foundation

class Note {
    
    var noteName: String
    var fileName: String
    
    init(_ noteName: String, _ fileName: String ) {
        
        self.noteName = noteName
        self.fileName = fileName
    }
    
}
