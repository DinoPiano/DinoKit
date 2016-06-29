//
//  DIRootViewController.m
//  DinoKitDemo
//
//  Created by xjf on 16/6/29.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import "DIRootViewController.h"

@interface DIRootViewController ()

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation DIRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Demo";
    self.titles = [NSMutableArray array];
    self.classNames = [NSMutableArray array];
    
    [self addCell:@"AlertView in Mid" class:@"DIAlertViewExample"];
    [self.tableView reloadData];
}

- (void)addCell:(NSString *)title class:(NSString *)className
{
    [self.titles addObject:title];
    [self.classNames addObject:className];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DINO_KIT"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DINO_KIT"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class)
    {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
