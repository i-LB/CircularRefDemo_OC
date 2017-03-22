//
//  OneViewController.m
//  CircularRefDemo_OC
//
//  Created by iLB on 16/3/19.
//  Copyright © 2016年 iLB. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController () {
    TwoViewController *twoController;
    ThreeViewController *threeController;
}

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"One";
    self.name = @"Paolo Maldini";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// delegate 有循环引用
- (IBAction)delegateCircularRefButtonClick {
    twoController = [TwoViewController new];
    twoController.delegate = self;
    [self.navigationController pushViewController:twoController animated:YES];
}

// delegate 没有循环引用
- (IBAction)delegateNoCircularRefButtonClick {
    TwoViewController *controller = [TwoViewController new];
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

// block 有循环引用
- (IBAction)blockCircularRefButtonClick {
    threeController = [ThreeViewController new];
    // 正确写法
    __weak OneViewController *weakSelf = self;
    threeController.block = ^() {
        NSLog(@"Hello, %@!", weakSelf.name);
    };
    /**
    // 错误写法
    threeController.block = ^() {
        NSLog(@"Hello, %@!", self.name);
    };
    [self.navigationController pushViewController:threeController animated:YES];
    */
}

// block 没有循环引用
- (IBAction)blockNoCircularRefButtonClick {
    ThreeViewController *controller = [ThreeViewController new];
    controller.block = ^() {
        NSLog(@"Hello, %@!", self.name);
    };
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)dealloc {
    NSLog(@"OneViewController dealloc");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
