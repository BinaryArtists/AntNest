//
//  AntNest+ANTestEvent.h
//  
//
//  Created by 沈强 on 2017/3/22.
//
//

#import <AntNest/AntNest.h>
#import <UIKit/UIKit.h>

@protocol ANTestEvent <NSObject>

@optional
- (void)testEvent:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions;

@end

@interface AntNest (ANTestEvent)<ANTestEvent>

@end
