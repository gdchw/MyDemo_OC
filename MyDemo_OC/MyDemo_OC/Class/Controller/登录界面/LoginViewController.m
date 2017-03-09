//
//  LoginViewController.m
//  MyDemo_OC
//
//  Created by GDC on 2017/3/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "LoginViewController.h"
#import "MainController.h"


@interface LoginViewController ()

@property (nonatomic, strong) MyTextField *user_Name;
@property (nonatomic, strong) MyTextField *user_Password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    [self setupUI];
}

- (void)setupUI{
    _user_Name = [[MyTextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30) placeholder:@"请输入用户名" leftTitle:@"用户名"];
    _user_Name.center = CGPointMake(self.view.centerX, self.view.centerY - 25);
    [self.view addSubview:_user_Name];
    
    _user_Password = [[MyTextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30) placeholder:@"请输入密码" leftTitle:@"密码"];
    _user_Password.center = CGPointMake(self.view.centerX, self.view.centerY + 25);
    [self.view addSubview:_user_Password];
    
    
    MyButton *loginButton = [[MyButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30) title:@"登录"];
    loginButton.center = CGPointMake(self.view.centerX - 50, self.view.centerY + 80);
    [loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    MyButton *registerButton = [[MyButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30) title:@"注册"];
    registerButton.center = CGPointMake(self.view.centerX + 50, self.view.centerY + 80);
    [registerButton addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    
    

    
}

// 登录
- (void)loginAction {
    EMError *error = [[EMClient sharedClient] loginWithUsername:_user_Name.text password:_user_Password.text];
    if (error == nil) {
        NSLog(@"登录成功");
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        app.window.rootViewController = [[MainController alloc] init];
    }else {
        NSLog(@"登录失败");
    }
}

// 注册
- (void)registerAction {
    EMError *error = [[EMClient sharedClient]  registerWithUsername:_user_Name.text password:_user_Password.text];
    if (error == nil) {
        NSLog(@"注册成功");
    }else {
        NSLog(@"注册失败");
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {

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
