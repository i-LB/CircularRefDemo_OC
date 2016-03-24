//
//  ThreeViewController.h
//  CircularRefDemo_OC
//
//  Created by SYZ on 16/3/19.
//  Copyright © 2016年 iSyz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BlockTest) ();

@interface ThreeViewController : UIViewController

@property (strong, nonatomic) BlockTest block;

@end
