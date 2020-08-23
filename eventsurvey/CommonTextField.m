//
//  CommonTextField.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 5/14/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CommonTextField.h"


@implementation CommonTextField

//
//CGFloat constraintY=1.0f;
//CGFloat constraintX=1.3f;
//CGFloat constraintHeight=1.0f;
//CGFloat constraintWidth=0.7f;


- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame])
    {

        self.clipsToBounds = YES;
        
        [self setBorderStyle:UITextBorderStyleRoundedRect];
        self.layer.borderWidth=0;
        //self.txtCustomerName.layer.borderColor=[UIColor blackColor].CGColor;
        self.layer.cornerRadius=5.0;
        [self setFont:[UIFont systemFontOfSize:14]];
        //[self setPlaceholder: @"Customer Name"];
        [self setTextColor:[UIColor blackColor]];
        [self setTextAlignment:NSTextAlignmentLeft];
        [self setAutocorrectionType:UITextAutocorrectionTypeDefault];
        [self setKeyboardType:UIKeyboardTypeDefault];
        [self setReturnKeyType:UIReturnKeyDone];
        [self setClearButtonMode: UITextFieldViewModeWhileEditing];
        [self setContentVerticalAlignment: UIControlContentVerticalAlignmentCenter];
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        return self;

    }
    return self;
}

//-(void)updateConstraints{
//    // add your constraints
//    
//    NSLog(@"test");
//    
//    
//
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self  attribute:NSLayoutAttributeCenterX multiplier:0.3f constant:0]];
//
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0]];
//    
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:2.5f constant:0]];
//    
//    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0]];
//    
//    [super updateConstraints];
//}


@end