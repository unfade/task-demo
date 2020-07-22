//
//  wechat.h
//  01-wechatTask
//
//  Created by Bytedance on 2020/7/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface weChat : NSObject

@property(nonatomic,copy) NSString *msgId;

@property(nonatomic,copy) NSURL *pic;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *msg;

@property(nonatomic,copy) NSDate *time;

@property(nonatomic,assign) int unreadCount;


@end

NS_ASSUME_NONNULL_END
