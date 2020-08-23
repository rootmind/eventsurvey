//
//  SignatureViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 11/14/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "CommonUtils.h"
#import "ImageData.h"




@interface SignatureViewController : UIViewController <UITextViewDelegate, UIActionSheetDelegate>


//@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *menuName;
@property (strong, nonatomic) NSString *actionMode;



//@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *cifNumber;
@property (strong, nonatomic) UIButton *btnUpload;

@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) ImageData *imageData;


@property (strong,nonatomic) NSString *recordStatus;


@property (nonatomic, strong) UIImageView *imageView;

//@property (nonatomic, strong)  UIToolbar *toolBar;

//@property (nonatomic,strong)  UIView *overlayView;
//@property (nonatomic, strong)  UIButton *takePictureButton;
//@property (nonatomic, strong)  UIButton *startStopButton;
//@property (nonatomic, strong)  UIButton *delayedPhotoButton;
//@property (nonatomic, strong)  UIButton *doneButton;

@property (nonatomic, strong)  UIButton *clearButton;
//@property (nonatomic, strong)  UIButton *cameraButton;


//@property (nonatomic, strong) NSTimer *cameraTimer;
@property (nonatomic,strong) NSMutableArray *capturedImages;

@property (nonatomic,strong) UIImage *selectedImage;


@property (nonatomic, assign) CGPoint lastContactPoint1, lastContactPoint2, currentPoint;
@property (nonatomic, assign) CGRect imageFrame;
@property (nonatomic, assign) BOOL fingerMoved;
@property (nonatomic, assign) float navbarHeight;


@end


