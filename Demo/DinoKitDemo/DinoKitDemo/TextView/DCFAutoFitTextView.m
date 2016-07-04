//
//  DCFAutoFitTextView.m
//  ios_iphone_teacher
//
//  Created by xjf on 16/7/4.
//  Copyright © 2016年 dqf. All rights reserved.
//

#import "DCFAutoFitTextView.h"

@interface DCFAutoFitTextView ()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation DCFAutoFitTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.text = @"test";
        
//        [self sizeToFit];
//        self.frame = self.frame;

        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        

    }
    return self;
}

//- (CGSize)sizeThatFits:(CGSize)size
//{
//    CGSize size1 = size;
//    
//    return size1;
//}


//- (void)drawRect:(CGRect)rect
//{
//    
//}

@end
