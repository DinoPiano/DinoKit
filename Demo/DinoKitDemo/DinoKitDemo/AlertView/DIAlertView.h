//
//  DIAlertView.h
//  DinoKitDemo
//
//  Created by xjf on 16/6/29.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIAlertView : UIView


- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                     delegate:(id)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ... ;

@end
