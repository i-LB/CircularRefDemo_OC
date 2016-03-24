//
//  TwoViewController.h
//  CircularRefDemo_OC
//
//  Created by SYZ on 16/3/19.
//  Copyright © 2016年 iSyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TwoViewControllerDelegate <NSObject>

@optional
- (void)delegateTest;

@end

@interface TwoViewController : UIViewController

// 正确写法
@property (weak, nonatomic) id<TwoViewControllerDelegate> delegate;
// 错误写法
// @property (strong, nonatomic) id<TwoViewControllerDelegate> delegate;

@end
