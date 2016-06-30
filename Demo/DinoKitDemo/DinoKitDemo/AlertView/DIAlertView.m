//
//  DIAlertView.m
//  DinoKitDemo
//
//  Created by xjf on 16/6/29.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import "DIAlertView.h"

#define SIDE_SPACE      50
#define CONTENT_ANGLE   10
#define CONTENT_WIDTH   ([UIScreen mainScreen].bounds.size.width - 2 * SIDE_SPACE)
#define TEXT_COLOR      [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
#define LINE_COLOR      [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0]

@interface DIAlertView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *buttonsView;
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
        [self.contentView addSubview:self.buttonsView];
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
            line.frame = CGRectMake(0, y, self.contentView.frame.size.width, 1.0);
            line.backgroundColor = LINE_COLOR;
            [self.buttonsView addSubview:line];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:titles[i] forState:UIControlStateNormal];
            [button setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
            button.frame = CGRectMake(0, y, self.contentView.frame.size.width, 44);
            button.tag = i;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttonsView addSubview:button];
            
            y += 44;
        }
        
        self.buttonsView.frame = CGRectMake(0, 0, self.frame.size.width - 2 * SIDE_SPACE, y);
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setTitle:cancelButtonTitle forState:UIControlStateNormal];
        [cancelBtn setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
        cancelBtn.backgroundColor = [UIColor whiteColor];
        cancelBtn.layer.cornerRadius = CONTENT_ANGLE;
        cancelBtn.frame = CGRectMake(0, y + 10, CONTENT_WIDTH, 44);
        cancelBtn.tag = titles.count;
        [self.contentView addSubview:cancelBtn];
        
        CGFloat height = y + 44 + 10;
        self.contentView.frame = CGRectMake(SIDE_SPACE, (self.frame.size.height - height)/2, CONTENT_WIDTH, height);
        
    }
    
    return self;
}

#pragma mark - View Elements
- (UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [[UIView alloc] init];
        _contentView.frame = CGRectMake(0, 0, CONTENT_WIDTH, 100);
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}

- (UIView *)buttonsView
{
    if (!_buttonsView)
    {
        _buttonsView = [[UIView alloc] init];
        _buttonsView.frame = CGRectMake(SIDE_SPACE, 0, CONTENT_WIDTH, 100);
        _buttonsView.backgroundColor = [UIColor whiteColor];
        _buttonsView.layer.cornerRadius = CONTENT_ANGLE;
    }
    return _buttonsView;
}

- (void)createTitleLabel:(NSString *)title
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.frame = CGRectMake(0, 0, 50, 50);
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.text = title;
    self.titleLabel.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake((CONTENT_WIDTH - self.titleLabel.frame.size.width)/2.0, 25, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    [self.buttonsView addSubview:self.titleLabel];
}

- (void)createMessageLabel:(NSString *)message
{
    self.messageLabel = [[UILabel alloc] init];
    self.messageLabel.frame = CGRectMake(0, 0, 50, 50);
    self.messageLabel.font = [UIFont systemFontOfSize:13];
    self.messageLabel.text = message;
    self.messageLabel.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    [self.messageLabel sizeToFit];
    CGFloat y = 25;
    if (self.titleLabel && self.titleLabel.superview)
    {
        y = CGRectGetMaxY(self.titleLabel.frame) + 10;
    }
    self.messageLabel.frame = CGRectMake((CONTENT_WIDTH - self.messageLabel.frame.size.width)/2.0, y, self.messageLabel.frame.size.width, self.messageLabel.frame.size.height);
    [self.buttonsView addSubview:self.messageLabel];
}

#pragma mark - Button Delegate
- (void)buttonClick:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)])
    {
        [self.delegate alertView:self clickedButtonAtIndex:button.tag];
    }
}

@end
