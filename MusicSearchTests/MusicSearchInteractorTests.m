//
//  MusicSearchTests.m
//  MusicSearchTests
//
//  Created by Jordi Serra i Font on 16/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ITunesFetcher.h"
#import "TracksListInteractor.h"
#import "TracksListModels.h"

#pragma mark - Spies

@interface SpyFetcher : NSObject <MusicFetcherType>
@property (nonatomic) BOOL isCalled;
@end

@implementation SpyFetcher

- (void)fetchMusicWithTerm:(NSString *)term andCompletion:(void (^)(NSDictionary<NSString *,NSString *> * _Nullable, NSError * _Nullable))completionHandler {
    
    self.isCalled = YES;
    
    // Mock delay and call completion
    double delayInSeconds = 0.2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        completionHandler(nil, nil);
    });
}

@end


@interface InteractorOutputSpy : NSObject <TracksListInteractorOutput>
@property (nonatomic) BOOL isCalled;
@end

@implementation InteractorOutputSpy

- (void)presentSearchWithResponse:(TracksList_SearchResponse *)response {
    self.isCalled = YES;
}
- (void)presentSearchWithError:(NSError *)error {
    self.isCalled = YES;
}

@end



#pragma mark - Tests

@interface MusicSearchInteractorTests : XCTestCase

@end

@implementation MusicSearchInteractorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInteractorShouldCallFetcher {
    
    //Given
    SpyFetcher *spyFetcher = [[SpyFetcher alloc] init];
    TracksListInteractor *interactor = [[TracksListInteractor alloc] initWithFetcher:spyFetcher];
    InteractorOutputSpy *spyOutput = [[InteractorOutputSpy alloc] init];
    interactor.output = spyOutput;
    
    //When
    TracksList_SearchRequest *request = [[TracksList_SearchRequest alloc] initWithTerm:@"ANY_TERM"];
    [interactor searchTracksWithRequest:request];
    
    //Then
    XCTAssert(spyFetcher.isCalled, @"Fetcher is not called!");
}

- (void)testInteractorShouldCallOutput {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Calls fetcher and waits result to be forwarded to the presenter"];
    
    //Given
    SpyFetcher *spyFetcher = [[SpyFetcher alloc] init];
    TracksListInteractor *interactor = [[TracksListInteractor alloc] initWithFetcher:spyFetcher];
    InteractorOutputSpy *spyOutput = [[InteractorOutputSpy alloc] init];
    interactor.output = spyOutput;
    
    //When
    TracksList_SearchRequest *request = [[TracksList_SearchRequest alloc] initWithTerm:@"ANY_TERM"];
    [interactor searchTracksWithRequest:request];
    
    //Then
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        XCTAssert(spyOutput.isCalled, @"Spy Output must be called!");
        [expectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

@end
