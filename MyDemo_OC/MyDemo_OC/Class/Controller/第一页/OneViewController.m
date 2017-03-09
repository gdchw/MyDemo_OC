//
//  OneViewController.m
//  MyDemo_OC
//
//  Created by GDC on 2017/3/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()<UITableViewDelegate, UITableViewDataSource, EMContactManagerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSMutableArray *dataArray;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
    self.dataArray = [NSMutableArray array];
    
    [self setupUI];
    
    
}

#pragma mark - EMContactManagerDelegate 好友申请相关协议
// 收到好友申请的回调
- (void)didReceiveFriendInvitationFromUsername:(NSString *)aUsername message:(NSString *)aMessage {
    NSLog(@"用户:%@ 向你发送好友请求信息：%@",aUsername, aMessage);
    NSString *message = [NSString stringWithFormat:@"用户:%@ 向你发送好友请求：%@",aUsername, aMessage];
    [self.dataArray addObject:message];
    [self.tableView reloadData];
    [[EMClient sharedClient].contactManager approveFriendRequestFromUser:aUsername completion:^(NSString *aUsername, EMError *aError) {
        if (!aError) {
            NSLog(@"同意添加：%@为好友",aUsername);
        }
    }];
}

// 好友申请同意后的回调
- (void)didReceiveAgreedFromUsername:(NSString *)aUsername {
    NSLog(@"用户%@同意了添加你为好友",aUsername);
}

// 好友申请拒绝后的回调
- (void)didReceiveAddedFromUsername:(NSString *)aUsername {
    NSLog(@"用户%@拒绝添加你为好友",aUsername);
}

- (void)setupUI {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [[EMClient sharedClient].contactManager removeDelegate:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
