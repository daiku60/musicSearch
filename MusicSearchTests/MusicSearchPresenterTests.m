//
//  MusicSearchPresenterTests.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TracksListPresenter.h"
#import "TracksListModels.h"


#pragma mark - Spy

@interface SpyPresenterOutput : NSObject <TracksListPresenterOutput>
@property (nonatomic) BOOL isCalled;
@end

@implementation SpyPresenterOutput

- (void)displaySearchResults:(TracksList_SearchViewModel * _Nonnull)viewModel {
    self.isCalled = YES;
}
- (void)displaySearchError:(NSError * _Nonnull)error {
    self.isCalled = YES;
}

@end


#pragma mark - Tests

@interface MusicSearchPresenterTests : XCTestCase

@end

@implementation MusicSearchPresenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPresenterShouldCallViewController {
    // Given
    TracksListPresenter *presenter = [[TracksListPresenter alloc] init];
    SpyPresenterOutput *spyOutput = [[SpyPresenterOutput alloc] init];
    presenter.output = spyOutput;
    
    // When
    [presenter presentSearchWithResponse:[[TracksList_SearchResponse alloc] init]];
    
    // Then
    XCTAssert(spyOutput.isCalled == YES, @"Output is not called!");
}

- (void)testPresenterSouldParseTrackListMock {
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"TrackListMock" ofType:@"json"];
    XCTAssertNotNil(jsonPath, @"jsonPath is nil");
    
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    XCTAssertNotNil(jsonPath, @"jsonData is nil");
    
    NSError *error;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    XCTAssertNil(error, @"Error is: %@", error.localizedDescription);
    XCTAssertNotNil(jsonObject, @"jsonObject is nil");
    
    TracksList_SearchResponse *response = [[TracksList_SearchResponse alloc] initWithDictionary:jsonObject];
    XCTAssertNotNil(response.resultsArray, @"resultsArray is nil");
    XCTAssert(response.resultsArray.count > 0, @"resultsArray is empty");
    
    TrackModel *firstTrack = [response.resultsArray firstObject];
    XCTAssertNotNil(firstTrack.artistName, @"ArtistName is nil");
    XCTAssert([firstTrack.artistName isEqualToString:@"Michael Jackson & Justin Timberlake"], @"Artist Name not matching, is instead: %@", firstTrack.artistName);
}

@end
