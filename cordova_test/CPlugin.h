//
//  CPlugin.h
//  cordova_test
//
//  Created by TMAN on 16/6/15.
//  Copyright © 2016年 Suneee. All rights reserved.
//

#import "CDVPlugin.h"

@interface CPlugin : CDVPlugin
/**
 *  返回控件
 *
 *  @param command
 */
- (void)back:(CDVInvokedUrlCommand *)command;
@end
