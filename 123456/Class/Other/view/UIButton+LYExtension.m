//
//  UIButton+LYExtension.m
//  123456
//
//  Created by 李艳 on 2018/11/14.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "UIButton+LYExtension.h"
static UIButton *btn;
@implementation UIButton (LYExtension)
+ (instancetype)buttonWithTitle:(NSString *)title highTitle:(NSString *)highTitle image:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    btn = [[UIButton alloc] init];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitle:highTitle forState:(UIControlStateHighlighted)];
    [btn setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:highImage] forState:(UIControlStateHighlighted)];
    [btn addTarget:target action:@selector(action) forControlEvents:(UIControlEventTouchUpInside)];
    return btn;
}

+ (instancetype)buttonWithTitle:(NSString *)title highTitle:(NSString *)highTitle backImage:(NSString *)image backHighImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    btn = [[UIButton alloc] init];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitle:highTitle forState:(UIControlStateHighlighted)];
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:(UIControlStateHighlighted)];
    [btn addTarget:target action:@selector(action) forControlEvents:(UIControlEventTouchUpInside)];
    return btn;
}
@end
