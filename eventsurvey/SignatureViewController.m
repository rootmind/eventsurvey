//
//  SignatureViewController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 11/14/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "SignatureViewController.h"



@interface SignatureViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

//
//
//CGFloat lblConstraintImgX=0.52f;
//CGFloat lblConstraintImgY=1.0f;
//CGFloat lblConstraintImgWidth=0.5f;
//CGFloat lblConstraintImgHeight=0.8f;
//
//CGFloat ConstraintImgX=1.19f;
//CGFloat ConstraintImgY=1.0f;
//CGFloat ConstraintImgWidth=0.80f;
//CGFloat ConstraintImgHeight=0.8f;
//
//CGFloat ConstraintImg1X=0.69f;
//CGFloat ConstraintImg1Y=1.0f;
//CGFloat ConstraintImg1Width=0.3f;
//CGFloat ConstraintImg1Height=0.8f;
//
//CGFloat lblConstraintImg2X=1.52f;
//CGFloat lblConstraintImg2Y=1.0f;
//CGFloat lblConstraintImg2Width=0.5f;
//CGFloat lblConstraintImg2Height=0.8f;
//
//CGFloat ConstraintImg2X=1.69f;
//CGFloat ConstraintImg2Y=1.0f;
//CGFloat ConstraintImg2Width=0.3f;
//CGFloat ConstraintImg2Height=0.8f;


@implementation SignatureViewController


//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;

@synthesize menuName;

//@synthesize dataDictionary;

@synthesize dataArray;


@synthesize refNo;
@synthesize cifNumber;
@synthesize btnUpload;

@synthesize  imageArray;
@synthesize  imageData;



@synthesize imageView;
//@synthesize toolBar;
//@synthesize overlayView;
//@synthesize takePictureButton;
//@synthesize startStopButton;
//@synthesize delayedPhotoButton;
//@synthesize doneButton;

@synthesize clearButton;
//@synthesize cameraButton;


@synthesize capturedImages;

@synthesize selectedImage;

@synthesize recordStatus;


