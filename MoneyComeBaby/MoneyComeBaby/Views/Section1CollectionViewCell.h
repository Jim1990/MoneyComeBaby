//
//  Section1CollectionViewCell.h
//  MoneyComeBaby
//
//  Created by JIM on 16/6/20.
//  Copyright (c) 2016年 JIM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Section1CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *AddCartBtn;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
-(void)setMessage:(indexHotModel *)model;
@end
