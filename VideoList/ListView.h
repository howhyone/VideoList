//
//  ListView.h
//  VideoList
//
//  Created by mob on 2018/12/5.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ListView : UIView<UIScrollViewDelegate>

@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, strong)UIView *cellView;
@property(nonatomic, strong)UIView *headView;
@property(nonatomic, strong)UIPageControl *pageControl;

@end

NS_ASSUME_NONNULL_END
