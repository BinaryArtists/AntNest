//
//  ANUserAntRoom.m
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANUserAntRoom.h"

@implementation ANUserAntRoom

ANT_EXPORT_ANTROOM()

+ (AntRoomLevel)antRoomLevel {
  return 0;
}

+ (instancetype)createInstance:(NSDictionary *)launchOptions {
  return [ANUserAntRoom new];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSLog(@"ANUserAntRoom room");
  return YES;
}

@end
