# AntNest

[![CI Status](http://img.shields.io/travis/yuzhoulangzik@126.com/AntNest.svg?style=flat)](https://travis-ci.org/yuzhoulangzik@126.com/AntNest)
[![Version](https://img.shields.io/cocoapods/v/AntNest.svg?style=flat)](http://cocoapods.org/pods/AntNest)
[![License](https://img.shields.io/cocoapods/l/AntNest.svg?style=flat)](http://cocoapods.org/pods/AntNest)
[![Platform](https://img.shields.io/cocoapods/p/AntNest.svg?style=flat)](http://cocoapods.org/pods/AntNest)

## 简介

AntNest 是吸收了 Go 语言的 Interface 模型的 iOS 的 App 模块化解耦编程的框架。

* 完全解耦的面向接口插件化模块开发运行框架
* 模块具体实现与接口调用分离
* 易扩展的模块生命周期、事件分发

#### 设计原则

* Go 语言的 Interface 模型
* 蚁巢的蚁室蚁道模型

![](http://upload-images.jianshu.io/upload_images/3146026-4743ae1d628111ba.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 基本架构

* antRoom 为单独的模块
* antChannel 为 antRoom 之间的通信通道

![](http://upload-images.jianshu.io/upload_images/3146026-dc158abc907374f5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 模块的生命周期

目前支持的模块的生命周期时间：

* 基本的系统事件
* 易扩展事件分发系统

#### 基本的系统事件

目前的支持的基本的系统事件：

* applicationDidEnterBackground
* applicationWillEnterForeground
* applicationDidFinishLaunchingWithOptions
* applicationDidBecomeActive
* applicationWillResignActive
* applicationDidReceiveMemoryWarning
* applicationWillTerminate
* applicationSignificantTimeChange


在子模块中实现对应的方法，AntNest 就会自动的分发到对应的模块。

``` objc
@implementation ANOrderAntRoom

ANT_EXPORT_ANTROOM()

+ (AntRoomLevel)antRoomLevel {
  return 1;
}

+ (instancetype)createInstance:(NSDictionary *)launchOptions {
  return [ANOrderAntRoom new];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSLog(@"ANOrderAntRoom room");
  return YES;
}

@end
```

#### 扩展事件分发系统

AntNest 扩展事件分发是很方便的，举个简单的列子分发推送事件（AntNest 已经这个事件接口）

* 定义事件接口

``` objc
@protocol ANRemotePushEvent <NSObject>

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler ;

@end
```

* 定义 AntNest 扩展实现接口，不用去实现具体的方法

``` objc
@interface AntNest (ANRemotePushEvent)<ANRemotePushEvent>

@end


@implementation AntNest (ANRemotePushEvent)

@end

```
* 触发事件

``` objc
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
  [[AntNest sharedAntNest] application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}
```

## 模块

#### 模块注册

``` objc
ANT_EXPORT_ANTROOM()
```

#### 模块创建

实现 AntRoomProtocol 协议

antRoomLevel 表示模块的初始化优先级

``` objc
+ (AntRoomLevel)antRoomLevel {
  return 1;
}

+ (instancetype)createInstance:(NSDictionary *)launchOptions {
  return [ANOrderAntRoom new];
}
``` 

#### 


## 模块通讯

模块间的通讯是通过 AntChannel 进行通讯，里面传递的都是实现 AntProtocol 协议对象

``` objc
  @interface AntChannel : NSObject

  +(id)antWith:(id<AntDescriptionProtocol>)antDescription;

  @end
```

获取实例

``` objc
  ANDetailOrder *detailOrderDes = [ANDetailOrder new];
  detailOrderDes.antType = @"OrderDetailAnt";
  detailOrderDes.orderID = @"fdfdsfdsfds";
  detailOrderDes.customerName = @"carl shen";
  detailOrderDes.shopName = @"天朝";
  UIViewController *order = [AntChannel antWith:detailOrderDes];
```

ANDetailOrder 必须实现 AntDescriptionProtocol 而且带上获取服务所需的参数

#### ant service 注册

AntChannel 中传递的都是 ant service
``` objc
ANT_EXPORT_ANT()

+ (AntType)antType {
  return @"OrderDetailAnt";
}

+ (instancetype)createInstance:(id<ANOrderDetailDescriptionProtocol>)antDescription {
  ANOrderDetailViewController *order =  [ANOrderDetailViewController new];
  order.title = antDescription.orderID;
  order.customerName = antDescription.customerName;
  order.shopName = antDescription.shopName;
  return order;
}
``` 

## Requirements

* XCode

## Installation

AntNest is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "AntNest"
```

## Author

qiang.shen@ele.me

## License

AntNest is available under the MIT license. See the LICENSE file for more info.
