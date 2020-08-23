//
//  ImageUploadViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 20/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "ImageUploadViewController.h"


//#import "KYCViewController.h"
//#import "AutoLoansViewController.h"
//#import "PersonalLoanViewController.h"
//#import "CreditCardViewController.h"
//#import "QueueViewController.h"
//#import "RoDViewController.h"

@interface ImageUploadViewController ()


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


@implementation ImageUploadViewController


@synthesize menuName;
//@synthesize sessionid;
@synthesize actionMode;

//@synthesize existingCustomerFlag;

//@synthesize dataDictionary;

@synthesize dataArray;

@synthesize accountType;

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

@synthesize photoLibraryButton;
@synthesize cameraButton;

@synthesize imagePickerController;
//@synthesize cameraTimer;
@synthesize capturedImages;

@synthesize selectedImage;

@synthesize docID;
@synthesize popoverCodeValue;

@synthesize recordStatus;





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
    //self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    //    [self.splitViewController.displayModeButtonItem action];
    
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Image Upload"];
    self.navigationItem.title=@"Image Upload";
    
    
    [CommonUtils loadActivityIndicator:self];
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
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
    
    
    
    photoLibraryButton = [[UIButton alloc ] init];
    [photoLibraryButton setTitle:@"Photo Library" forState:UIControlStateNormal];
    photoLibraryButton.layer.borderColor=[UIColor grayColor].CGColor;
    photoLibraryButton.layer.borderWidth=0.5f;
    [photoLibraryButton setBackgroundColor:[UIColor whiteColor]];
    [photoLibraryButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    photoLibraryButton.titleLabel.font = [UIFont systemFontOfSize:18];
    photoLibraryButton.layer.cornerRadius=5.0f;
    [photoLibraryButton addTarget:self action:@selector(showImagePickerForPhotoPicker:) forControlEvents:UIControlEventTouchUpInside];
    photoLibraryButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:photoLibraryButton];
    
    
    cameraButton = [[UIButton alloc ] init];
    [cameraButton setTitle:@"Camera" forState:UIControlStateNormal];
    cameraButton.layer.borderColor=[UIColor grayColor].CGColor;
    cameraButton.layer.borderWidth=0.5f;
    [cameraButton setBackgroundColor:[UIColor whiteColor]];
    [cameraButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cameraButton.titleLabel.font = [UIFont systemFontOfSize:18];
    cameraButton.layer.cornerRadius=5.0f;
    [cameraButton addTarget:self action:@selector(showImagePickerForCamera:) forControlEvents:UIControlEventTouchUpInside];
    cameraButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:cameraButton];


    
    //------image view
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
    
    //-----photoLibraryButton
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoLibraryButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoLibraryButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoLibraryButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    
    //-----cameraButton
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    
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


    //-----upload button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnUpload attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnUpload attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnUpload attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    
    CommonLabel *lblSeleDoc=[[CommonLabel alloc]initWithFrame:CGRectZero];
    lblSeleDoc.text=@"Select Document";
    lblSeleDoc.font = [UIFont systemFontOfSize:14];
    lblSeleDoc.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblSeleDoc];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.24 constant:0]];
   
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.04 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.15 constant:0]];
    
    
    docID= [[CommonTextField alloc] init];
    docID.tag=1;
    docID.delegate=self;
    docID.placeholder=@"Select Document";
    docID.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:docID];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.24 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.04 constant:0]];
    

    
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


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }

    //--ImageDoC
    if(textField.tag==1)
    {
        [self popoverData:textField:@"RMT_DocChecklistMaster":self.accountType]; //IMAGEDOC
        
        
        return NO; //to disable keyboard
    }
    
    else
        return YES;
    
}


