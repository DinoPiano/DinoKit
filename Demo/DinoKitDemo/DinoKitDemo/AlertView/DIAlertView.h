//
//  DIAlertView.h
//  DinoKitDemo
//
//  Created by xjf on 16/6/29.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DIAlertView;

@protocol DIAlertViewDelegate <NSObject>

- (void)alertView:(DIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface DIAlertView : UIView

@property (nonatomic, weak) id<DIAlertViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                     delegate:(id)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end
