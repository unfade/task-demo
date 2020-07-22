//
//  weChatCell.h
//  01-wechatTask
//
//  Created by Bytedance on 2020/7/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weChat.h"

NS_ASSUME_NONNULL_BEGIN

@interface weChatCell : UITableViewCell


- (void)setItemViewData:(weChat *)data;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end

NS_ASSUME_NONNULL_END
