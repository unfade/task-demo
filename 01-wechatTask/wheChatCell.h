//
//  wheChatCell.h
//  01-wechatTask
//
//  Created by Bytedance on 2020/7/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NJWeiboFrame;

NS_ASSUME_NONNULL_BEGIN

@interface wheChatCell : UITableViewCell

@property (nonatomic, strong) NJWeiboFrame *weiboFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
