使用的是cordova4.0.1 

实现步奏 

1. 创建项目工程 使用pod
platform :ios, '8.0'
pod 'Cordova', '~> 4.0.1'

2. 配置confing.xml 非常重要 
<?xml version="1.0" encoding="UTF-8"?>
<!--
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 -->
<widget xmlns = "http://www.w3.org/ns/widgets" id = "io.cordova.helloCordova" version = "2.0.0">
<name>Hello Cordova</name>
<description>
A sample Apache Cordova application that responds to the deviceready event.
</description>

<author href="http://cordova.io" email="dev@cordova.apache.org">
Apache Cordova Team
</author>

<access origin="*"/>
<!-- <content src="http://mysite.com/myapp.html" /> for external pages -->
<content src="index.html" />
<plugin name="cordova-plugin-whitelist" version="1" />

<!-- Preferences for iOS  偏好设置 -->
<preference name="AllowInlineMediaPlayback" value="false" />
<preference name="BackupWebStorage" value="cloud" />
<preference name="DisallowOverscroll" value="false" />
<preference name="EnableViewportScale" value="false" />
<preference name="KeyboardDisplayRequiresUserAction" value="true" />
<preference name="MediaPlaybackRequiresUserAction" value="false" />
<preference name="SuppressesIncrementalRendering" value="false" />
<preference name="SuppressesLongPressGesture" value="true" />
<preference name="Suppresses3DTouchGesture" value="false" />
<preference name="GapBetweenPages" value="0" />
<preference name="PageLength" value="0" />
<preference name="PaginationBreakingMode" value="page" /> <!-- page, column -->
<preference name="PaginationMode" value="unpaginated" /> <!-- unpaginated, leftToRight, topToBottom, bottomToTop, rightToLeft -->
<!-- This settings is just used by the CDVViewControllerTest to assert which config file has been loaded -->
<preference name="test_CDVConfigFile" value="config.xml" />

<feature name="LocalStorage">
<param name="ios-package" value="CDVLocalStorage"/>
</feature>
<feature name="HandleOpenUrl">
<param name="ios-package" value="CDVHandleOpenURL"/>
<param name="onload" value="true"/>
</feature>
<feature name="IntentAndNavigationFilter">
<param name="ios-package" value="CDVIntentAndNavigationFilter"/>
<param name="onload" value="true"/>
</feature>
<feature name="GestureHandler">
<param name="ios-package" value="CDVGestureHandler"/>
<param name="onload" value="true"/>
</feature>

<allow-navigation href="https://*/*" />
<allow-navigation href="http://*/*"  />

<allow-intent href="http://*/*" />
<allow-intent href="https://*/*" />
<allow-intent href="tel:*" />
<allow-intent href="sms:*" />
<allow-intent href="mailto:*" />
<allow-intent href="geo:*" />

<platform name="android">
<allow-intent href="market:*" />
</platform>

<platform name="ios">
<allow-intent href="itms:*" />
<allow-intent href="itms-apps:*" />
</platform>

<plugin xmlns="http://apache.org/cordova/ns/plugins/1.0"
id="cordova-plugin-device" version="0.2.3">
<name>CPlugin</name>
<description>Cordova CPlugin Plugin</description>
<license>Apache 2.0</license>
<keywords>cordova,device</keywords>
<js-module src="www/device.js" name="device">
<clobbers target="device" />
</js-module>
<platform name="ios">
<config-file target="config.xml" parent="/*">
<feature name="CPlugin">
<param name="ios-package" value="CPlugin" />
<param name="onload" value="true"/>
</feature>
</config-file>
<header-file src="cordova_test/cordova_test/CPlugin.h" />
<source-file src="cordova_test/cordova_test/CPlugin.m" />
</platform>
</plugin>

<preference name="BackupWebStorage" value="none"/>

</widget>

3.如需使用自定义插件与h5进行交互 需要在 CDVViewController 的init 方法里面加入一些代码
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
然后就可以了

