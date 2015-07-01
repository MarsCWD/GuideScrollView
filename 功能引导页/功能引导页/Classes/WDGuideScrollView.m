//
//  WDGuideScrollView.m
//  功能引导页
//
//  Created by Chen on 15/6/8.
//  Copyright (c) 2015年 chenweidong. All rights reserved.
//

#import "WDGuideScrollView.h"
#import "UIImage+Color.h"

@interface WDGuideScrollView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView  *guideScrollView;
@property (nonatomic, strong) UIPageControl *imagePageControl;
@property (nonatomic, strong) NSMutableArray *views;
@end

@implementation WDGuideScrollView

- (void)scrollViewWithImageArray:(NSArray *)imageArray WithButton:(UIButton *)button
{
    for (int i = 0; i < imageArray.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * ScreenWidth, 0, ScreenWidth, ScreenHeight)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[imageArray objectAtIndex:i]]];
        if (i == imageArray.count - 1) {
            imageView.userInteractionEnabled = YES;
            [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:button];
        }
        [self.guideScrollView addSubview:imageView];
    }
    self.guideScrollView.contentSize = CGSizeMake((imageArray.count) * ScreenWidth, 0);
    //系统自带的点太小，自定义下面的点
    [self updateCount:(int)imageArray.count pointWidth :15 height:12 width:12];
    //    self.imagePageControl.numberOfPages = imageArray.count;
}

- (UIScrollView *)guideScrollView
{
    if (_guideScrollView == nil) {
        _guideScrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _guideScrollView.backgroundColor = [UIColor clearColor];
        _guideScrollView.pagingEnabled = YES;
        _guideScrollView.bounces = NO;
        _guideScrollView.delegate = self;
        _guideScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_guideScrollView];
    }
    return _guideScrollView;
}

//- (UIPageControl *)imagePageControl
//{
//    if (_imagePageControl == nil) {
//        _imagePageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
//        _imagePageControl.center = CGPointMake(self.guideScrollView.frame.size.width/2, ScreenHeight == 480?ScreenHeight - 18:ScreenHeight - 36);
//        _imagePageControl.backgroundColor = [UIColor clearColor];
//        _imagePageControl.pageIndicatorTintColor = RGB(219,219,219);
//        _imagePageControl.currentPageIndicatorTintColor = RGB(155,155,155);
//        _imagePageControl.enabled = NO;
//        [self addSubview:_imagePageControl];
//    }
//    return _imagePageControl;
//}

- (void)buttonClick
{
    if (self.enterClick) {
        self.enterClick();
    }
}

#pragma mark ScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (self.guideScrollView.contentOffset.x + scrollView.frame.size.width / 2) / ScreenWidth;
    //    self.imagePageControl.currentPage = page;
    [self selectedWithIndex:page];
}

//设置下方圆点位置
- (void)updateCount:(int)count
         pointWidth:(float)pointWidth
             height:(float)height
              width:(float)width{
    float itemX = (ScreenWidth - (count - 1) * pointWidth - count*width)*0.5;
    self.views = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        UIImageView * pointView = [[UIImageView alloc]initWithFrame:CGRectMake(itemX + i*(width + pointWidth) , ScreenHeight == 480?ScreenHeight - 14 - height:ScreenHeight - 36 - height, width, height)];
        pointView.layer.masksToBounds = YES;
        pointView.layer.cornerRadius = pointView.frame.size.width/2;
        pointView.image = [UIImage imageWithSolidColor:RGB(226, 226, 226) size:pointView.frame.size];
        pointView.highlightedImage = [UIImage imageWithSolidColor:RGB(171, 171, 171) size:pointView.frame.size];
        [self.views addObject:pointView];
        [self addSubview:pointView];
        if (i == 0) {
            pointView.highlighted = YES;
        }
    }
}

- (void)selectedWithIndex:(int)index
{
    for (UIImageView *v in self.views) {
        v.highlighted = NO;
    }
    UIImageView *view = [self.views objectAtIndex:index];
    view.highlighted = YES;
}

@end
