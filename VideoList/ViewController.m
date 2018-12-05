//
//  ViewController.m
//  VideoList
//
//  Created by mob on 2018/12/5.
//  Copyright © 2018年 mob. All rights reserved.
// 模仿腾讯视频 视频列表

#import "ViewController.h"
#import "ListView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define viewX  ScreenWidth / 2
@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)ListView *listView;
@property(nonatomic, strong)UIPageControl *pageControl;
@property(nonatomic, strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ListView *listView = [[ListView alloc] initWithFrame:CGRectMake((ScreenWidth - 300) / 2 , 100, 300, 100)];

    self.listView = listView;
    [self.view addSubview:self.listView];
    
    UIButton *offsetBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth - 200) / 2, 0, 100, 50)];
    [offsetBtn setBackgroundColor:[UIColor purpleColor]];
    [offsetBtn addTarget:self action:@selector(changeOffSet) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:offsetBtn];
    
    [self pageControlInfo];
}

//创建pageing属性的scrollView 和pageControl
-(void)pageControlInfo
{
    UIScrollView *scroll = [[UIScrollView alloc] init];
    scroll.frame = CGRectMake((ScreenWidth - 300) / 2, 300, 300, 100);
    scroll.delegate = self;
    scroll.bounces = YES;
    [self.view addSubview:scroll];
    self.scrollView = scroll;
    
    for (int i = 0; i < 5; i++) {
        UIView *pageView = [[UIView alloc] init];
        CGFloat x = i * scroll.frame.size.width;
        pageView.frame = CGRectMake(x, 0, 300, 100);
        NSArray *colorArray  = [NSArray arrayWithObjects:[UIColor yellowColor],[UIColor redColor],[UIColor purpleColor],[UIColor blackColor],[UIColor greenColor],nil];
        
        pageView.backgroundColor = colorArray[i];
        [scroll addSubview:pageView];
    }
    
    scroll.contentSize = CGSizeMake(5 * 300, 0);
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.pagingEnabled = YES;
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake((ScreenWidth - 150) / 2, 500, 150, 50);
    pageControl.numberOfPages = 5;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    [pageControl addTarget:self action:@selector(pageChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}
//分页改变执行的事件
-(void)pageChange
{
    NSLog(@"改变分页");
}
//测试偏移量回调
-(void)changeOffSet
{
    [self.listView.scrollView setContentOffset:CGPointMake(self.listView.scrollView.contentOffset.x + 105, self.listView.scrollView.contentOffset.y) animated:YES];
}

//改变分页
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    fabs 返回一个实数的绝对值  |x|
    int index = fabs(scrollView.contentOffset.x)/300;
    _pageControl.currentPage = index;
}

@end
