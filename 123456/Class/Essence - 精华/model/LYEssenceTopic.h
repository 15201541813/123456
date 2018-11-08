//
//  LYEssenceTopic.h
//  123456
//
//  Created by 李艳 on 2018/11/7.
//  Copyright © 2018年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYEssenceTopic : NSObject
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *love;
@property (nonatomic, strong) NSString *screen_name;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *cai;
@property (nonatomic, strong) NSString *repost;
@property (nonatomic, strong) NSString *profile_image;
@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, assign) CGRect textLabelFrame;
@end

NS_ASSUME_NONNULL_END
