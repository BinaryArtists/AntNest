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
#import <objc/runtime.h>

@interface AntNest()

@property(nonatomic, strong) NSMutableArray *protocols;

@end

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
    _sharedAntNest = [AntNest new] ;
  });
  
  return _sharedAntNest;
}

- (instancetype)init {
  if (self = [super init]) {
    _protocols = [NSMutableArray array];
  }
  return self;
}

- (void)registerProtocolEvent:(Protocol *)protocol {
  [_protocols addObject:protocol];
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
  return YES;
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

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
  NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
  if (methodSignature) {
    return methodSignature;
  }
  for (Protocol *protocol in _protocols) {
    struct objc_method_description method_description = protocol_getMethodDescription(protocol, aSelector, YES, YES);
    if (method_description.types) {
      methodSignature = [NSMethodSignature signatureWithObjCTypes:method_description.types];
      break;
    } else {
       method_description = protocol_getMethodDescription(protocol, aSelector, NO, YES);
      if (method_description.types) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:method_description.types];
        break;
      }
    }
  }
  return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
  [AntQueen antRoomsInvocation:anInvocation];
}

@end
