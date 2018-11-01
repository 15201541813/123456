//
//  LYEssenceViewController.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYEssenceViewController.h"
#import "UIBarButtonItem+extension.h"
#import "LYRecommendTagController.h"
@interface LYEssenceViewController ()

@end

@implementation LYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //界面基本设置
    [self basicSetting];
}
#pragma mark - basicSetting界面基本设置
- (void)basicSetting
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(buttonClick)];
}
#pragma mark - buttonClick
- (void)buttonClick
{
    LYRecommendTagController *tag = [[LYRecommendTagController alloc] init];
    [self.navigationController pushViewController:tag animated:YES];
}

@end
