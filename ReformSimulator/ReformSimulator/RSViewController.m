//
//  RSViewController.m
//  ReformSimulator
//
//  Created by 山田 慶 on 2013/01/17.
//  Copyright (c) 2013年 山田 慶. All rights reserved.
//

#import "RSViewController.h"
#import "AppDelegate.h"

@interface RSViewController ()
{
//    RSDataArray *rsDataArray;
}

@end

@implementation RSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate* delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
