//
//  ViewController.m
//  VideoList
//
//  Created by mob on 2018/12/5.
//  Copyright © 2018年 mob. All rights reserved.
// 模仿腾讯视频 视频列表

#import "ViewController.h"
#import "ListView.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)ListView *listView;
@property(nonatomic, strong)UIPageControl *pageControl;
@property(nonatomic, strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ListView *listView = [[ListView alloc] initWithFrame:CGRectMake(100, 100, 300, 100)];
    self.listView = listView;
    [self.view addSubview:listView];
    
    UIButton *offsetBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 100, 50)];
    [offsetBtn setBackgroundColor:[UIColor purpleColor]];
    [offsetBtn addTarget:self action:@selector(changeOffSet) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:offsetBtn];
    
    [self pageControlInfo];
}

-(void)pageControlInfo
{
    UIScrollView *scroll = [[UIScrollView alloc] init];
    scroll.frame = CGRectMake(100, 300, 300, 100);
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
    pageControl.frame = CGRectMake(200, 500, 150, 50);
//    pageControl.center = CGPointMake(300 * 0.5, 100-50);
    pageControl.numberOfPages = 5;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    [pageControl addTarget:self action:@selector(pageChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    scroll.delegate = self;
    scroll.bounces = YES;
    
    
}

-(void)pageChange
{
    NSInteger page = _pageControl.currentPage;
    CGFloat offSetX = page * _pageControl.frame.size.width;
    [UIView beginAnimations:nil context:nil];
    _scrollView.contentOffset = CGPointMake(offSetX, 0 );
    [UIView commitAnimations];
}

-(void)changeOffSet
{
    [self.listView.scrollView setContentOffset:CGPointMake(self.listView.scrollView.contentOffset.x + 105, self.listView.scrollView.contentOffset.y) animated:YES];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = fabs(scrollView.contentOffset.x)/300;
    _pageControl.currentPage = index;
}

@end
