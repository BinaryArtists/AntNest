//
//  UIViewController+AntNest.m
//  Pods
//
//  Created by 沈强 on 2017/3/8.
//
//

#import "UIViewController+AntNest.h"
#import <objc/runtime.h>

typedef NS_ENUM(NSUInteger, ANStyle) {
  ANStylePush,
  ANStyleModal,
};

@implementation UIViewController (AntNest)


+ (void)load {
  
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    
    [self method_exchangeImplementations:@selector(presentViewController:
                                                   animated:
                                                   completion:)
                                  newSel:@selector(an_presentViewController:
                                                   animated:
                                                   completion:)];
  });
  
}

+ (void)method_exchangeImplementations:(SEL)sel newSel:(SEL)newSel {
  
  Method originalMethod = class_getInstanceMethod([self class], sel);
  
  Method swizzledMethod = class_getInstanceMethod([self class], newSel);
  
  method_exchangeImplementations(originalMethod,swizzledMethod);
  
}

- (void)an_presentViewController:(UIViewController *)viewControllerToPresented
                        animated: (BOOL)flag
                      completion:(void (^ __nullable)(void))completion {
  [viewControllerToPresented setAn_style:ANStyleModal];
  [self an_presentViewController:viewControllerToPresented animated:flag completion:completion];
  
}


- (void)setAn_style:(ANStyle)anStyle {
  objc_setAssociatedObject(self, _cmd, @(anStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (ANStyle)an_style {
  return ((NSNumber *)objc_getAssociatedObject(self, @selector(setAn_style:))).integerValue;
}


- (void)an_back:(BOOL)animated completion:(void(^)(void))completion {
  switch ([self an_style]) {
    case ANStylePush:
      [self.navigationController popViewControllerAnimated:animated];
      break;
    case ANStyleModal:
      [self dismissViewControllerAnimated:animated
                               completion:completion];
      break;
    default:
      break;
  }
}

@end


@implementation UINavigationController (NHRouterParams)

+ (void)load {
  
  static dispatch_once_t onceToken;
  
  dispatch_once(&onceToken, ^{
    
    [self method_exchangeImplementations:@selector(pushViewController:animated:)
                                  newSel:@selector(an_pushViewController:animated:)];
    
  });
  
}

+ (void)method_exchangeImplementations:(SEL)sel newSel:(SEL)newSel {
  
  Method originalMethod = class_getInstanceMethod([self class], sel);
  
  Method swizzledMethod = class_getInstanceMethod([self class], newSel);
  
  method_exchangeImplementations(originalMethod,swizzledMethod);
  
}

- (void)an_pushViewController:(UIViewController *)viewController
                     animated:(BOOL)animated {
  [viewController setAn_style:ANStylePush];
  [self an_pushViewController:viewController animated:animated];
  
}



@end
