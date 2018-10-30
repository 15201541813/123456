//
//  LYFriendTrendsViewController.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYFriendTrendsViewController.h"
#import "UIBarButtonItem+extension.h"
@interface LYFriendTrendsViewController ()

@end

@implementation LYFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(buttonClick)];
}

- (void)buttonClick
{
    
}

@end
