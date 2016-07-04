//
//  DIAutoFitTextViewExample.m
//  DinoKitDemo
//
//  Created by Dino Pan on 16/7/4.
//  Copyright © 2016年 Dino. All rights reserved.
//

#import "DIAutoFitTextViewExample.h"
#import "DCFAutoFitTextView.h"

@interface DIAutoFitTextViewExample ()

@property (nonatomic, strong) DCFAutoFitTextView *autoTextView;

@property (nonatomic, strong) UILabel *label;

@end

@implementation DIAutoFitTextViewExample

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.autoTextView];
    
    [self.autoTextView sizeToFit];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
    [self.view addSubview:self.label];
    self.label.backgroundColor = [UIColor redColor];
    
    self.label.text = @"1234";
    [self.label sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DCFAutoFitTextView *)autoTextView
{
    if (!_autoTextView)
    {
        _autoTextView = [[DCFAutoFitTextView alloc] init];
        _autoTextView.frame = CGRectMake(30, 200, [UIScreen mainScreen].bounds.size.width - 60, 200);
    }
    return _autoTextView;
}


@end
