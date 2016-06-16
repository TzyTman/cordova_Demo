//
//  ViewController.m
//  cordova_test
//
//  Created by TMAN on 16/6/14.
//  Copyright © 2016年 Suneee. All rights reserved.
//

#import "ViewController.h"
#import "CordovaManageVC.h"

@interface ViewController ()
@property (strong, nonatomic) CordovaManageVC *cordovaManageVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *h5btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [h5btn setTitle:@"进入H5Page" forState:UIControlStateNormal];
    [h5btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [h5btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    h5btn.frame = CGRectMake(100, 100, 120, 60);
    [h5btn addTarget:self action:@selector(pushH5Page:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:h5btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushH5Page:(id)sender
{
   self.cordovaManageVC  = [[CordovaManageVC alloc] init];
   self.cordovaManageVC.startPage =@"http://www.baidu.com";
   [self.navigationController pushViewController:self.cordovaManageVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

@end
