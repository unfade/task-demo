//
//  weChatFrame.h
//  01-wechatTask
//
//  Created by Bytedance on 2020/7/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "weChat.h"
@class weChat;

NS_ASSUME_NONNULL_BEGIN

@interface weChatFrame : NSObject

//头像
@property (nonatomic, assign) CGRect iconF;

//昵称
@property (nonatomic, assign) CGRect nameF;

//消息内容
@property (nonatomic, assign) CGRect msgF;

//时间
@property (nonatomic, assign) CGRect timeF;

//未读消息
@property (nonatomic, assign) CGRect unReadCountF;


//行高
@property (nonatomic, assign) CGFloat cellHeight;

//模型数据
@property (nonatomic, strong) weChat *weChatModel;

@end

NS_ASSUME_NONNULL_END
