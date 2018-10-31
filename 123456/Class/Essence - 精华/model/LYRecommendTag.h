//
//  LYRecommendTag.h
//  123456
//
//  Created by 李艳 on 2018/10/31.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYRecommendTag : NSObject
/**标签名称*/
@property (nonatomic, weak) NSString *theme_name;
/**此标签的订阅量*/
@property (nonatomic, weak) NSString *sub_number;
/**推荐标签的图片url地址*/
@property (nonatomic, weak) NSString *image_list;
@end

NS_ASSUME_NONNULL_END
