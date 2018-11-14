//
//  UIButton+LYExtension.h
//  123456
//
//  Created by 李艳 on 2018/11/14.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LYExtension)
+ (instancetype)buttonWithTitle:(NSString *)title highTitle:(NSString *)highTitle image:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

+ (instancetype)buttonWithTitle:(NSString *)title highTitle:(NSString *)highTitle backImage:(NSString *)image backHighImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
