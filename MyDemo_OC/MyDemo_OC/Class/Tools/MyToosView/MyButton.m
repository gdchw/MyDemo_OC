//
//  MyButton.m
//  MyDemo_OC
//
//  Created by GDC on 2017/3/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return self;
}

@end
