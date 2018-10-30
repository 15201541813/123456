//
//  LYNewViewController.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYNewViewController.h"
#import "UIBarButtonItem+extension.h"
@interface LYNewViewController ()

@end

@implementation LYNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(buttonClick)];
}

- (void)buttonClick
{
    NSLog(@"kjkj");
}

@end
