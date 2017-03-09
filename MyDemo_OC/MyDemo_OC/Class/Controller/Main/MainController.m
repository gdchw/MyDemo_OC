//
//  MainController.m
//  MyDemo_OC
//
//  Created by GDC on 2017/3/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "MainController.h"
#import "BaseViewController.h"
#import "BaseNavigationController.h"

@interface MainController ()

@property (nonatomic, copy) NSMutableArray <UIViewController *>*viewCs;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self addControllers];
}

- (void)addControllers {
    NSArray *controllers = @[@{@"className": @"OneViewController", @"title": @"消息"},
                             @{@"className": @"TwoViewController", @"title": @"好友"},
                             @{@"className": @"ThreeViewController", @"title": @"我的"}];
    _viewCs = [NSMutableArray array];
    for (int i = 0; i < controllers.count; i++) {
        Class class = NSClassFromString(controllers[i][@"className"]);
        BaseViewController *vc = [[class alloc] init];
        vc.title = controllers[i][@"title"];
        BaseNavigationController *nvc = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [_viewCs addObject:nvc];
        
    }
    self.viewControllers = _viewCs;
}

- (UIViewController *)controller:(NSDictionary *)dic {
    return nil;
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
