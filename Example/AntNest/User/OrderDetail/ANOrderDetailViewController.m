//
//  ANOrderDetailViewController.m
//  AntNest
//
//  Created by 沈强 on 2017/3/9.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANOrderDetailViewController.h"
#import "UIViewController+AntNest.h"

@protocol ANOrderDetailDescriptionProtocol<AntDescriptionProtocol>

@property(nonatomic, strong) NSString *orderID;

@property(nonatomic, strong) NSString *customerName;

@property(nonatomic, strong) NSString *shopName;

@end

@interface ANOrderDetailViewController ()

@property(nonatomic, strong) NSString *customerName;

@property(nonatomic, strong) NSString *shopName;

@end

@implementation ANOrderDetailViewController

ANT_EXPORT_ANT()

+ (AntType)antType {
  return @"OrderDetailAnt";
}


+ (instancetype)createInstance:(id<ANOrderDetailDescriptionProtocol>)antDescription {
  ANOrderDetailViewController *order =  [ANOrderDetailViewController new];
  order.title = antDescription.orderID;
  order.customerName = antDescription.customerName;
  order.shopName = antDescription.shopName;
  return order;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.backgroundColor = [UIColor greenColor];
  [button setTitle:@"back" forState:UIControlStateNormal];
  button.frame = CGRectMake(0, 0, 100, 50);
  button.center = self.view.center;
  [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
  
  NSLog(@"ANOrderDetailViewController customerName:%@ shopName:%@",self.customerName, self.shopName);
}

- (void)back {
  [self an_back:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
