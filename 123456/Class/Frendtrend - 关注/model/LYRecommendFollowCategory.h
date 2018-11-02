//
//  LYRecommendFollowCategory.h
//  123456
//
//  Created by 李艳 on 2018/11/2.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYRecommendFollowCategory : NSObject
/**total    int    左侧标签总数
 list    array    标签数组
 name    string    标签名称
 count    string    此标签下的用户数
 id    string    标签id
*/
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) NSInteger total;
@end

NS_ASSUME_NONNULL_END
