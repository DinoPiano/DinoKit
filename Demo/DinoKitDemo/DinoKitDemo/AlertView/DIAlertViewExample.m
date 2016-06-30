//
//  DIAlertViewExample.m
//  DinoKitDemo
//
//  Created by xjf on 16/6/29.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import "DIAlertViewExample.h"
#import "DIAlertView.h"

@interface DIAlertViewExample ()

@end

@implementation DIAlertViewExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    DIAlertView *alertView = [[DIAlertView alloc] initWithTitle:@"TITLE" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"1",@"2",@"3",@"4",nil];
    [self.view addSubview:alertView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
