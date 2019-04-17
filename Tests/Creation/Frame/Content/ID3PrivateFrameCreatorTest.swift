//
//  ID3PrivateFrameCreatorTest.swift
//  ID3TagEditor macOS Tests
//
//  Created by NAVER on 10/04/2019.
//  Copyright © 2019 Fabrizio Duroni. All rights reserved.
//

import XCTest
@testable import ID3TagEditor

class ID3PrivateFrameCreatorTest: XCTestCase {
//    func testNoFrameCreationWhenThereIsNoArtist() {
//        let tagBytes: [UInt8] = [1, 1, 1]
//        let id3ArtistFrameCreator = ID3ArtistFrameCreator(
//            frameCreator: MockFrameFromStringContentCreator(
//                fakeNewFrameAsByte: [],
//                frameTypeToBeChecked: .Artist
//            ),
//            id3FrameConfiguration: ID3FrameConfiguration()
//        )
//
//        let newTagBytes = id3ArtistFrameCreator.createFrames(id3Tag: ID3Tag(version: .version3, size: 0), tag: tagBytes)
//
//        XCTAssertEqual(newTagBytes, tagBytes)
//    }
    
    func testFrameCreationWhenThereIsAnArtist() {
        let newFrameBytes: [UInt8] = [1, 1]
        let tagAsBytes: [UInt8] = [1, 1, 1]
        let id3Tag = ID3Tag(version: .version3, size: 0)
        id3Tag.privateFrame = "::an example private frame::"
        let id3ArtistFrameCreator = ID3PrivateFrameCreator(
            frameCreator: MockFrameFromStringContentCreator(
                fakeNewFrameAsByte: newFrameBytes,
                frameTypeToBeChecked: .PrivateFrame
            ),
            id3FrameConfiguration: ID3FrameConfiguration()
        )
        
        let newTagBytes = id3ArtistFrameCreator.createFrames(id3Tag: id3Tag, tag: tagAsBytes)
        
        XCTAssertEqual(newTagBytes, tagAsBytes + newFrameBytes)
    }
}