@synthesize lastContactPoint1, lastContactPoint2, currentPoint;
@synthesize imageFrame;
@synthesize fingerMoved;
@synthesize navbarHeight;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
    //self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    [self.splitViewController.displayModeButtonItem action];
    
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Signature"];
    self.navigationItem.title=@"Signature";

    
    
    [CommonUtils loadActivityIndicator:self];
    
    
    /*UIImageView *wallet =[[UIImageView alloc] initWithFrame:CGRectMake(50,50,80,80)];
     wallet.image=[UIImage imageNamed:@"money-wallet-icon.png"];
     wallet.contentMode=UIViewContentModeCenter;
     wallet.layer.masksToBounds=YES;
     [wallet.layer setBorderColor:[UIColor grayColor].CGColor];
     [wallet.layer setBorderWidth:2.0f];
     [wallet.layer setCornerRadius:15.0f];
     [wallet.layer setShadowColor:[UIColor grayColor].CGColor];
     [self.view addSubview:wallet];*/
    
    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
    //    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];
    //    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
    //    companyLogo.clipsToBounds = NO;
    //    companyLogo.layer.masksToBounds=NO;
    //[self.view addSubview:companyLogo];
    
    ////self.navigationItem.titleView=companyLogo;
    
    //self.navigationItem.title=@"Account Summary";
    
    //
    //    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(doValidate)];
    //
    //    self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,50,20)];
    //    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
    //    //companyLogo.contentMode=UIViewContentModeCenter;
    //    companyLogo.contentMode = UIViewContentModeScaleToFill;
    //    companyLogo.clipsToBounds = NO;
    //    //[self.view addSubview:companyLogo];
    //
    //    //self.navigationItem.titleView=companyLogo;
    
    
    
    //    CALayer *sublayerHeader = [CALayer layer];
    //    sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
    //    sublayerHeader.shadowOffset = CGSizeMake(0, 3);
    //    sublayerHeader.shadowRadius = 10.0;
    //    sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
    //    sublayerHeader.shadowOpacity = 0.8;
    //    sublayerHeader.cornerRadius = 30.0;
    //    //sublayerHeader.frame = CGRectMake(30, 80, 270, 100);
    //    sublayerHeader.bounds=imageView.bounds;
    //    [self.view.layer addSublayer:sublayerHeader];
    
    
    
    
    
    
    
    //UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
    //card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
    //card.contentMode=UIViewContentModeCenter;
    //[self.view addSubview:card];
    
    //[self fetchonBoardData];
    
    
    
    
    
    //[self drawRect:titleRect];
    //
    
    // important! without this line it does not work!
    //[tableView setBackgroundView:[[UIView alloc] init]];
    // set plain background color
    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
    // remove seperator color
    
    
    
    //tableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
    
    //    CGRect frame = tableView.tableHeaderView.frame;
    //    frame.size.height = 1;
    //    UIView *headerView = [[UIView alloc] initWithFrame:frame];
    //    [tableView setTableHeaderView:headerView];
    
    
    //get reference to the navigation frame to calculate navigation bar height
    CGRect navigationframe = [[self.navigationController navigationBar] frame];
    navbarHeight = navigationframe.size.height;
    
    //create a frame for our signature capture based on whats remaining
    imageFrame = CGRectMake(self.view.frame.origin.x+10,
                            self.view.frame.origin.y-5,
                            self.view.frame.size.width-20,
                            self.view.frame.size.height-navbarHeight-30);
    
    
    
    
    imageView = [[UIImageView alloc]init];
    imageView.layer.borderWidth=1.0;
    imageView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    imageView.layer.shadowRadius=10.0;
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.layer.shadowOffset = CGSizeMake(0, 3);
    imageView.layer.shadowRadius = 10.0;
    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageView.layer.shadowOpacity = 0.8;
    imageView.layer.cornerRadius = 15.0;
    
    imageView.frame=imageFrame;
    
    imageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:imageView];
    
   
    
    //    takePictureButton = [[UIButton alloc ] init];
    //    [takePictureButton setTitle:@"Take Photo" forState:UIControlStateNormal];
    //    takePictureButton.layer.borderColor=[UIColor grayColor].CGColor;
    //    takePictureButton.layer.borderWidth=0.5f;
    //    [takePictureButton setBackgroundColor:[UIColor whiteColor]];
    //    [takePictureButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    takePictureButton.titleLabel.font = [UIFont systemFontOfSize:18];
    //    takePictureButton.layer.cornerRadius=5.0f;
    //    [takePictureButton addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    //    takePictureButton.translatesAutoresizingMaskIntoConstraints=NO;
    //    [self.view addSubview:takePictureButton];
    //
    //
    //
    //    startStopButton = [[UIButton alloc ] init];
    //    [startStopButton setTitle:@"Start" forState:UIControlStateNormal];
    //    startStopButton.layer.borderColor=[UIColor grayColor].CGColor;
    //    startStopButton.layer.borderWidth=0.5f;
    //    [startStopButton setBackgroundColor:[UIColor whiteColor]];
    //    [startStopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    startStopButton.titleLabel.font = [UIFont systemFontOfSize:18];
    //    startStopButton.layer.cornerRadius=5.0f;
    //    [startStopButton addTarget:self action:@selector(startTakingPicturesAtIntervals:) forControlEvents:UIControlEventTouchUpInside];
    //    startStopButton.translatesAutoresizingMaskIntoConstraints=NO;
    //    [self.view addSubview:startStopButton];
    //
    //
    //    delayedPhotoButton = [[UIButton alloc ] init];
    //    [delayedPhotoButton setTitle:@"Delayed" forState:UIControlStateNormal];
    //    delayedPhotoButton.layer.borderColor=[UIColor grayColor].CGColor;
    //    delayedPhotoButton.layer.borderWidth=0.5f;
    //    [delayedPhotoButton setBackgroundColor:[UIColor whiteColor]];
    //    [delayedPhotoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    delayedPhotoButton.titleLabel.font = [UIFont systemFontOfSize:18];
    //    delayedPhotoButton.layer.cornerRadius=5.0f;
    //    [delayedPhotoButton addTarget:self action:@selector(delayedTakePhoto:) forControlEvents:UIControlEventTouchUpInside];
    //    delayedPhotoButton.translatesAutoresizingMaskIntoConstraints=NO;
    //    [self.view addSubview:delayedPhotoButton];
    //
    //
    //    doneButton = [[UIButton alloc ] init];
    //    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    //    doneButton.layer.borderColor=[UIColor grayColor].CGColor;
    //    doneButton.layer.borderWidth=0.5f;
    //    [doneButton setBackgroundColor:[UIColor whiteColor]];
    //    [doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //    doneButton.titleLabel.font = [UIFont systemFontOfSize:18];
    //    doneButton.layer.cornerRadius=5.0f;
    //    [doneButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    //    doneButton.translatesAutoresizingMaskIntoConstraints=NO;
    //    [self.view addSubview:doneButton];
    
    
    
    clearButton = [[UIButton alloc ] init];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    clearButton.layer.borderColor=[UIColor grayColor].CGColor;
    clearButton.layer.borderWidth=0.5f;
    [clearButton setBackgroundColor:[UIColor whiteColor]];
    [clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    clearButton.titleLabel.font = [UIFont systemFontOfSize:18];
    clearButton.layer.cornerRadius=5.0f;
    [clearButton addTarget:self action:@selector(doClear) forControlEvents:UIControlEventTouchUpInside];
    clearButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:clearButton];
