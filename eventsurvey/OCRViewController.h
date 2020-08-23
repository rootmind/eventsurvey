//
//  OCRViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 5/5/16.
//  Copyright © 2016 Sai Kiran Gandham. All rights reserved.
//

//#import <TesseractOCR/TesseractOCR.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "CommonUtils.h"
#import "ImageData.h"


@interface OCRViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate,PopoverViewControllerDelegate,UIPopoverPresentationControllerDelegate,UIActionSheetDelegate,UISplitViewControllerDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;

//@property (strong,nonatomic) NSString *existingCustomerFlag;

@property (strong, nonatomic) NSDictionary *dataDictionary;

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


@property (nonatomic, strong)  UIButton *photoLibraryButton;
@property (nonatomic, strong)  UIButton *cameraButton;
@property (nonatomic, strong)  UIButton *ocrButton;

@property (nonatomic,strong) UIImagePickerController *imagePickerController;

//@property (nonatomic, strong) NSTimer *cameraTimer;
@property (nonatomic,strong) NSMutableArray *capturedImages;

@property (nonatomic,strong) UIImage *selectedImage;


//@property (strong, nonatomic)  UIImageView *imageToRecognize;


@property (nonatomic, strong)  UITextView *txtOCRView;
@property (strong,nonatomic) NSString *ocrOriginal;
@property (strong,nonatomic) NSString *ocrEditFlag;
@property (strong,nonatomic) NSString *ocrPerformed;

//@property (nonatomic, strong)  UIProgressView *progressView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong,nonatomic) UILabel *lblStatus;

@end
