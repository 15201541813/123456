//
//  LYRecommendFollowCategory.m
//  123456
//
//  Created by 李艳 on 2018/11/2.
//  Copyright © 2018年 LY. All rights reserved.
//

#import "LYRecommendFollowCategory.h"
#import <MJExtension.h>
@implementation LYRecommendFollowCategory
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"ID" : @"id",
             };
}

- (NSMutableArray *)users
{
    if (_users == nil) {
        _users = [NSMutableArray array];
    }return _users;
}
@end