//
//    
//    cameraButton = [[UIButton alloc ] init];
//    [cameraButton setTitle:@"Camera" forState:UIControlStateNormal];
//    cameraButton.layer.borderColor=[UIColor grayColor].CGColor;
//    cameraButton.layer.borderWidth=0.5f;
//    [cameraButton setBackgroundColor:[UIColor whiteColor]];
//    [cameraButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    cameraButton.titleLabel.font = [UIFont systemFontOfSize:18];
//    cameraButton.layer.cornerRadius=5.0f;
//    [cameraButton addTarget:self action:@selector(showImagePickerForCamera:) forControlEvents:UIControlEventTouchUpInside];
//    cameraButton.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:cameraButton];
//    
    
    
    //------image view
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
    
    
    
    //-----clearButton
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:clearButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:clearButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:clearButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
//
//    //-----cameraButton
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.5 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    
    //    //-----takePictureButton
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:takePictureButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:takePictureButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:takePictureButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    //
    //
    //    //-----startStopButton
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:startStopButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:startStopButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:startStopButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    //
    //
    //
    //    //-----delayedPhotoButton
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:delayedPhotoButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:delayedPhotoButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:delayedPhotoButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    //
    //
    //
    //    //-----doneButton
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:doneButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.7 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:doneButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.25 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:doneButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    //
    //
    //    takePictureButton.hidden=YES;
    //    startStopButton.hidden=YES;
    //    delayedPhotoButton.hidden=YES;
    //    doneButton.hidden=YES;
    
    
    self.capturedImages = [[NSMutableArray alloc] init];
    
    
    btnUpload = [[UIButton alloc ] init];//WithFrame:CGRectMake(120, 200, 60, 30) ];
    [btnUpload setTitle:@"Upload" forState:UIControlStateNormal];
    //btnLogin.titleLabel.text=@"Login";
    //[btnLogin setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    //btnLogin.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btnUpload.layer.borderColor=[UIColor grayColor].CGColor;
    btnUpload.layer.borderWidth=0.5f;
    [btnUpload setBackgroundColor:[UIColor whiteColor]];
    [btnUpload setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //btnLogin.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    btnUpload.titleLabel.font = [UIFont systemFontOfSize:18];
    btnUpload.layer.cornerRadius=5.0f;
    //btnLogin.layer.masksToBounds=YES;
    //btnLogin.clipsToBounds=YES;
    [btnUpload addTarget:self action:@selector(doValidate) forControlEvents:UIControlEventTouchUpInside];
    btnUpload.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnUpload];
    
    
    //-----login button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnUpload attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnUpload attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnUpload attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    

    

    
    

    
    
    //    NSDictionary *jsonDictionary = @{@"refNo":([self.refNo length]==0?@"":self.refNo),
    //                                     @"cifNumber":([self.cifNumber length]==0?@"":self.cifNumber)
    //                                     };
    //
    //
    //    //NSString *jsonString = [container JSONRepresentation];
    //    NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
    //
    //
    //
    //    NSData *newData=[CommonUtils connectHost :@"fetchImageDetails" :jsonDictionary:self];
    //    [self parseResponse:newData:@"fetchImageDetails":@"imageDetailsWrapper"];
    
    
    
    
}


- (void) doValidate {
    
    
    
    //------validation starts---------
    
    
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    
    [self buildJSON];
    
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}


