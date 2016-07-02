//
//  Section0CollectionViewCell.m
//  MoneyComeBaby
//
//  Created by JIM on 16/6/20.
//  Copyright (c) 2016年 JIM. All rights reserved.
//

#import "Section0CollectionViewCell.h"

@implementation Section0CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setMessage:(NSMutableDictionary *)dic{
    
    if (dic!=nil) {
        // http://7xu37v.com1.z0.glb.clouddn.com/3234d1ad4fab42e5baa8daf999aba20a.jpg
        NSString *str=@"http://7xu37v.com1.z0.glb.clouddn.com/";
        NSMutableArray* array=dic[@"indexImg_list"];
        if (array!=nil) {
            for (int i=0; i<array.count; i++) {
                UIImageView *imageView= [[UIImageView alloc]initWithFrame:CGRectMake(self.AdscrollView.frame.size.width*i, 0, self.AdscrollView.frame.size.width, self.AdscrollView.frame.size.height)];
                IndexImgModel *model=array[i];
                
                
                
                NSString *str1=[NSString stringWithFormat:@"%@%@",str,model.proImg];
                [imageView sd_setImageWithURL:[NSURL URLWithString:str1] placeholderImage:[UIImage imageNamed:@"default"]];
                [self.AdscrollView addSubview:imageView];
                
            }
            self.AdscrollView.contentSize=CGSizeMake(self.AdscrollView.frame.size.width*array.count, self.AdscrollView.frame.size.height);
            self.AdscrollView.pagingEnabled=YES;
            self.AdscrollView.showsHorizontalScrollIndicator=NO;
            self.AdscrollView.delegate=self;
        }
        self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(self.AdscrollView.frame.size.width/2-50, self.AdscrollView.frame.size.height-40, 100, 40)] ;
        self.pageControl.numberOfPages=array.count;
        self.pageControl.currentPageIndicatorTintColor=[UIColor yellowColor];
        [self addSubview: self.pageControl];
        NSArray *array1=[NSArray arrayWithObjects:@"分类",@"土豪专区",@"晒单",@"常见问题",nil];
        
        for (int i=0; i<4; i++) {
            UIButton *btn= [[UIButton alloc]initWithFrame:CGRectMake(  self.frame.size.width/4*i, CGRectGetMaxY( self.AdscrollView.frame), self.frame.size.width/4, 100)];
            
            
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(btn.frame.size.width/2-25, 10, 50, 50)];
            imageView.backgroundColor=[UIColor blackColor];
            [btn addSubview:imageView];
            
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame)+5, btn.frame.size.width, 20)];
            label.textAlignment=NSTextAlignmentCenter;
            label.text=array1[i];
            label.textColor=[UIColor blackColor];
            [btn addSubview:label];
            
            
            btn.backgroundColor=[UIColor whiteColor];
            [self addSubview:btn];
            
            
    
            
            
        }
  
        
        
    }

 
   
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page= scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pageControl.currentPage=page;
}



@end
