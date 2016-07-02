//
//  LuckyCrashViewController.m
//  MoneyCome
//
//  Created by ajbc1823 on 16/6/17.
//  Copyright © 2016年 JIM. All rights reserved.
//

#import "LuckyCrashViewController.h"
#import "FMBTabbarViewController.h"


#import "Section0CollectionViewCell.h"
#import "Section1CollectionViewCell.h"
@interface LuckyCrashViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation LuckyCrashViewController

{
     UICollectionView *productCollectionView;
    NSMutableDictionary *Dic;
    
    UIButton *selectBtn;
}


-(void)viewDidAppear:(BOOL)animated
{
 //  self.navigationController.navigationBarHidden=YES;
//    FMBTabbarViewController *tabBarController=(FMBTabbarViewController *)self.tabBarController;
//    tabBarController.TabbarView.hidden=NO;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor blackColor];
    
    self.navigationController.navigationBarHidden=YES;
    UICollectionViewFlowLayout *CollectionViewLayout=[[UICollectionViewFlowLayout alloc]init];

    productCollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:CollectionViewLayout];
    [self.view addSubview:productCollectionView];
    productCollectionView.showsVerticalScrollIndicator=NO;
    productCollectionView.dataSource = self;
    productCollectionView.delegate = self;
    productCollectionView.bounces = NO;
    productCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    [productCollectionView registerClass:[CategoryCollectionViewCell class] forCellWithReuseIdentifier:@"CategoryCollectionViewCell"];
     [productCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CategoryCollectionViewCell"];
    /*
    [self initHeaderView];
    [self getProductTypeArraList];
     */
    
    [productCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionView"];
    
    
    
    UINib *nib = [UINib nibWithNibName:@"Section0CollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [productCollectionView registerNib:nib forCellWithReuseIdentifier:@"Section0CollectionViewCell"];
    
    
    
    
    nib = [UINib nibWithNibName:@"Section1CollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [productCollectionView registerNib:nib forCellWithReuseIdentifier:@"Section1CollectionViewCell"];
    
    
    [productCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Head"];

    [productCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    
    
    
    [self getData];
}
-(void)getData{
    Dic=[[NSMutableDictionary alloc]init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    NSString *URLString = [NSString stringWithFormat:STORE_LIST_URL, self.fc.s_cgryid.intValue];
 
    NSString *URLString = @"http://m.luckgo.hk/api/appIndex.html?1=1ver=1";
    
    [manager GET:URLString parameters:nil success:^(AFHTTPRequestOperation *  operation, id   responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        
       // 1.	indexLottery_list初始化用户得奖消息是10个
        NSArray *arr = dict[@"indexLottery_list"];
        NSMutableArray *indexLottery_list = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
//           [QXBModelTool createJsonModelWithDictionary:dict modelName:@"AllCatoryModel"];
            ProductModel *model=[ProductModel mj_objectWithKeyValues:dict];
            [indexLottery_list addObject:model];
            
          
        }
        [Dic setObject:indexLottery_list forKey:@"indexLottery_list"];
        //2.	indexImg_list 首页的轮播图
        arr= dict[@"indexImg_list"];
        NSMutableArray *indexImg_list = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
//            [QXBModelTool createJsonModelWithDictionary:dict modelName:@"indexImg"];
            IndexImgModel *model=[IndexImgModel mj_objectWithKeyValues:dict];
            [indexImg_list addObject:model];
            
            
        }
         [Dic setObject:indexImg_list forKey:@"indexImg_list"];
        //3.	indexHot_list 首页热门 ， 初始化时8个
        
        arr= dict[@"indexHot_list"];
        NSMutableArray *indexHot_list = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
//            [QXBModelTool createJsonModelWithDictionary:dict modelName:@"indexImg"];
           indexHotModel *model=[indexHotModel mj_objectWithKeyValues:dict];
            [indexHot_list addObject:model];
        }
         [Dic setObject:indexHot_list forKey:@"indexHot_list"];
        [productCollectionView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
        
    }];

}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    

        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionView" forIndexPath:indexPath];
    headerView.backgroundColor=[UIColor whiteColor];
    NSArray *array=[NSArray arrayWithObjects:@"人气",@"最新",@"进度",@"总需人数",nil];
    if (!selectBtn) {
        for (int i=0; i<4; i++) {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, 50)];
            [headerView addSubview:btn];
            [btn setTitle:array[i] forState:UIControlStateNormal];
            [btn setTitle:array[i] forState:UIControlStateSelected];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag=i;
            if (i==0) {
                btn.selected=YES;
                selectBtn=btn;
            }
        }
    }

        
        
        return headerView;
  
    

}

-(void)btnClick:(UIButton *)btn{
    
    selectBtn.selected=NO;
    selectBtn=btn;
    btn.selected=YES;

    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(0, 0);
    }
    CGSize size={SCREEN_WIDTH,45};
    return size;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
//    return collectionViewList.count;
    if (section==0) {
        return 1;
    }
    if (section==1) {
          return 10;
    }
    return 10;
    
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.section==0) {
        
    
        Section0CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Section0CollectionViewCell" forIndexPath:indexPath];
        [cell setMessage:Dic];
//        cell.backgroundColor=[UIColor yellowColor];
        
        
        return cell;
    }
    
    
    Section1CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Section1CollectionViewCell" forIndexPath:indexPath];
    NSArray *array=  Dic[@"indexHot_list"];
    indexHotModel *model=array[indexPath.row];
    [cell setMessage:model];
   
    return cell;
    
    
    
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    UIEdgeInsets top = {5,5,5,5};
    return top;
}
//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section==0) {
         return CGSizeMake((SCREEN_WIDTH-10),250);
    }

    return CGSizeMake((SCREEN_WIDTH-20)/2,(SCREEN_WIDTH-20)/2+20);
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
