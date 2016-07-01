//
//  DIActionSheet.m
//  DinoKitDemo
//
//  Created by xjf on 16/7/1.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import "DIActionSheet.h"

#define ROW_HEIGHT      44
#define SIDE_SPACE      50
#define CONTENT_ANGLE   10
#define CONTENT_WIDTH   ([UIScreen mainScreen].bounds.size.width - 2 * SIDE_SPACE)
#define TEXT_COLOR      [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
#define LINE_COLOR      [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0]

@interface DIActionSheet () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titles;

@end

@implementation DIActionSheet

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                     delegate:(id)delegate
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION
{
    if (self = [super init])
    {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        self.delegate = delegate;
        self.titles = [NSMutableArray array];
        
        va_list args;
        va_start(args, otherButtonTitles);
        if (otherButtonTitles)
        {
            [self.titles addObject:otherButtonTitles];
            NSString *btnTitle;
            while ((btnTitle = va_arg(args, NSString *)))
            {
                [self.titles addObject:btnTitle];
            }
        }
        va_end(args);
        
        [self creatTableView];
        if (self.tableView)
        {
            [self.tableView reloadData];
        }
    }
    return self;
}


- (void)creatTableView
{
    if (!self.tableView)
    {
        CGFloat height = (ROW_HEIGHT * _titles.count + 54) > [UIScreen mainScreen].bounds.size.height ? ([UIScreen mainScreen].bounds.size.height - 40) : (ROW_HEIGHT * _titles.count + 54);
        
        CGFloat y = ([UIScreen mainScreen].bounds.size.height - height) / 2.0;
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(SIDE_SPACE, y, CONTENT_WIDTH, height) style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.bounces = NO;
        [self addSubview:self.tableView];
    }
}

- (void)show
{
    if (self)
    {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ROW_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"DIACTION_SHEET_CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)])
    {
        [self.delegate actionSheet:self clickedButtonAtIndex:indexPath.row];
    }
}



@end
