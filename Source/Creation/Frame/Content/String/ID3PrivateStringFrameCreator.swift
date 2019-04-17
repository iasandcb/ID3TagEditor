//
//  ID3PrivateStringFrameCreator.swift
//  ID3TagEditor macOS
//
//  Created by NAVER on 17/04/2019.
//  Copyright © 2019 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3PrivateStringFrameCreator: FrameFromStringContentCreator {
    private let frameContentSizeCalculator: FrameContentSizeCalculator
    private let frameFlagsCreator: FrameFlagsCreator
    private let stringToBytesAdapter: StringToBytesAdapter
    
    init(frameContentSizeCalculator: FrameContentSizeCalculator,
         frameFlagsCreator: FrameFlagsCreator,
         stringToBytesAdapter: StringToBytesAdapter) {
        self.frameContentSizeCalculator = frameContentSizeCalculator
        self.frameFlagsCreator = frameFlagsCreator
        self.stringToBytesAdapter = stringToBytesAdapter
    }
    
    func createFrame(frameIdentifier: [UInt8], version: ID3Version, content: String) -> [UInt8] {
        var frame: [UInt8] = frameIdentifier
        let owner: [UInt8] = [0x6E, 0x61, 0x76, 0x65, 0x72, 0x00] // naver
        let contentAsBytes = stringToBytesAdapter.adapt(string: content, for: version)
        
        frame.append(contentsOf: frameContentSizeCalculator.calculateSizeOf(content: owner + contentAsBytes, version: version))
        frame.append(contentsOf: frameFlagsCreator.createFor(version: version))
        frame.append(contentsOf: owner)
        frame.append(contentsOf: contentAsBytes)
        return frame
    }
}
