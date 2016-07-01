//
//  DIActionSheet.h
//  DinoKitDemo
//
//  Created by xjf on 16/7/1.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DIActionSheet;

@protocol DIActionSheetDelegate <NSObject>

- (void)actionSheet:(DIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface DIActionSheet : UIView

@property (nonatomic, weak) id<DIActionSheetDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                     delegate:(id)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

- (void)show;

@end
