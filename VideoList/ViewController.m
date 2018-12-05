//
//  ViewController.m
//  VideoList
//
//  Created by mob on 2018/12/5.
//  Copyright © 2018年 mob. All rights reserved.
// 模仿腾讯视频 视频列表

#import "ViewController.h"
#import "ListView.h"

@interface ViewController ()
@property(nonatomic,strong)ListView *listView;
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
}

-(void)changeOffSet
{
    [self.listView.scrollView setContentOffset:CGPointMake(self.listView.scrollView.contentOffset.x + 105, self.listView.scrollView.contentOffset.y) animated:YES];
}

@end
