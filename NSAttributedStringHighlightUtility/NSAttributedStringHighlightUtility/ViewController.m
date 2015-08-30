//
//  ViewController.m
//  NSAttributedStringHighlightUtility
//
//  Created by smakino on 2015/08/30.
//  Copyright (c) 2015年 smakino. All rights reserved.
//

#import "ViewController.h"
#import "NSAttributedString+HighlightUtility.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView *v = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 50)];
    [self.view addSubview:v];
    v.editable = NO;
    v.text = @"The UITextView class implements the behavior for a scrollable, multiline text region."
    "The class supports the display of text using custom style information and also supports text editing. "
    "You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document.";
    
    NSDictionary *attrs = @{NSForegroundColorAttributeName : [UIColor blueColor],
                            NSBackgroundColorAttributeName : [UIColor yellowColor]};
    
    v.attributedText = [v.attributedText highlightedStringWithWords:@[@"text", @"large"] attributes:attrs];
}

@end
