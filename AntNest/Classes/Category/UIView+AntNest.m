//
//  UIView+AntNest.m
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import "UIView+AntNest.h"

@implementation UIView (AntNest)

- (UINavigationController *)an_navigationController {
  
  UIResponder *nextResponder = self.nextResponder;
  
  while (nextResponder) {
    if ([nextResponder isKindOfClass:[UINavigationController class]]) {
      return (UINavigationController *)nextResponder;
    }
    nextResponder = nextResponder.nextResponder;
  }
  return nil;
  
}

@end
