//
//  OCRPageViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 5/6/16.
//  Copyright © 2016 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "CommonUtils.h"
#import "ImageData.h"




@interface OCRPageViewController : UIViewController <UITextViewDelegate,UITextFieldDelegate,PopoverViewControllerDelegate,UIPopoverPresentationControllerDelegate, UISplitViewControllerDelegate,UIPageViewControllerDataSource>


@property (strong, nonatomic) UIPageViewController *pageController;

@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;



@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *cifNumber;

@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) ImageData *imageData;


@property (strong,nonatomic) NSString *recordStatus;
//@property (strong,nonatomic) UITextField *docID;
@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic,strong) NSMutableArray *capturedImages;

@property (nonatomic,strong) UIImage *selectedImage;

@property (nonatomic,strong) UIPageControl *pageControl;

@end

