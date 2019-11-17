//
//  NoteBank.swift
//  Ear Trainer
//
//  Created by Mingjia Wang on 9/8/19.
//  Copyright © 2019 Mingjia Wang. All rights reserved.
//

import Foundation

class NoteBank {
    
    var list = [Note]()
    
    init() {
        
        list.append(Note("C", "C.aiff"))
        list.append(Note("D", "D.aiff"))
        list.append(Note("E", "E.aiff"))
        list.append(Note("F", "F.aiff"))
        list.append(Note("G", "G.aiff"))
        list.append(Note("A", "A.aiff"))
        list.append(Note("B", "B.aiff"))
    }
}
