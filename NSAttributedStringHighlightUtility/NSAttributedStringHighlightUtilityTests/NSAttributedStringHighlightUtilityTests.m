//
//  NSAttributedStringHighlightUtilityTests.m
//  NSAttributedStringHighlightUtilityTests
//
//  Created by smakino on 2015/08/30.
//  Copyright (c) 2015年 smakino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSAttributedString+HighlightUtility.h"

@interface NSAttributedStringHighlightUtilityTests : XCTestCase

@end

@implementation NSAttributedStringHighlightUtilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHighlightText {
    NSString *baseText = @"Text highlight test. The words which specified would be highlighted.";
    NSString *word_Highlight = @"Highlight";
    NSString *word_test = @"test";
    NSString *wordTail = @"highlighted.";
    
    NSArray *words = @[word_Highlight, word_test, wordTail];
    UIColor *fontColor = [UIColor blueColor];
    UIColor *backgroundColor = [UIColor yellowColor];
    NSDictionary *attrDict = @{NSForegroundColorAttributeName: fontColor,
                               NSBackgroundColorAttributeName: backgroundColor};
    
    NSAttributedString *baseAttrStr = [[NSAttributedString alloc] initWithString:baseText];
    
    NSAttributedString *attrStr = [baseAttrStr highlightedStringWithWords:words attributes:attrDict];
    XCTAssertNotNil(attrStr);
    XCTAssertNotEqual(baseAttrStr, attrStr);
    
    NSInteger (^countHighlight)(NSString *word) = ^NSInteger(NSString *word) {
        __block NSInteger count = 0;
        NSRange searchRange = NSMakeRange(0, baseText.length);
        NSRange r;
        do {
            r = [baseText rangeOfString:word
                                options:NSCaseInsensitiveSearch
                                  range:searchRange];
            [attrStr enumerateAttributesInRange:r
                                        options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                                     usingBlock:^(NSDictionary *attrs, NSRange range, BOOL *stop)
             {
                 XCTAssertEqual(fontColor, attrs[NSForegroundColorAttributeName]);
                 XCTAssertEqual(backgroundColor, attrs[NSBackgroundColorAttributeName]);
                 if (([attrs[NSForegroundColorAttributeName] isEqual:fontColor ])
                     && ([attrs[NSBackgroundColorAttributeName] isEqual:backgroundColor])) {
                     count += 1;
                 }
             }];
            searchRange.location = r.location + r.length;
            searchRange.length = baseText.length - searchRange.location;
        } while(r.location != NSNotFound);
        
        return count;
    };
    
    XCTAssertEqual(countHighlight(word_Highlight), 2);
    XCTAssertEqual(countHighlight(word_test), 1);
    XCTAssertEqual(countHighlight(wordTail), 1);
}

@end
