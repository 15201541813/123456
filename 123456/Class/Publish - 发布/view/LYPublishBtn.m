//
//  LYPublishBtn.m
//  123456
//
//  Created by 李艳 on 2018/11/13.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYPublishBtn.h"

@implementation LYPublishBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.width;
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}

- (BOOL)isHighlighted
{
    return NO;
}
@end