- (void) buildJSON {
    
    
    
    
    //cifNumber=@"0100000305";
    //refNo=@"SA20OCT2015148";
    
    
    //------To Check User Account Relations
    
    
    
    @try{
        
        
        NSLog(@"RefNo %@",self.refNo);
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        selectedImage= imageView.image;
        
        //----check image is selected or not
        CGImageRef cgref = [self.selectedImage CGImage];
        CIImage *cim = [self.selectedImage CIImage];
        
        if (cim == nil && cgref == NULL)
        {
            [CommonUtils showMessage:@"Please sign to upload" :self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            return;
        }
        
        //---------------
        
        UIAlertController *alertController;
        
        alertController=[UIAlertController
                         alertControllerWithTitle:@"Confirmation"
                         message:[NSString stringWithFormat:@"Would you like to upload selected signature?"]
                         preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
                                       //-------
                                       
                                       
                                       NSLog(@"RefNo %@",self.refNo);
                                       
                                       NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                                       [formatter setDateFormat:@"ddMMMyyyyHHmmssSSS"];
                                       
                                       //NSString *dateString = [[formatter stringFromDate:[NSDate date]] uppercaseString];
                                       
                                       
                                       NSString *targetFileName=[NSString stringWithFormat:@"%@_%@",self.refNo,@"signature"];
                                       
                                       NSDictionary *jsonDictionary = @{@"refNo": emptyStringIfNil(self.refNo),
                                                                        @"cifNumber":emptyStringIfNil(self.cifNumber),
                                                                        @"imageStatus":emptyStringIfNil(@"ACTIVE"),
                                                                        @"imageId":emptyStringIfNil(@"signature"),
                                                                        @"docID":emptyStringIfNil(@"DOC005")
                                                                        };
                                       
                                       
                                       //NSString *jsonString = [container JSONRepresentation];
                                       NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
                                       
                                       
                                       
                                       [CommonUtils connectHostImage :@"uploadImageDetails" :jsonDictionary:self:selectedImage:targetFileName:self.refNo: ^(NSDictionary *dictionary){
                                       
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                       
                                                       [self parseResponseImage:dictionary:@"uploadImageDetails":@"imageDetailsWrapper"];
                                                       
                                                       if([imageData.imageUploadStatus boolValue] == NO)
                                                       {
                                                           [CommonUtils showMessage:@"Signature couldn't upload, please retry again":self];
                                                           [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                                           return;
                                                       }
                                                       else
                                                       {
                                                           
                                                           [CommonUtils showMessage:@"Signature uploaded successfully":self];
                                                           [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                                           //return;
                                                           
                                                       }
                                                });

                                       
                                       }];
                                       
                                       
                                       
                                       
                                       
                                       //Do some thing here
                                       //[self.navigationController popViewControllerAnimated:YES];
                                       
                                   }];
        
        UIAlertAction* cancelAction = [UIAlertAction
                                       actionWithTitle:@"Cancel"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           //[alert dismissViewControllerAnimated:YES completion:nil];
                                       }];
        
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        NSLog(@"finally in buildJSON Code");
    }
    
}




- (void) parseResponseImage:(NSDictionary *) dataDictionary : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        //NSLog(@"get validate user %@",userid);
        
        
        
//        NSString *myData = [[NSString alloc] initWithData:data
//                                                 encoding:NSUTF8StringEncoding];
//        NSLog(@"JSON data = %@", myData);
//        NSError *error = nil;
//        
//        //parsing the JSON response
//        id jsonObject = [NSJSONSerialization
//                         JSONObjectWithData:data
//                         options:NSJSONReadingAllowFragments
//                         error:&error];
//        if (jsonObject != nil && error == nil){
//            NSLog(@"Successfully deserialized...");
//            
//            //check if the customer code was valid
//            //userid = [jsonObject objectForKey:@"userid"];
//            //sessionid = [jsonObject objectForKey:@"sessionid"];
//            
//            
//            
//            NSNumber *success = [jsonObject objectForKey:@"success"];
//            if([success boolValue] == YES){
        
                
                //                NSString *base64String=[jsonObject objectForKey:@"image"];
                //
                //                NSLog(@"base64String %@", base64String);
                //
                //                NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
                //                NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
                //                NSLog(@"decodedString %@", decodedString); // foo
                //
                //                [self.imageView setImage:[UIImage imageWithData:decodedData]];
                
                
                //set the customer object of the second view controller
