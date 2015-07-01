//
//  ViewController.m
//  功能引导页
//
//  Created by Chen on 15/6/8.
//  Copyright (c) 2015年 chenweidong. All rights reserved.
//

#import "ViewController.h"
#import "WDGuideScrollView.h"

@interface ViewController ()
@property (nonatomic, strong) WDGuideScrollView *guideView;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    NSArray *imageArray = [NSArray array];
    if (ScreenHeight == 480) {
        imageArray = @[@"guide1_640x960",@"guide2_640x960",@"guide3_640x960",@"guide4_640x960"];
    } else {
        imageArray = @[@"guide1_750x1334",@"guide2_750x1334",@"guide3_750x1334",@"guide3_750x1334"];
    }
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 120, ScreenHeight == 480?15:30, 120, 38)];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"立即体验 > " forState:UIControlStateNormal];
    button.titleLabel.backgroundColor = [UIColor clearColor];;
    button.titleLabel.font = [UIFont systemFontOfSize:ScreenHeight == 480?18:20];
    [self.guideView scrollViewWithImageArray:imageArray WithButton:button];
    [self.view addSubview:self.guideView];
}

-(WDGuideScrollView *)guideView
{
    if (_guideView == nil) {
        _guideView = [[WDGuideScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        __weak typeof(self) weakSelf = self;
        _guideView.enterClick = ^{
            [UIView animateWithDuration:1.0 animations:^{
                weakSelf.guideView.hidden = YES;
            }];
        };
        [self.view addSubview:_guideView];
    }
    return _guideView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
