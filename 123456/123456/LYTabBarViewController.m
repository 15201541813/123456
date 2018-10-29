//
//  LYTabBarViewController.m
//  123456
//
//  Created by 李艳 on 2018/10/29.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYTabBarViewController.h"
#import "LYNavigationController.h"
#import "LYTopicViewController.h"
#import "LYNavigationController.h"
@interface LYTabBarViewController ()

@end

@implementation LYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LYTopicViewController *top1 = [[LYTopicViewController alloc] init];
    LYNavigationController *nav1 = [[LYNavigationController alloc] initWithRootViewController:top1];
    top1.view.backgroundColor = [UIColor redColor];
    top1.title = @"精华";
    LYTopicViewController *top2 = [[LYTopicViewController alloc] init];
    LYNavigationController *nav2 = [[LYNavigationController alloc] initWithRootViewController:top2];
    top2.view.backgroundColor = [UIColor yellowColor];
    top2.title = @"新帖";
    LYTopicViewController *top3 = [[LYTopicViewController alloc] init];
    LYNavigationController *nav3 = [[LYNavigationController alloc] initWithRootViewController:top3];
    top3.view.backgroundColor = [UIColor blueColor];
    top3.title = @"关注";
    LYTopicViewController *top4 = [[LYTopicViewController alloc] init];
    LYNavigationController *nav4 = [[LYNavigationController alloc] initWithRootViewController:top4];
    top4.view.backgroundColor = [UIColor greenColor];
    top4.title = @"我";
    
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
    [self addChildViewController:nav1];
    [self addChildViewController:nav2];
    [self addChildViewController:nav3];
    [self addChildViewController:nav4];
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
