//
//  ListView.m
//  VideoList
//
//  Created by mob on 2018/12/5.
//  Copyright © 2018年 mob. All rights reserved.
//

#import "ListView.h"

@implementation ListView

-(id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 100)];
        _scrollView.contentSize = CGSizeMake(105 * 10, 100);
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled= YES;
        UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 10, 100, 80)];
        pageControl.numberOfPages = 5;
        pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
        pageControl.pageIndicatorTintColor = [UIColor redColor];
        [pageControl addTarget:self action:@selector(pageChange) forControlEvents:UIControlEventTouchUpOutside];
        self.pageControl = pageControl;
      
        [self addSubview:_scrollView];
//          [self addSubview:pageControl];
        for (int i = 0; i < 105 * 10 / (100 + 5); i++) {
            _cellView = [[UIView alloc] initWithFrame:CGRectMake(i * (100+5), 10, 100, 80)];
            _cellView.layer.cornerRadius = 0.3;
            _cellView.backgroundColor = [UIColor darkGrayColor];
            [_scrollView addSubview:_cellView];
            
        }
        
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 100)];
        _headView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_headView];
        _headView.hidden = YES;
    }
    return self;
}

-(void)pageChange
{
    NSInteger page = _pageControl.currentPage;
    CGFloat offSetX = page * _pageControl.frame.size.width;
    [UIView beginAnimations:nil context:nil];
    _scrollView.contentOffset = CGPointMake(offSetX, 0);
    [UIView commitAnimations];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_scrollView.contentOffset.x != 0.0) {
        _headView.hidden = NO;
    }
}
//setContentOffSet方法执行才会执行这个回调
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (_scrollView.contentOffset.x == 0.0) {
        _headView.hidden = YES;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_scrollView.contentOffset.x == 0.0) {
        _headView.hidden = YES;
    }
}

@end
