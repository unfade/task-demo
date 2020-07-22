//
//  weChatFrame.m
//  01-wechatTask
//
//  Created by Bytedance on 2020/7/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "weChatFrame.h"

#define NameFont [UIFont systemFontOfSize:15]
#define TextFont [UIFont systemFontOfSize:16]
#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height

@implementation weChatFrame
- (void)setWechat:(weChat *)wechat
{
    _weChatModel = wechat;

    CGFloat padding = 10;
        // 设置头像的frame
    CGFloat iconViewX = padding;
    CGFloat iconViewY = padding;
    CGFloat iconViewW = 40;
    CGFloat iconViewH = 40;
    self.iconF = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    //标题
    CGFloat titleLabelX = CGRectGetMaxX(self.iconF) + padding;
    
    //根据文字的长度和字体计算view的宽度和高度
    CGSize titleSize = [self sizeWithString:_weChatModel.time font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(250, MAXFLOAT)];
    self.nameF = CGRectMake(titleLabelX, padding, 150, titleSize.height);
    CGSize timeSize = [self sizeWithString:_weChatModel.time font:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(250, MAXFLOAT)];
    
    //时间
    CGFloat timeViewY = padding;
    CGFloat timeLabelH = timeSize.height;
    CGFloat timeLabelW = timeSize.width;
    CGFloat timeViewX = SCREENW - timeLabelW - padding;
    self.timeF = CGRectMake(timeViewX, timeViewY, timeLabelW, timeLabelH);
    
    //消息摘要
    CGFloat textLabelY = titleSize.height + 1.5 * padding;
    CGSize textSize = [self sizeWithString:_weChatModel.msg font:TextFont maxSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width, 30)];
    CGFloat textLabelW = textSize.width - 4 * padding;
    CGFloat textLabelH = textSize.height;
    self.msgF = CGRectMake(titleLabelX, textLabelY, textLabelW, textLabelH);
    
    //设置红点
    CGFloat unReadCountW = 16;
    CGFloat unReadCountH = 16;
    CGFloat unReadCountX = titleLabelX - padding - unReadCountW / 2;
    CGFloat unReadCountY = timeViewY - unReadCountH / 2;
    self.unReadCountF = CGRectMake(unReadCountX, unReadCountY, unReadCountW, unReadCountH);
    
    //cell行高
    self.cellHeight = CGRectGetMaxY(self.iconF) + padding;

}

/**
 *  计算文本的宽高
 *
 *  @param str     需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end
