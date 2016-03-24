//
//  OneViewController.h
//  CircularRefDemo_OC
//
//  Created by SYZ on 16/3/19.
//  Copyright © 2016年 iSyz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface OneViewController : UIViewController <TwoViewControllerDelegate>

@property (strong, nonatomic) NSString *name;

@end
