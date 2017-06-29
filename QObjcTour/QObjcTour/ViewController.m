//
//  ViewController.m
//  QObjcTour
//
//  Created by cdzdev on 2017/6/29.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIButton *_pressBtn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _pressBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    _pressBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_pressBtn];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _pressBtn.frame = CGRectMake(0, 0, 100, 20);
    _pressBtn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Actions
- (void)pressBtnAction:(UIButton*)sender {
    
}

@end
