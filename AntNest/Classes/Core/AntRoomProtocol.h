//
//  AntRoomProtocol.h
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>


typedef NSUInteger AntRoomLevel;

@protocol AntRoomProtocol <UIApplicationDelegate>

+ (AntRoomLevel)antRoomLevel;

+ (instancetype)createInstance:(NSDictionary *)launchOptions;

@end
