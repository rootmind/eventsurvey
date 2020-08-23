//
//  ImageUploadViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 20/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "CommonUtils.h"
#import "ImageUploadViewController.h"
#import "ImageData.h"




@interface ImageUploadViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate,PopoverViewControllerDelegate,UIPopoverPresentationControllerDelegate,UIActionSheetDelegate,UISplitViewControllerDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;

//@property (strong,nonatomic) NSString *existingCustomerFlag;

//@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong, nonatomic) NSString *accountType;

@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *cifNumber;
@property (strong, nonatomic) UIButton *btnUpload;

@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) ImageData *imageData;


@property (strong,nonatomic) NSString *recordStatus;

@property (strong,nonatomic) CommonTextField *docID;
@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

@property (nonatomic, strong) UIImageView *imageView;

//@property (nonatomic, strong)  UIToolbar *toolBar;

//@property (nonatomic,strong)  UIView *overlayView;
//@property (nonatomic, strong)  UIButton *takePictureButton;
//@property (nonatomic, strong)  UIButton *startStopButton;
//@property (nonatomic, strong)  UIButton *delayedPhotoButton;
//@property (nonatomic, strong)  UIButton *doneButton;

@property (nonatomic, strong)  UIButton *photoLibraryButton;
@property (nonatomic, strong)  UIButton *cameraButton;

@property (nonatomic,strong) UIImagePickerController *imagePickerController;

//@property (nonatomic, strong) NSTimer *cameraTimer;
@property (nonatomic,strong) NSMutableArray *capturedImages;

@property (nonatomic,strong) UIImage *selectedImage;


@end

