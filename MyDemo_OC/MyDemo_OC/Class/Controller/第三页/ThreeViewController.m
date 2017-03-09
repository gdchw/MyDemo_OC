//
//  ThreeViewController.m
//  MyDemo_OC
//
//  Created by GDC on 2017/3/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "ThreeViewController.h"
#import "LoginViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addLeftBarButtonItem];
}

- (void)addLeftBarButtonItem {
    UIBarButtonItem *signOut = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(signOutAction)];
    self.navigationItem.leftBarButtonItem = signOut;
}

- (void)signOutAction {
    EMError *error = [[EMClient sharedClient] logout:YES];
    if (error == nil) {
        NSLog(@"退出成功");
        AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        app.window.rootViewController = [[LoginViewController alloc] init];
    }else {
        NSLog(@"退出失败");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
