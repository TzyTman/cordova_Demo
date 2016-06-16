//
//  CordovaManageVC.m
//  cordova_test
//
//  Created by TMAN on 16/6/14.
//  Copyright © 2016年 Suneee. All rights reserved.
//

#import "CordovaManageVC.h"
#import "CDVUserAgentUtil.h"
@interface CordovaManageVC ()

@end

@implementation CordovaManageVC

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        //设置用户代理如不设置无法调用与H5定制的JavaScript方法进行交互
        NSString* original = [CDVUserAgentUtil originalUserAgent];
        NSString* userAgent = [original stringByAppendingString:@"WeiLian_IOS"];
        self.baseUserAgent = userAgent;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
