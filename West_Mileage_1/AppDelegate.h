//
//  AppDelegate.h
//  West_Mileage_1
//
//  Created by Gabriel West on 1/17/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MileageManager.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    MileageManager * mileage;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
