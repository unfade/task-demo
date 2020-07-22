//
//  weChatCell.m
//  01-wechatTask
//
//  Created by Bytedance on 2020/7/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "weChatCell.h"
#import "weChatFrame.h"
#import "weChat.h"


#define NameFont [UIFont systemFontOfSize:16]
#define TextFont [UIFont systemFontOfSize:14]
#define SCREENW [[UIScreen mainScreen] bounds].size.width

@interface weChatCell ()

//头像
@property (nonatomic, weak) UIImageView *iconView;

//名称
@property (nonatomic, weak) UILabel *nameLabel;

//消息内容
@property (nonatomic, weak) UILabel *msgLabel;

//时间
@property (nonatomic, weak) UILabel *timeLabel;

//消息条数
@property (nonatomic, weak) UILabel *msgCount;

//未读消息数
@property(nonatomic,weak) UILabel *unReadCountLable;



@end


@implementation weChatCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
    static NSString *identifier = @"status";
   
    weChatCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[weChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 1.创建头像
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        iconView.layer.cornerRadius = 4;
        [self.contentView addSubview:iconView];
        self.iconView = iconView;

        // 2.创建昵称
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(88, 5, 200, 20)];
        nameLabel.font = NameFont;
        //nameLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;


        // 4.创建正文
        UILabel *introLabel = [[UILabel alloc] initWithFrame:CGRectMake(88, 28, SCREENW - 80 - 20, 40)];
        introLabel.font = TextFont;
        introLabel.numberOfLines = 0;
        introLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:introLabel];
        self.msgLabel = introLabel;
        
        //创建时间
        UILabel *timeLine = [[UILabel alloc] initWithFrame:CGRectMake(SCREENW - 60, 5, 60, 20)];
        timeLine.font = TextFont;
        timeLine.numberOfLines = 0;
        [self.contentView addSubview:timeLine];
        self.timeLabel = timeLine;
        
        
        //创建未读点
        UILabel *unReadLabel = [[UILabel alloc] initWithFrame:CGRectMake(72, 3 , 13, 13)];
        unReadLabel.layer.cornerRadius = 5;
        unReadLabel.font = [UIFont systemFontOfSize:10];
        unReadLabel.numberOfLines = 0;
        unReadLabel.backgroundColor = [UIColor redColor];
        unReadLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:unReadLabel];
        self.unReadCountLable = unReadLabel;


    }
    return self;
}





- (void)setItemViewData:(weChat*)data
{
    NSLog(@"*************");
    NSLog([data.pic absoluteString]);
    
    
    NSData *pic0 = [[NSData alloc] initWithContentsOfURL: data.pic];
    UIImage *p = [UIImage imageWithData:pic0];
    self.iconView.image = p;
    self.nameLabel.text = data.name;
    self.msgLabel.text = data.msg;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:data.time];
   
    self.timeLabel.text = strDate;
    if (data.unreadCount <= 0) {
        self.unReadCountLable.hidden = YES;
    } else {
        self.unReadCountLable.hidden = NO;
        if (data.unreadCount > 99) {
            self.unReadCountLable.text = @"99+";
        } else {
            self.unReadCountLable.text = [NSString stringWithFormat:@"%i", data.unreadCount];
        }
    }
}


@end
    
