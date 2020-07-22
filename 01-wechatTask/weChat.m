//
//  wechat.m
//  01-wechatTask
//
//  Created by Bytedance on 2020/7/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "weChat.h"

@implementation weChat

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


+ (id)wechatWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
