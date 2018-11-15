//
//  LYStatusClickView.m
//  123456
//
//  Created by 李艳 on 2018/11/15.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYStatusClickView.h"

@implementation LYStatusClickView
static UIWindow *window_;

+ (void)show
{
    window_ = [[UIWindow alloc] init];
    window_.frame = CGRectMake(0, 20, LYScreenWidth, 20);
    window_.backgroundColor = [UIColor blueColor];
    window_.hidden = NO;
    window_.windowLevel = UIWindowLevelAlert;
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(statusDidClicked)];
    [window_ addGestureRecognizer:ges];
}
+ (void)statusDidClicked
{
    UIWindow *keyWind = [UIApplication sharedApplication].keyWindow;
    [self searchCorrectView:keyWind];
    
    
}

+ (void)searchCorrectView:(UIView *)view
{
    for (UIScrollView *subView in view.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]] && [subView isShowingOnKeyWindow]) {
            CGPoint point = subView.contentOffset;
            point.y = -subView.contentInset.top;
            [subView setContentOffset:point animated:YES];
        }
        [self searchCorrectView:subView];
    }
    
}
@end
