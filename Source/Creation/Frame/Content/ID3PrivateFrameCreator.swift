//
//  ID3PrivateFrameCreator.swift
//  ID3TagEditor macOS
//
//  Created by NAVER on 10/04/2019.
//  Copyright © 2019 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3PrivateFrameCreator: ID3StringFrameCreator {
    override func createFrames(id3Tag: ID3Tag, tag: [UInt8]) -> [UInt8] {
        if let privateFrame = id3Tag.privateFrame {
            return createFrameUsing(frameType: .PrivateFrame, content: privateFrame, id3Tag: id3Tag, andAddItTo: tag)
        }
        return super.createFrames(id3Tag: id3Tag, tag: tag)
    }
}
