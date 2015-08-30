//
//  NSAttributedString+HighlightUtility.m
//  NSAttributedStringHighlightUtility
//
//  Created by makino on 2015/08/28.
//  Copyright (c) 2015年 smakino. All rights reserved.
//

#import "NSAttributedString+HighlightUtility.h"

@implementation NSAttributedString (HighlightUtility)

- (NSAttributedString *)highlightedStringWithWords:(NSArray *)words
                                        attributes:(NSDictionary *)attributes {
    NSMutableAttributedString *mAttrStr = self.mutableCopy;
    NSString *text = mAttrStr.string;
    [words enumerateObjectsUsingBlock:^(NSString *word, NSUInteger idx, BOOL *stop) {
        NSRange searchRange = NSMakeRange(0, text.length);
        NSRange r;
        do {
            r = [text rangeOfString:word
                            options:NSCaseInsensitiveSearch
                              range:searchRange];
            if (r.location != NSNotFound) {
                [attributes enumerateKeysAndObjectsUsingBlock:^(NSString *attrKey, UIColor *color, BOOL *stop) {
                    [mAttrStr addAttribute:attrKey
                                     value:color
                                     range:r];
                }];
                searchRange.location = r.location + r.length;
                searchRange.length = text.length - searchRange.location;
            }
        } while (r.location != NSNotFound);
    }];
    return mAttrStr;
}

@end
