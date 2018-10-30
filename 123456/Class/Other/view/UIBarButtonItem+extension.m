//
//  UIBarButtonItem+extension.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "UIBarButtonItem+extension.h"

@implementation UIBarButtonItem (extension)
+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:highImage] forState:(UIControlStateHighlighted)];
    [btn addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return buttonItem;
}
@end
