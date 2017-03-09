//
//  AntQueen+Private.h
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import <AntNest/AntNest.h>

@interface AntQueen (Private)

+ (void)loadAllAntRooms:(NSDictionary *)launchOptions;

+ (void)antRoomsInvocation:(NSInvocation *)anInvocation;

@end