//                dataDictionary =[jsonObject objectForKey:methodAction];
//                
//                NSLog(@"Dictionary: %@", [dataDictionary description]);
//                
//                
//                for(NSString *key in [dataDictionary allKeys]) {
//                    NSLog(@"key code: %@",key);
//                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
//                    
//                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
//                    
//                }
        
                // Create a new array to hold the locations
                imageArray = [[NSMutableArray alloc] init];
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    
                    
                    
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    
                    
                    imageData = [[ImageData alloc] initWithJSONDictionary:dict];
                    
                    NSLog(@" image upload status %@",imageData.imageUploadStatus);
                    
                    // Add the Location object to the array
                    [imageArray addObject:imageData];
                    
                    
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)imageArray.count);
                
                
                
                
                
                
                
//            }
//            else {
//                NSLog(@"Success is invalid...");
//                
//                //[CommonUtils showMessage:@"Invalid userid or password":self];
//                
//                
//            }
//            
//        }
//        else{
//            
//            [CommonUtils showError:error:self:@"parseResponse"];
//            
//        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}

//- (void) parseResponseImageLoad:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
//    
//    
//    @try {
//        
//        
//        
//        //NSLog(@"get validate user %@",userid);
//        
//        
//        
//        //NSString *myData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        //NSLog(@"JSON data = %@", myData);
//        NSError *error = nil;
//        
//        //parsing the JSON response
//        id jsonObject = [NSJSONSerialization
//                         JSONObjectWithData:data
//                         options:NSJSONReadingAllowFragments
//                         error:&error];
//        if (jsonObject != nil && error == nil){
//            NSLog(@"Successfully deserialized...");
//            
//            //check if the customer code was valid
//            //userid = [jsonObject objectForKey:@"userid"];
//            //sessionid = [jsonObject objectForKey:@"sessionid"];
//            
//            
//            
//            NSNumber *success = [jsonObject objectForKey:@"success"];
//            if([success boolValue] == YES){
//                
//                
//                NSString *base64String=[jsonObject objectForKey:@"image"];
//                
//                //NSLog(@"base64String %@", base64String);
//                
//                NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
//                //NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
//                //NSLog(@"decodedString %@", decodedString); // foo
//                
//                [self.imageView setImage:[UIImage imageWithData:decodedData]];
//                
//                
//                //set the customer object of the second view controller
//                dataDictionary =[jsonObject objectForKey:methodAction];
//                
//                NSLog(@"Dictionary: %@", [dataDictionary description]);
//                
//                
//                for(NSString *key in [dataDictionary allKeys]) {
//                    NSLog(@"key code: %@",key);
//                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
//                    
//                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
//                    
//                }
//                
//                // Create a new array to hold the locations
//                imageArray = [[NSMutableArray alloc] init];
//                
//                
//                // Get an array of dictionaries with the key "locations"
//                NSArray *array = [dataDictionary objectForKey:dataFile];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    
//                    
//                    
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    
//                    
//                    imageData = [[ImageData alloc] initWithJSONDictionary:dict];
//                    
//                    NSLog(@" image upload status %@",imageData.imageUploadStatus);
//                    
//                    // Add the Location object to the array
//                    [imageArray addObject:imageData];
//                    
//                    
//                    
//                }
//                
//                
//                NSLog(@"data count %lu",(unsigned long)imageArray.count);
//                
//                
//                
//                
//                
//                
//                
//            }
//            else {
//                NSLog(@"Success is invalid...");
//                
//                //[CommonUtils showMessage:@"Invalid userid or password":self];
//                
//                
//            }
//            
//        }
//        else{
//            
//            [CommonUtils showError:error:self:@"parseResponse"];
//            
//        }
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
//        
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in parseResponse Code");
//    }
//    
//}




