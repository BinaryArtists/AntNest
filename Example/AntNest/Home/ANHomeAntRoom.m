//
//  ANHomeAntRoom.m
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANHomeAntRoom.h"

@implementation ANHomeAntRoom

ANT_EXPORT_ANTROOM()

+ (AntRoomLevel)antRoomLevel {
  return 2;
}

+ (instancetype)createInstance:(NSDictionary *)launchOptions {
  return [ANHomeAntRoom new];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSLog(@"ANHomeAntRoom room");
  return YES;
}


@end
