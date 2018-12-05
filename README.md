# VideoList
模仿腾讯视频的播放列表

 setContentOffSet方法执行才会执行这个回调
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (_scrollView.contentOffset.x == 0.0) {
        _headView.hidden = YES;
    }
}

scrollView 的 pageingEnabel属性 和pageControl 配置使用
page的width 和 当前的scroll的frame.size.width 一样
