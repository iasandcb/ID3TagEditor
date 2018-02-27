//
//  FrameContentSizeParser.swift
//
//  Created by Fabrizio Duroni on 23/02/2018.
//  2018 Fabrizio Duroni.
//

import Foundation

protocol FrameContentSizeParser {
    func parse(mp3: NSData, framePosition: Int, version: UInt8) -> Int
}