//
//  LYPlaveHoderTextField.m
//  123456
//
//  Created by 李艳 on 2018/11/6.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYPlaveHoderTextField.h"

@implementation LYPlaveHoderTextField
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self resignFirstResponder];
        self.textColor = [UIColor whiteColor];
        self.tintColor = self.textColor;
    }
    return self;
}
- (BOOL)becomeFirstResponder
{
    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    return [super resignFirstResponder];
}
@end
