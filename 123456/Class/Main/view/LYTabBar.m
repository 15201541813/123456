//
//  LYTabBar.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYTabBar.h"
#import "UIView+XMGExtension.h"
#import "LYPublishView.h"
@interface LYTabBar()
@property (nonatomic, weak) UIButton *publishButton;

@end
@implementation LYTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    }
    return self;
}


- (UIButton *)publishButton
{
    if (_publishButton == nil) {
        UIButton *publishButton = [[UIButton alloc] init];
        [self addSubview:publishButton];
        _publishButton = publishButton;
        [_publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:(UIControlStateNormal)];
        [_publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:(UIControlStateHighlighted)];
        [_publishButton sizeToFit];
        [_publishButton addTarget:self action:@selector(publishBtnClickedToPublish) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _publishButton;
}
- (void)publishBtnClickedToPublish
{
    LYPublishView *publish = [[LYPublishView alloc] init];
    [[UIApplication sharedApplication].keyWindow addSubview:publish];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.frame.size.width;
    CGFloat height = 48;
    CGFloat itemWidth = width / 5;
    self.publishButton.center = CGPointMake(width / 2, height / 2);
    NSInteger index = 0;
    for (UIView *view in self.subviews) {
        if (![view isKindOfClass:[UIControl class]] || view == self.publishButton) continue;
        view.frame = CGRectMake(index * itemWidth, 1, itemWidth, height);
        if (index >= 2) {
            view.frame = CGRectMake((index + 1) * itemWidth, 0, itemWidth, height);
        }
        index = index + 1;
    }
   
    
    
    
}

@end
