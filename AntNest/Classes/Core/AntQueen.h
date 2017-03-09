//
//  AntQueen.h
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>
#import "AntRoomProtocol.h"
#import "AntProtocol.h"
#import "AntDescriptionProtocol.h"

#define ANT_EXPORT_ANT() \
+ (void)load {\
  [AntQueen registerAntClass:[self class]];\
}

#define ANT_EXPORT_ANTROOM() \
+ (void)load {\
[AntQueen registerAntRoom:[self class]];\
}

@interface AntQueen : NSObject

+ (void)registerAntClass:(Class<AntProtocol>)antClass;

+ (id<AntProtocol>)createAnt:(id<AntDescriptionProtocol>)antDescription;

+ (void)registerAntRoom:(Class<AntRoomProtocol>)antRoom;

@end
