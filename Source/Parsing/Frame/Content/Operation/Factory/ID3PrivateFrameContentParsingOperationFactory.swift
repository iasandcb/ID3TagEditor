//
//  ID3PrivateFrameContentParsingOperationFactory.swift
//  ID3TagEditor macOS
//
//  Created by NAVER on 10/04/2019.
//  Copyright © 2019 Fabrizio Duroni. All rights reserved.
//

import Foundation

class ID3PrivateFrameContentParsingOperationFactory {
    static func make() -> ID3FrameStringContentParsingOperation {
        return ID3FrameStringContentParsingOperationFactory.make() { (id3Tag: ID3Tag, content: String) in
            id3Tag.privateFrame = content
        }
    }
}
