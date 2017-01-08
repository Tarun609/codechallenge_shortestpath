//
//  ShortestPathUnitTest.m
//  ShortestPathUnitTest
//
//  Created by Tarun on 07/01/17.
//  Copyright © 2017 Rappier. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ShortestPathUnitTest : XCTestCase

@end

@implementation ShortestPathUnitTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testvalue
{
    NSString *values = @"1,2,3,4,56,7,8,";
    
    
    NSArray *temp=[values componentsSeparatedByString:@","];
    
    XCTAssertNotNil(temp);

}


-(void)testpath
{
   NSArray *myArray = @[@[ @4, @3, @7, @4],@[ @2, @9, @2,@8],@[ @9, @5, @7, @5],@[ @3, @7, @1, @4]];
    
    int n=3,m=3;
    
    if (n < 0 || m < 0)
    {
        XCTAssertNil(((NSNumber*)myArray[m][n]));
    }
    else if (m == 0 && n == 0)
    {
     XCTAssertNotNil(((NSNumber*)myArray[m][n]));
    }
}

-(void)testshortvalue
{
    NSArray *myArray = @[@[ @4, @3, @7, @4],@[ @2, @9, @2,@8],@[ @9, @5, @7, @5],@[ @3, @7, @1, @4]];
    
    int x,y,z;
    
    for (int count=0; count<[myArray count];count++)
    {
       //x =[[myArray objectAtIndex:count]integerValue];
        
         NSNumber *value=(NSNumber *)[myArray objectAtIndex:count] ;

//y=[[myArray objectAtIndex:count+1]integerValue];
       
       // z=[[myArray objectAtIndex:count+2]integerValue];
    }
    
    if (x < y)
        XCTAssertTrue((x < z)? x : z);
    else
        XCTAssertTrue((y < z)? y : z);
    
    //    myArray = @[
    //                         @[ @4, @3, @7, @4],
    //                         @[ @2, @9, @2,@8],
    //                         @[ @9, @5, @7, @5],
    //                         @[ @3, @7, @1, @4]];
    //   NSLog(@"MIN : %i",[self minCostValueWithCost:myArray andPath1:3 andPath2:3]);
    

}



@end
