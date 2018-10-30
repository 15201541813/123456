//
//  LYMeViewController.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYMeViewController.h"
#import "UIBarButtonItem+extension.h"
@interface LYMeViewController ()

@end

@implementation LYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    UIBarButtonItem *item1 = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:nil];
    UIBarButtonItem *item2 = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[item2,item1];
}



@end
