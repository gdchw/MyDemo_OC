//
//  MyTextField.m
//  MyDemo_OC
//
//  Created by GDC on 2017/3/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder leftTitle:(NSString *)leftTitle{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeholder = placeholder;
        self.backgroundColor = [UIColor grayColor];
        
        self.minimumFontSize = 15;
        
        
        UILabel *leftView = [[UILabel alloc] init];
        leftView.frame = CGRectMake(0, 0, self.width/3, self.frame.size.height);
        leftView.text = leftTitle;
        leftView.backgroundColor = [UIColor greenColor];
        
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView = leftView;
        
    }
    return self;
}

@end