- (void)finishAndUpdate
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    if ([self.capturedImages count] > 0)
    {
        if ([self.capturedImages count] == 1)
        {
            // Camera took a single picture.
            [self.imageView setImage:[self.capturedImages objectAtIndex:0]];
            
            self.imageView.contentMode=UIViewContentModeScaleAspectFit; //to get original size
            
            selectedImage=[self.capturedImages objectAtIndex:0];
        }
        else
        {
            // Camera took multiple pictures; use the list of images for animation.
            self.imageView.animationImages = self.capturedImages;
            self.imageView.animationDuration = 5.0;    // Show each captured photo for 5 seconds.
            self.imageView.animationRepeatCount = 0;   // Animate forever (show all photos).
            [self.imageView startAnimating];
        }
        
        // To be ready to start again, clear the captured images array.
        [self.capturedImages removeAllObjects];
    }
    

    
    //photoLibraryButton.hidden=NO;
    //cameraButton.hidden=NO;
    //    takePictureButton.hidden=YES;
    //    startStopButton.hidden=YES;
    //    delayedPhotoButton.hidden=YES;
    //    doneButton.hidden=YES;
}



-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}

-(void) logout:(id) sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    return;
}


-(void)startActivityIndicator
{
    //    lblLoading.text = @"Loading...";
    //    activityIndicator.hidden=NO;
    //    [activityIndicator startAnimating];
    
    [CommonUtils startActivityIndicator:self];
    
    
}

-(void)stopActivityIndicator
{
    //    lblLoading.text = @"";
    //    [activityIndicator stopAnimating];
    //    activityIndicator.hidden=YES;
    
    [CommonUtils stopActivityIndicator:self];
    
}

static inline NSString* emptyStringIfNil(NSString *value) {
    return value? value : @"";
}


//when one or more fingers touch down in a view or window
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //did our finger moved yet?
    fingerMoved = NO;
    UITouch *touch = [touches anyObject];
    
    //just clear the image if the user tapped twice on the screen
    if ([touch tapCount] == 2) {
        imageView.image = nil;
        return;
    }
    
    //we need 3 points of contact to make our signature smooth using quadratic bezier curve
    currentPoint = [touch locationInView:imageView];
    lastContactPoint1 = [touch previousLocationInView:imageView];
    lastContactPoint2 = [touch previousLocationInView:imageView];
    
}

//when one or more fingers associated with an event move within a view or window
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //well its obvious that our finger moved on the screen
    fingerMoved = YES;
    UITouch *touch = [touches anyObject];
    
    //save previous contact locations
    lastContactPoint2 = lastContactPoint1;
    lastContactPoint1 = [touch previousLocationInView:imageView];
    //save current location
    currentPoint = [touch locationInView:imageView];
    
    //find mid points to be used for quadratic bezier curve
    CGPoint midPoint1 = [self midPoint:lastContactPoint1 withPoint:lastContactPoint2];
    CGPoint midPoint2 = [self midPoint:currentPoint withPoint:lastContactPoint1];
    
    //create a bitmap-based graphics context and makes it the current context
    UIGraphicsBeginImageContext(imageFrame.size);
    
    //draw the entire image in the specified rectangle frame
    [imageView.image drawInRect:CGRectMake(0, 0, imageFrame.size.width, imageFrame.size.height)];
    
    //set line cap, width, stroke color and begin path
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0f);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    //begin a new new subpath at this point
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), midPoint1.x, midPoint1.y);
    //create quadratic Bézier curve from the current point using a control point and an end point
    CGContextAddQuadCurveToPoint(UIGraphicsGetCurrentContext(),
                                 lastContactPoint1.x, lastContactPoint1.y, midPoint2.x, midPoint2.y);
    
    //set the miter limit for the joins of connected lines in a graphics context
    CGContextSetMiterLimit(UIGraphicsGetCurrentContext(), 2.0);
    
    //paint a line along the current path
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    //set the image based on the contents of the current bitmap-based graphics context
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    //remove the current bitmap-based graphics context from the top of the stack
    UIGraphicsEndImageContext();
    
    //lastContactPoint = currentPoint;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    //just clear the image if the user tapped twice on the screen
    if ([touch tapCount] == 2) {
        imageView.image = nil;
        return;
    }
    
    
    //if the finger never moved draw a point
    if(!fingerMoved) {
        UIGraphicsBeginImageContext(imageFrame.size);
        [imageView.image drawInRect:CGRectMake(0, 0, imageFrame.size.width, imageFrame.size.height)];
        
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0f);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}

//calculate midpoint between two points
- (CGPoint) midPoint:(CGPoint )p0 withPoint: (CGPoint) p1 {
    return (CGPoint) {
        (p0.x + p1.x) / 2.0,
        (p0.y + p1.y) / 2.0
    };
}

- (void) doClear
{
    imageView.image=nil;
}

@end

