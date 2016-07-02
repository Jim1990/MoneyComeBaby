//
//  Section0CollectionViewCell.h
//  MoneyComeBaby
//
//  Created by JIM on 16/6/20.
//  Copyright (c) 2016年 JIM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Section0CollectionViewCell : UICollectionViewCell<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *AdscrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

-(void)setMessage:(NSDictionary *)dic;
@end
