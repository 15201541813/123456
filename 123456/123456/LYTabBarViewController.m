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
#import "UIImage+extension.h"
@interface LYTabBarViewController ()

@end

@implementation LYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setWithController:[[LYTopicViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setWithController:[[LYTopicViewController alloc] init] title:@"新帖" image:@"tabBar_essence_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setWithController:[[LYTopicViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setWithController:[[LYTopicViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

- (void)setWithController:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    
    LYNavigationController *nav = [[LYNavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
    controller.view.backgroundColor = [UIColor colorWithRed:arc4random()%255 / 255.0 green:arc4random()%255 / 255.0 blue:arc4random()%255 / 255.0 alpha:1];
    controller.tabBarItem.title = title;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor grayColor];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    NSMutableDictionary *selectedDic = [NSMutableDictionary dictionary];
    selectedDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    selectedDic[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [controller.tabBarItem setTitleTextAttributes:dic forState:(UIControlStateNormal)];
    [controller.tabBarItem setTitleTextAttributes:selectedDic forState:(UIControlStateSelected)];
    controller.tabBarItem.image = [UIImage imageOriginalRenderingModeWithName:image];
    controller.tabBarItem.selectedImage = [UIImage imageOriginalRenderingModeWithName:selectedImage];
    
}

@end
