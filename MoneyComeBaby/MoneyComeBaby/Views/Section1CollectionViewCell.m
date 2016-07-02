//
//  Section1CollectionViewCell.m
//  MoneyComeBaby
//
//  Created by JIM on 16/6/20.
//  Copyright (c) 2016年 JIM. All rights reserved.
//

#import "Section1CollectionViewCell.h"

@implementation Section1CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setMessage:(indexHotModel *)model{
    NSString *str=@"http://7xu37v.com1.z0.glb.clouddn.com/";
 


        NSString *str1=[NSString stringWithFormat:@"%@%@",str,model.headImage];
       [self.imageView sd_setImageWithURL:[NSURL URLWithString:str1]];
        self.titleLabel.text=model.productTitle;
        self.numberLabel.text=[NSString stringWithFormat:@"%.2f%%",[model.spellbuyCount floatValue]/[model.spellbuyPrice floatValue]];
   
    
    
    
}
@end
