//
//  MyTextField.h
//  MyDemo_OC
//
//  Created by GDC on 2017/3/8.
//  Copyright © 2017年 GDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTextField : UITextField

/**
 快速创建 UITextField

 @param frame frame
 @param placeholder placeholder
 @return UITextField
 */
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder leftTitle:(NSString *)leftTitle;

@end