-(void) popoverDate: (UITextField *)sender :(NSString *)dateRange :(NSString *)dateFormat
{
    [self popoverData:sender :NULL:@"Y":dateRange:dateFormat:NULL];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName
{
    [self popoverData:sender :tableName:@"N":NULL:NULL:NULL];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName:(NSString *)filter
{
    [self popoverData:sender :tableName:@"N":NULL:NULL:filter];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *)dateField :(NSString *)dateRange :(NSString *)dateFormat :(NSString *)filter
{
    @try
    {
        
        NSLog(@"dateField %@",dateField);
        
        PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
        //popoverViewController.actionCode=actionCode;
        popoverViewController.tableName=tableName;
        popoverViewController.fieldTag=(int)sender.tag;
        popoverViewController.dateField=dateField;
        popoverViewController.dateRange=dateRange;
        popoverViewController.dateFormat=dateFormat;
        popoverViewController.filter=filter;
        popoverViewController.delegate=self;
        
        //        UIPopoverController *popoverController =[[UIPopoverController alloc] initWithContentViewController:popoverViewController];
        //        [popoverController setPopoverContentSize:CGSizeMake(self.view.frame.size.width/4, self.view.frame.size.height/4)];
        
        
        // Present the view controller using the popover style.
        popoverViewController.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:popoverViewController animated: YES completion: nil];
        
        // Get the popover presentation controller and configure it.
        UIPopoverPresentationController *presentationController =[popoverViewController popoverPresentationController];
        presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        presentationController.sourceView = self.view;
        NSLog(@"x %f and y %f %@",sender.frame.origin.x,sender.frame.origin.y,sender.class);
        presentationController.sourceRect =  CGRectMake(0, sender.frame.origin.y, 1, 1);
        
        
        
        
        //        if(popoverController.popoverVisible==NO){
        //
        //            //NSLog(@" test %lf",sender.frame.origin.x);
        //            //NSLog(@" test %lf",sender.frame.origin.y);
        //
        //            [popoverController presentPopoverFromRect:CGRectMake(0, sender.frame.origin.y, 1, 1)    inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        //        }
        //        else{
        //            [popoverController dismissPopoverAnimated:YES];
        //        }
        //
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in popoverData code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in popoverData  Code");
    }
    
    
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
        
        
        
            //----check image is selected or not
            CGImageRef cgref = [self.selectedImage CGImage];
            CIImage *cim = [self.selectedImage CIImage];
            
            if (cim == nil && cgref == NULL)
            {
                [CommonUtils showMessage:@"Please select image to upload" :self];
                [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                return;
            }
        
            if([CommonUtils checkEmptyString:docID.text]==YES)
            {
                
                [CommonUtils showMessage:@"Please select document":self];
                [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                
                return;
                
            }
 
            //---------------
        
            UIAlertController *alertController;
            
            alertController=[UIAlertController
                                 alertControllerWithTitle:@"Confirmation"
                                 message:[NSString stringWithFormat:@"Would you like to upload selected image?"]
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
                                           
                                           NSString *dateString = [[formatter stringFromDate:[NSDate date]] uppercaseString];
                                           
                                           
                                           NSString *targetFileName=[NSString stringWithFormat:@"%@_%@",self.refNo,dateString];
                                           
                                           NSDictionary *jsonDictionary = @{@"refNo": emptyStringIfNil(self.refNo),
                                                             @"cifNumber":emptyStringIfNil(self.cifNumber),
                                                             @"imageStatus":emptyStringIfNil(@"ACTIVE"),
                                                             @"imageId":emptyStringIfNil(dateString),
                                                             @"docID":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%ld",(long)self.docID.tag]])
                                                             };
                                           
                                           
                                           //NSString *jsonString = [container JSONRepresentation];
                                           NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
                                           
                                           
                                           
                                           [CommonUtils connectHostImage :@"uploadImageDetails" :jsonDictionary:self:selectedImage:targetFileName:self.refNo: ^(NSDictionary *dictionary){
                                           
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                           [self parseResponseImage:dictionary:@"uploadImageDetails":@"imageDetailsWrapper"];
                                                           
                                                           if([imageData.imageUploadStatus boolValue] == NO)
                                                           {
                                                               [CommonUtils showMessage:@"Image couldn't upload, please retry again":self];
                                                               [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                                               return;
                                                           }
                                                           else
                                                           {
                                                               
                                                               [CommonUtils showMessage:@"Image uploaded successfully":self];
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
        
        
        
//        //NSLog(@"get validate user %@",userid);
//        
//        
//        
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
//                
//                
////                NSString *base64String=[jsonObject objectForKey:@"image"];
////                
////                NSLog(@"base64String %@", base64String);
////                
////                NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
////                NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
////                NSLog(@"decodedString %@", decodedString); // foo
////                
////                [self.imageView setImage:[UIImage imageWithData:decodedData]];
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



- (IBAction)showImagePickerForCamera:(id)sender
{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])  {
        
        [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else{
        
        [CommonUtils showMessage:@"Camera is not supported" :self];
        
    }
}


- (IBAction)showImagePickerForPhotoPicker:(id)sender
{
  
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    else
    {
       [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
    
    
    
}


- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    if (self.imageView.isAnimating)
    {
        [self.imageView stopAnimating];
    }
    
    if (self.capturedImages.count > 0)
    {
        [self.capturedImages removeAllObjects];
    }
    
    UIImagePickerController *imagePickerController1 = [[UIImagePickerController alloc] init];
    imagePickerController1.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController1.sourceType = sourceType;
    imagePickerController1.delegate = self;
    
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        imagePickerController1.showsCameraControls = YES;
        imagePickerController1.cameraFlashMode=UIImagePickerControllerCameraFlashModeOn;
    }
        /*
         The user wants to use the camera interface. Set up our custom overlay view for the camera.
         */
        
        
//        /*
//         Load the overlay view from the OverlayView nib file. Self is the File's Owner for the nib file, so the overlayView outlet is set to the main view in the nib. Pass that view to the image picker controller to use as its overlay view, and set self's reference to the view to nil.
//         */
//        //[[NSBundle mainBundle] loadNibNamed:@"OverlayView" owner:self options:nil];
//        
//        
//        
//        overlayView= [[UIView alloc]init];
//        overlayView.layer.borderWidth=1.0;
//        overlayView.layer.borderColor=[UIColor borderBlueColor].CGColor;
//        overlayView.layer.shadowRadius=10.0;
//        overlayView.backgroundColor = [UIColor whiteColor];
//        overlayView.layer.shadowOffset = CGSizeMake(0, 3);
//        overlayView.layer.shadowRadius = 10.0;
//        overlayView.layer.shadowColor = [UIColor blackColor].CGColor;
//        overlayView.layer.shadowOpacity = 0.8;
//        overlayView.layer.cornerRadius = 15.0;
//        overlayView.translatesAutoresizingMaskIntoConstraints=NO;
//        [self.view addSubview:overlayView];
//        
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:overlayView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];
//        
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:overlayView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.55 constant:0]];
//        
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:overlayView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//        
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:overlayView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.40 constant:0]];
//        
//
//        self.overlayView.frame = imagePickerController1.cameraOverlayView.frame;
//        imagePickerController1.cameraOverlayView = self.overlayView;
//        self.overlayView = nil;
//        
//        photoLibraryButton.hidden=YES;
//        cameraButton.hidden=YES;
//        takePictureButton.hidden=NO;
//        startStopButton.hidden=NO;
//        delayedPhotoButton.hidden=NO;
//        doneButton.hidden=NO;
//    }
    
    self.imagePickerController = imagePickerController1;
    self.imagePickerController.hidesBottomBarWhenPushed=YES;
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController.tabBarController presentViewController:self.imagePickerController animated:YES completion:nil];
}


#pragma mark - Toolbar actions

//- (IBAction)done:(id)sender
//{
//    // Dismiss the camera.
//    if ([self.cameraTimer isValid])
//    {
//        [self.cameraTimer invalidate];
//    }
//    [self finishAndUpdate];
//}
//
//
//- (IBAction)takePhoto:(id)sender
//{
//    [self.imagePickerController takePicture];
//}
//
//
//- (IBAction)delayedTakePhoto:(id)sender
//{
//    // These controls can't be used until the photo has been taken
//    self.cameraButton.enabled = NO;
//    self.takePictureButton.enabled = NO;
//    self.delayedPhotoButton.enabled = NO;
//    self.startStopButton.enabled = NO;
//    
//    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:5.0];
//    NSTimer *cameraTimer1 = [[NSTimer alloc] initWithFireDate:fireDate interval:1.0 target:self selector:@selector(timedPhotoFire:) userInfo:nil repeats:NO];
//    
//    [[NSRunLoop mainRunLoop] addTimer:cameraTimer1 forMode:NSDefaultRunLoopMode];
//    self.cameraTimer = cameraTimer1;
//}
//
//
//- (IBAction)startTakingPicturesAtIntervals:(id)sender
//{
//    /*
//     Start the timer to take a photo every 1.5 seconds.
//     
//     CAUTION: for the purpose of this sample, we will continue to take pictures indefinitely.
//     Be aware we will run out of memory quickly.  You must decide the proper threshold number of photos allowed to take from the camera.
//     One solution to avoid memory constraints is to save each taken photo to disk rather than keeping all of them in memory.
//     In low memory situations sometimes our "didReceiveMemoryWarning" method will be called in which case we can recover some memory and keep the app running.
//     */
//    //self.startStopButton.titleLabel = NSLocalizedString(@"Stop", @"Title for overlay view controller start/stop button");
//    //[self.startStopButton setAction:@selector(stopTakingPicturesAtIntervals:)];
//    
//    [startStopButton addTarget:self action:@selector(stopTakingPicturesAtIntervals:) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.doneButton.enabled = NO;
//    self.delayedPhotoButton.enabled = NO;
//    self.takePictureButton.enabled = NO;
//    
//    self.cameraTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(timedPhotoFire:) userInfo:nil repeats:YES];
//    [self.cameraTimer fire]; // Start taking pictures right away.
//}
//
//
//- (IBAction)stopTakingPicturesAtIntervals:(id)sender
//{
//    // Stop and reset the timer.
//    [self.cameraTimer invalidate];
//    self.cameraTimer = nil;
//    
//    [self finishAndUpdate];
//}
//

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
    
    self.imagePickerController = nil;
    
    photoLibraryButton.hidden=NO;
    cameraButton.hidden=NO;
//    takePictureButton.hidden=YES;
//    startStopButton.hidden=YES;
//    delayedPhotoButton.hidden=YES;
//    doneButton.hidden=YES;
}


#pragma mark - Timer

//// Called by the timer to take a picture.
//- (void)timedPhotoFire:(NSTimer *)timer
//{
//    [self.imagePickerController takePicture];
//}


#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.capturedImages addObject:image];
    
//    if ([self.cameraTimer isValid])
//    {
//        return;
//    }
    
    [self finishAndUpdate];
}
//--Popover
- (void)addItemViewController:(PopoverViewController *)controller didFinishEnteringItem:(NSString *)item  didFinishEnteringItem1:(NSString *)code didFinishEnteringItem2:(int)fieldTag
{
    NSLog(@"This was returned from PopoverViewController %ld", (long)fieldTag);
    // NSArray *components = [item componentsSeparatedByString:@"\n"];
    //NSLog(@" popvalues %@", components[0]);
    
    
    id viewObj = [self.view viewWithTag:(long)fieldTag];
    
    if([viewObj isKindOfClass:[UITextField class]])
    {
        UITextField *textField =(UITextField *)viewObj;
        textField.text=item;
        [popoverCodeValue setObject:code forKey:[NSString stringWithFormat:@"%d", fieldTag]];
        
        //[dataArray insertObject:code atIndex:fieldTag];
    }
    
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
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


@end
