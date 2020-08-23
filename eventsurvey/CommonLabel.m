//
//  CommonLabel.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 5/12/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommonLabel.h"
#import "UIColor+Constants.h"


@implementation CommonLabel


//@synthesize insets;
//
//- (void)drawTextInRect:(CGRect)rect
//{
//    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
//}
//
//- (void)resizeHeightToFitText
//{
//    CGRect frame = [self bounds];
//    CGFloat textWidth = frame.size.width - (self.insets.left + self.insets.right);
//    
//    CGRect newSize = [self.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil];
//    
//    frame.size.height = newSize.size.height + self.insets.top + self.insets.bottom;
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, frame.size.width, frame.size.height);
//
//
//}

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame])
    {
        
        self.clipsToBounds = YES;

        
        self.layer.borderWidth=0;
        self.layer.backgroundColor=[UIColor clearColor].CGColor;
        self.layer.cornerRadius=5.0;
        [self setFont:[UIFont systemFontOfSize:14]];
        [self setTextColor:[UIColor borderBlueColor]];
        [self setTextAlignment:NSTextAlignmentLeft];
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        return self;

    }
    return self;
}

@end