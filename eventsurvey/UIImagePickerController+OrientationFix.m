//
//  UIImagePickerController+OrientationFix.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 10/23/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import "UIImagePickerController+OrientationFix.h"

@implementation UIImagePickerController (OrientationFix)


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}


@end
