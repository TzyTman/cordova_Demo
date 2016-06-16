//
//  CPlugin.m
//  cordova_test
//
//  Created by TMAN on 16/6/15.
//  Copyright © 2016年 Suneee. All rights reserved.
//

#import "CPlugin.h"
#import <Cordova/CDVViewController.h>
#import "CordovaManageVC.h"

@interface CPlugin()

@property(strong, nonatomic)UIWebView *webview;
@end

@implementation CPlugin
/**
 *  懒加载 UIWebView
 *
 *  @return webview
 */
-(UIWebView *)webview
{
    if (!_webview)
    {
        self.webview = (UIWebView *)self.webView;
    }
    return _webview;
}

- (CordovaManageVC*)cordovaVC
{
    return (CordovaManageVC*)self.viewController;
}

- (CordovaManageVC*)cordovaParentVC
{
    return (CordovaManageVC*)self.viewController.parentViewController;
}

- (void)back:(CDVInvokedUrlCommand *)command
{
    BOOL isPop = [self back];
    if (!isPop) {
        [[self cordovaVC].navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)back
{
    /**
     *  A Boolean value indicating whether the receiver can move backward. (read-only)
     If YES, able to move backward; otherwise, NO.
     */
    if([self.webview canGoBack]) //判断当前页是否可以返回
    {
        [self.webview goBack];   //加载页面
        return YES;
    }
    return NO;
}

@end
