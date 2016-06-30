//
//  DIAlertView.m
//  DinoKitDemo
//
//  Created by xjf on 16/6/29.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import "DIAlertView.h"

@interface DIAlertView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation DIAlertView

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                     delegate:(id)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION
{
    if (self = [super init])
    {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self addSubview:self.contentView];
        if (title && title.length > 0)
        {
            [self createTitleLabel:title];
        }
        if (message && message.length > 0)
        {
            [self createMessageLabel:message];
        }
        if (delegate)
        {
            self.delegate = delegate;
        }
        
        CGFloat y = 25 + self.titleLabel.frame.size.height + 10 + self.messageLabel.frame.size.height + 17;
        NSMutableArray *titles = [NSMutableArray array];
        
        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            NSString *btnTitle;
            while ((btnTitle = va_arg(args, NSString *)))
            {
                [titles addObject:btnTitle];
            }
        }
        va_end(args);
        
        for (int i = 0; i < titles.count; i++)
        {
            UIView *line = [[UIView alloc] init];
            line.frame = CGRectMake(0, y, self.contentView.frame.size.width, 0.5);
            line.backgroundColor = [UIColor colorWithRed:204 green:204 blue:204 alpha:1.0];
            [self.contentView addSubview:line];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:titles[i] forState:UIControlStateNormal];
            button.titleLabel.textColor = [UIColor colorWithRed:51 green:51 blue:51 alpha:1.0];
            button.frame = CGRectMake(0, y, self.contentView.frame.size.width, 44);
            [self.contentView addSubview:button];
            
            y += 44;
        }
        
        CGFloat height = y;
        self.contentView.frame = CGRectMake(50, (self.frame.size.height - height)/2, self.frame.size.width - 2*50, height);
        
    }
    
    return self;
}

#pragma mark - View Elements
- (UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [[UIView alloc] init];
        _contentView.frame = CGRectMake(0, 0, 100, 100);
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 20;
    }
    return _contentView;
}

- (void)createTitleLabel:(NSString *)title
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.frame = CGRectMake(0, 0, 50, 50);
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.text = title;
    self.titleLabel.textColor = [UIColor colorWithRed:51 green:51 blue:51 alpha:1.0];
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake((self.frame.size.width - self.titleLabel.frame.size.width)/2.0, 25, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    [self.contentView addSubview:self.titleLabel];
}

- (void)createMessageLabel:(NSString *)message
{
    self.messageLabel = [[UILabel alloc] init];
    self.messageLabel.frame = CGRectMake(0, 0, 50, 50);
    self.messageLabel.font = [UIFont systemFontOfSize:13];
    self.messageLabel.text = message;
    self.messageLabel.textColor = [UIColor colorWithRed:51 green:51 blue:51 alpha:1.0];
    [self.messageLabel sizeToFit];
    CGFloat y = 25;
    if (self.titleLabel && self.titleLabel.superview)
    {
        y = CGRectGetMaxY(self.titleLabel.frame) + 10;
    }
    self.messageLabel.frame = CGRectMake((self.frame.size.width - self.messageLabel.frame.size.width)/2.0, y, self.messageLabel.frame.size.width, self.messageLabel.frame.size.height);
    [self.contentView addSubview:self.messageLabel];
}

@end
