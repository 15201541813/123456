//
//  LYRecommendTag.h
//  123456
//
//  Created by 李艳 on 2018/10/31.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface LYRecommendTag : NSObject
/**标签名称*/
@property (nonatomic, strong) NSString *theme_name;
/**此标签的订阅量*/
@property (nonatomic, strong) NSString *sub_number;
/**推荐标签的图片url地址*/
@property (nonatomic, strong) NSString *image_list;
/**cell高度*/
@property (nonatomic, strong) NSString *rowHeight;
@end


