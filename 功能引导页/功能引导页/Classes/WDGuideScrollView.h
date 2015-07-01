//
//  WDGuideScrollView.h
//  功能引导页
//
//  Created by Chen on 15/6/8.
//  Copyright (c) 2015年 chenweidong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define RGB(r, g, b)                        [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

typedef void (^ENTER_BUTTON_CLICK)();
@interface WDGuideScrollView : UIView

@property (nonatomic, copy) ENTER_BUTTON_CLICK enterClick;

- (void)scrollViewWithImageArray:(NSArray *)imageArray WithButton:(UIButton *)button;

@end
