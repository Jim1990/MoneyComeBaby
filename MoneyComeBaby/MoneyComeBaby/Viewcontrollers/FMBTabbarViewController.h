//
//  FMBTabbarViewController.h
//  FMB
//
//  Created by jim on 15/11/13.
//  Copyright (c) 2015年 ICompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMBTabbarViewController : UITabBarController

@property(strong,nonatomic) UIView * TabbarView;
-(void)btnClick:(UIButton *)btn;
@end
