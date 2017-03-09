//
//  ANOrderAntRoom.m
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANOrderAntRoom.h"

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
