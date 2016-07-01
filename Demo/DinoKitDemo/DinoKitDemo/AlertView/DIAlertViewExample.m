//
//  DIAlertViewExample.m
//  DinoKitDemo
//
//  Created by xjf on 16/6/29.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import "DIAlertViewExample.h"
#import "DIAlertView.h"
#import "DIActionSheet.h"

@interface DIAlertViewExample () <DIAlertViewDelegate, DIActionSheetDelegate>

@end

@implementation DIAlertViewExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    DIAlertView *alertView = [[DIAlertView alloc] initWithTitle:@"TITLE" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"0",@"1",@"2",@"3",@"4",nil];
//    [alertView show];
    
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:@"TITLE" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"11",@"222",@"333",@"4444",@"5555",@"6666", nil];
    [action showInView:self.view];
    
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2.0, 400, 200, 50);
    [button setTitle:@"AlertView show" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(alertViewShow) forControlEvents:UIControlEventTouchUpInside];
//    [button addTarget:self action:@selector(changeBackgroundColor) forControlEvents:UIControlStateHighlighted];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 10;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1;
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertViewShow
{
    DIAlertView *alertView = [[DIAlertView alloc] initWithTitle:@"TITLE" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"0",@"1",@"2",@"3",@"4",nil];
    [alertView show];
    
    
//    DIActionSheet *actionSheet = [[DIActionSheet alloc] initWithTitle:@"标题" message:@"表述文字" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"0",@"1",@"22",@"333",@"4444",@"55555",@"6",@"7",@"8",@"9",@"10", nil];
//    [actionSheet show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - DIAlertViewDelegate
- (void)alertView:(DIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex ==== %ld", (long)buttonIndex);
    [alertView removeFromSuperview];
}


- (void)actionSheet:(DIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [actionSheet removeFromSuperview];
}

@end
