//
//  AntNest.m
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import "AntNest.h"
#import "AntQueen.h"
#import "AntQueen+Private.h"

@implementation AntNest

+ (void)load {

  NSDictionary *antNestEvents = @{UIApplicationDidEnterBackgroundNotification:@"applicationDidEnterBackground:",
                               UIApplicationWillEnterForegroundNotification:@"applicationWillEnterForeground:",
                               UIApplicationDidFinishLaunchingNotification:@"applicationDidFinishLaunchingWithOptions:",
                               UIApplicationDidBecomeActiveNotification:@"applicationDidBecomeActive:",
                               UIApplicationWillResignActiveNotification:@"applicationWillResignActive:",
                               UIApplicationDidReceiveMemoryWarningNotification:@"applicationDidReceiveMemoryWarning:",
                               UIApplicationWillTerminateNotification:@"applicationWillTerminate:",
                               UIApplicationSignificantTimeChangeNotification:@"applicationSignificantTimeChange:"};
  
  for(NSString *eventName in antNestEvents.allKeys) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(antNestEvents[eventName]) name:eventName object:nil];
  }
  
}

+ (instancetype)sharedAntNest {
  
  static AntNest *_sharedAntNest = nil;
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    _sharedAntNest = [AntNest new];
  });
  
  return _sharedAntNest;
}


+ (void)applicationDidEnterBackground:(NSNotification *)notification {
  UIApplication *application = notification.object;
  [[AntNest sharedAntNest] applicationDidEnterBackground:application];
}

+ (void)applicationWillEnterForeground:(NSNotification *)notification {
  UIApplication *application = notification.object;
  [[AntNest sharedAntNest] applicationWillEnterForeground:application];
}

+ (BOOL)applicationDidFinishLaunchingWithOptions:(NSNotification *)notification {
  [AntQueen loadAllAntRooms:notification.userInfo];
  [[AntNest sharedAntNest] application:notification.object didFinishLaunchingWithOptions:notification.userInfo];
}

+ (void)applicationDidBecomeActive:(NSNotification *)notification {
  [[AntNest sharedAntNest] applicationDidBecomeActive:notification.object];
}

+ (void)applicationWillResignActive:(NSNotification *)notification {
  [[AntNest sharedAntNest] applicationWillResignActive:notification.object];
}

+ (void)applicationDidReceiveMemoryWarning:(NSNotification *)notification {
  [[AntNest sharedAntNest] applicationDidReceiveMemoryWarning:notification.object];
}

+ (void)applicationWillTerminate:(NSNotification *)notification {
  [[AntNest sharedAntNest] applicationWillTerminate:notification.object];
}

+ (void)applicationSignificantTimeChange:(NSNotification *)notification {
  [[AntNest sharedAntNest] applicationSignificantTimeChange:notification.object];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
  [AntQueen antRoomsInvocation:anInvocation];
}

@end
