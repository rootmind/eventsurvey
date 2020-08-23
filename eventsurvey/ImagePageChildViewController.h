//
//  ImagePageChildViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 10/28/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "CommonUtils.h"
#import "ImageData.h"




@interface ImagePageChildViewController : UIViewController < UITextViewDelegate, UITextFieldDelegate, UISplitViewControllerDelegate>

@property (assign, nonatomic) NSInteger index;
//@property (strong, nonatomic) UILabel *screenNumber;

@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;



@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *cifNumber;

@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) ImageData *imageData;

//@property (strong, nonatomic) NSMutableArray *imageFileArray;
//@property (strong, nonatomic) ImageData *imageFileData;

@property (strong,nonatomic) NSString *imageFileName;
@property (strong,nonatomic) NSString *imageFileFolder;
@property (strong,nonatomic) NSString *imageId;

@property (strong,nonatomic) NSString *recordStatus;

@property (strong,nonatomic) UITextField *docID;
@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic,strong) NSMutableArray *capturedImages;

@property (nonatomic,strong) UIImage *selectedImage;

@property (nonatomic,strong) NSNumber *pageCount;

@end

