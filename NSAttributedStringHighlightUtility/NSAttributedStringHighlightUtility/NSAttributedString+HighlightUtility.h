//
//  NSAttributedString+HighlightUtility.h
//  NSAttributedStringHighlightUtility
//
//  Created by makino on 2015/08/28.
//  Copyright (c) 2015年 smakino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (HighlightUtility)

/**
 * highlightWords対し、指定された属性の装飾を行う。
 */
- (NSAttributedString *)highlightedStringWithWords:(NSArray *)words
                                        attributes:(NSDictionary *)attributes;

@end

