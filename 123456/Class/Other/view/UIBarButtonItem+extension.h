//
//  UIBarButtonItem+extension.h
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (extension)
+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
