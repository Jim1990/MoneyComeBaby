//
//  FMBTabbarViewController.m
//  FMB
//
//  Created by jim on 15/11/13.
//  Copyright (c) 2015年 ICompany. All rights reserved.
//

#import "FMBTabbarViewController.h"

#import "FreshGoingViewController.h"
#import "LuckyCrashViewController.h"
#import "MeViewController.h"
#import "ShoppingCartViewController.h"


@interface FMBTabbarViewController ()

@end

@implementation FMBTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  self.view.backgroundColor=[UIColor redColor];
    
    
    [self createUI];
    
    
}
-(void)createUI{
    [self creatTabBarView];
    
    [self createViewController];
    
}

-(void)creatTabBarView{
    self.view.backgroundColor=[UIColor whiteColor];
    _TabbarView =[[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-49, SCREEN_WIDTH, 49)];
    _TabbarView.backgroundColor=RGBCOLOR(35, 35, 35);
    [self.view addSubview:_TabbarView];
    NSArray * normalImageArray = @[@"home_n@3x.png",@"classify_n@3x.png",@"account_tabbar_icon",@"cup_n@3x.png",@"profile_n@3x.png"];
    NSArray * selectedImageArray=@[@"home_s@3x.png",@"classify_s@3x.png",@"account_tabbar_icon",@"cup_s@3x.png",@"profile_s@3x.png"];
   
    for (int i =0; i<5; i++) {
        UIButton * btn =[[UIButton alloc]init];
        [btn setImage:[UIImage imageNamed:normalImageArray[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selectedImageArray[i]] forState:UIControlStateSelected];
        if (i == 2) {
            btn.frame=CGRectMake(i*self.view.frame.size.width/5, -16, self.view.frame.size.width/5, 60);
        } else {
            
            btn.frame=CGRectMake(i*self.view.frame.size.width/5, 0, self.view.frame.size.width/5, 49);
        }
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=100+i;
      //  [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0,100)];
        
        [_TabbarView addSubview:btn];
        if (i==0) {
            btn.selected=YES;
          
        }
        
     
    }
}

-(void)createViewController{
    self.tabBar.hidden=YES;
    
    LuckyCrashViewController *homeViewcontroller= [[LuckyCrashViewController alloc]init];
    FreshGoingViewController *classificationViewcontroller= [[FreshGoingViewController alloc]init];
    
    ShoppingCartViewController *bookVC = [[ShoppingCartViewController alloc]init];
      MeViewController *meViewController=[[MeViewController alloc]init];
    
    
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:homeViewcontroller];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:classificationViewcontroller];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:bookVC];

    UINavigationController *nav5=[[UINavigationController alloc]initWithRootViewController:meViewController];
    

    NSArray *array=@[nav1,nav2,nav3,nav5];
    self.viewControllers=array;
    
}

-(void)btnClick:(UIButton *)btn{
  
    for(UIView *view in _TabbarView.subviews){
        if([view isKindOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton *)view;
        
            if(button.tag == btn.tag) {
                button.selected = YES;
                self.selectedIndex=btn.tag-100;
    
            } else {
                button.selected = NO;

            }
            
        }
    }
    
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
