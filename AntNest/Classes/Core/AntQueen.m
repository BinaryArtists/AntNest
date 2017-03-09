//
//  AntQueen.m
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import "AntQueen.h"

@interface AntQueen ()

@property(nonatomic, strong)NSMutableDictionary *antTypeMap;

@property(nonatomic, strong)NSMutableArray *antRooms;

@property(nonatomic, strong)NSMutableDictionary *singletonAntTypeMap;

@end

@implementation AntQueen

+ (instancetype)sharedAntQueen {
  
  static AntQueen *_sharedAntQueen = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedAntQueen = [AntQueen new];
  });
  
  return _sharedAntQueen;
  
}

- (instancetype)init {
  
  if (self = [super init]) {
    _antTypeMap = [NSMutableDictionary dictionary];
    _antRooms = [NSMutableArray array];
    _singletonAntTypeMap = [NSMutableDictionary dictionary];
  }
  
  return self;
  
}

+ (void)registerAntClass:(Class<AntProtocol>)antClass {
  
  NSParameterAssert([antClass conformsToProtocol:@protocol(AntProtocol)]);
  NSAssert(![[AntQueen sharedAntQueen].antTypeMap objectForKey:[antClass antType]], @"antType %@ has register antClass %@",[antClass antType], NSStringFromClass(antClass));
  [[AntQueen sharedAntQueen].antTypeMap setValue:antClass forKey:[antClass antType]];
  
}

+ (id<AntProtocol>)createAnt:(id<AntDescriptionProtocol>)antDescription {
  
  Class<AntProtocol> antClass = [[AntQueen sharedAntQueen].antTypeMap objectForKey:[antDescription antType]];
  
  NSAssert(antClass, @"antType %@ has no register antClass ",[antDescription antType]);
  
  id<AntProtocol> ant = nil;
  
  if ([(id)antClass respondsToSelector:@selector(singleton)] && [antClass singleton]) {
    ant = [[AntQueen sharedAntQueen].singletonAntTypeMap objectForKey:[antDescription antType]];
    if (!ant) {
      ant = [antClass createInstance:antDescription];
      [[AntQueen sharedAntQueen].singletonAntTypeMap setValue:ant forKey:[antDescription antType]];
    }
  } else {
    ant = [antClass createInstance:antDescription];
  }
  
  return ant;
}

+ (void)registerAntRoom:(Class<AntRoomProtocol>)antRoom {
  
  NSParameterAssert([antRoom conformsToProtocol:@protocol(AntRoomProtocol)]);
  
  NSAssert(![[AntQueen sharedAntQueen].antRooms containsObject:antRoom], @"AntRoom %@ has register ",NSStringFromClass(antRoom));
  
  [[AntQueen sharedAntQueen].antRooms addObject:antRoom];

}

+ (void)loadAllAntRooms:(NSDictionary *)launchOptions {
  
  NSMutableArray *antRoomInstances = [NSMutableArray arrayWithCapacity:[AntQueen sharedAntQueen].antRooms.count];
  
  [[AntQueen sharedAntQueen].antRooms sortUsingComparator:^NSComparisonResult(Class<AntRoomProtocol> _Nonnull antRoom1, Class<AntRoomProtocol> _Nonnull antRoom2) {
    return [antRoom1 antRoomLevel] > [antRoom2 antRoomLevel];

  }];
  
  for (Class<AntRoomProtocol> antRoom in [AntQueen sharedAntQueen].antRooms) {
    id<AntRoomProtocol>antRoomInstance = [antRoom createInstance:launchOptions];
    [antRoomInstances addObject:antRoomInstance];
  }
  
  [[AntQueen sharedAntQueen].antRooms removeAllObjects];
  [[AntQueen sharedAntQueen].antRooms addObjectsFromArray:antRoomInstances];
}

+ (void)antRoomsInvocation:(NSInvocation *)anInvocation {
  
  for (id<AntRoomProtocol>antRoomInstance in [AntQueen sharedAntQueen].antRooms) {
    if ([antRoomInstance respondsToSelector:anInvocation.selector]) {
      NSInvocation *innerInv = [NSInvocation invocationWithMethodSignature:anInvocation.methodSignature];
      void *argBuf = NULL;
      
      for (NSUInteger i = 2; i < anInvocation.methodSignature.numberOfArguments; i++) {
        
        const char *type = [anInvocation.methodSignature getArgumentTypeAtIndex:i];
        
        NSUInteger argSize;
        
        NSGetSizeAndAlignment(type, &argSize, NULL);
        
        if (!(argBuf = reallocf(argBuf, argSize))) {
          return ;
        }
        
        [anInvocation getArgument:argBuf atIndex:i];
        innerInv.selector = anInvocation.selector;
        [innerInv setArgument:argBuf atIndex:i - 1];
      }
      [innerInv invokeWithTarget:antRoomInstance];
      free(argBuf);
    }
  }
  
}

@end
