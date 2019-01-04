//
//  ViewController.m
//  SubTagDemo
//
//  Created by yf on 2018/9/27.
//  Copyright © 2018年 yf. All rights reserved.
//

#import "ViewController.h"
#import "SubTagCell.h"
#import "EqualSpaceFlowLayout.h"
#import "UICollectionViewLeftAlignedLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateLeftAlignedLayout>

@property (nonatomic,strong) UICollectionView * collectionView;
@property (nonatomic,strong) NSArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = @[@"非小细胞",@"小细胞",@"细胞",@"非小细胞细胞细胞",@"非小细胞细胞细胞细胞细胞",@"非",@"非小细胞",@"小细胞",@"细胞",@"非小细胞细胞细胞",@"非小细胞细胞细胞细胞细胞",@"非",@"非小细胞",@"小细胞",@"细胞",@"非小细胞细胞细胞",@"非小细胞细胞细胞细胞细胞"];
    
    UICollectionViewLeftAlignedLayout * flowLayout = [[UICollectionViewLeftAlignedLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0.0001;// 垂直方向的间距
    flowLayout.minimumLineSpacing = 0.0001; // 水平方向的间距
//    flowLayout.sectionInset = UIEdgeInsetsMake(15, 20, 0, 5);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width,self.view.frame.size.height-50) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    self.collectionView = collectionView;
    [self.view addSubview:self.collectionView];
    
    //注册cell
    [self.collectionView registerClass:[SubTagCell class] forCellWithReuseIdentifier:@"SubTagCell"];
    
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}


#pragma mark ---------UICollectionViewDelegate,UICollectionViewDataSource---------
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = _dataArray[indexPath.row];
    SubTagCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SubTagCell" forIndexPath:indexPath];
    cell.tagStr = str;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
}


#pragma mark -UICollectionViewDelegateLeftAlignedLayout-
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * tagStr = _dataArray[indexPath.row];
    CGSize size = [self sizeOfText:tagStr font:15];
    return CGSizeMake(size.width + 20, 25+15);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 20, 0, 5);
}

- (CGSize)sizeOfText:(NSString *)text font:(CGFloat)font
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName,nil]];
    return size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
