//
//  UIImage+extension.m
//  123456
//
//  Created by 李艳 on 2018/10/30.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "UIImage+extension.h"

@implementation UIImage (extension)
+ (UIImage *)imageOriginalRenderingModeWithName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}
@end
