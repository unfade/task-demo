//
//  ViewController.m
//  01-wechatTask
//
//  Created by Bytedance on 2020/7/18.
//  Copyright © 2020 Bytedance. All rights reserved.
//

#import "ViewController.h"
#import "weChat.h"
#import "weChatCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UITableView *tableView;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.tableView registerClass:weChatCell.class forCellReuseIdentifier:@"status"];
    [self.view addSubview:self.tableView];
    [self buildData];

}

- (void)buildData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sessions" ofType:@"json"];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    //    NSError *error;
    if ([fileMgr fileExistsAtPath:filePath]) {
        //可以通过流的形式解析
        NSInputStream *is = [[NSInputStream alloc] initWithFileAtPath:filePath];
        [is open];
        id jsonObj = [NSJSONSerialization JSONObjectWithStream:is options:NSJSONReadingAllowFragments error:nil];
        [is close];
        NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
        [dateForm setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        if ([jsonObj isKindOfClass:[NSArray class]]) {
            _dataArr = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in (NSArray *) jsonObj) {
                weChat *model = [[weChat alloc] init];
                model.msgId = [dict objectForKey:@"_id"];
                model.pic = [NSURL URLWithString:[dict objectForKey:@"picture"]];
                model.name = [dict objectForKey:@"name"];
                model.msg = [dict objectForKey:@"message"];
                model.time = [dateForm dateFromString:[dict objectForKey:@"time"]];
                model.unreadCount = [(NSNumber *) [dict objectForKey:@"unreadCount"] intValue];
                [_dataArr addObject:model];
            }
        }
    }
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    weChatCell *cell = [weChatCell cellWithTableView:tableView];
    [cell setItemViewData:self.dataArr[indexPath.row]];
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (BOOL)prefersStatusBarHidden
{
    //return YES;
    return NO;
}


@end
