//
//  OCRViewController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 5/5/16.
//  Copyright © 2016 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "OCRViewController.h"



@interface OCRViewController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red


@implementation OCRViewController


@synthesize menuName;
//@synthesize sessionid;
@synthesize actionMode;



@synthesize dataDictionary;

@synthesize dataArray;

@synthesize accountType;

@synthesize refNo;
@synthesize cifNumber;
@synthesize btnUpload;

@synthesize  imageArray;
@synthesize  imageData;



@synthesize imageView;

@synthesize photoLibraryButton;
@synthesize cameraButton;

@synthesize imagePickerController;

@synthesize capturedImages;

@synthesize selectedImage;

@synthesize docID;
@synthesize popoverCodeValue;

@synthesize recordStatus;


//@synthesize imageToRecognize;
@synthesize ocrButton;
@synthesize txtOCRView;
@synthesize ocrOriginal;
@synthesize ocrEditFlag;
@synthesize ocrPerformed;
//@synthesize progressView;
@synthesize activityIndicator;
@synthesize lblStatus;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    

    self.navigationItem.title=@"OCR";
    
    
    [CommonUtils loadActivityIndicator:self];
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
    UIView *mainView = [[UIView alloc] init];
    mainView.layer.borderWidth=1.0;
    mainView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    mainView.layer.shadowRadius=10.0;
    mainView.backgroundColor = [UIColor whiteColor];
    mainView.layer.shadowOffset = CGSizeMake(0, 3);
    mainView.layer.shadowRadius = 10.0;
    mainView.layer.shadowColor = [UIColor blackColor].CGColor;
    mainView.layer.shadowOpacity = 0.8;
    mainView.layer.cornerRadius = 15.0;
    mainView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:mainView];
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mainView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mainView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mainView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mainView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.9 constant:0]];
    
    
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:mainView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeCenterX multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeHeight multiplier:0.85 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeWidth multiplier:0.45 constant:0]];
    
    
    
    //-----photoLibraryButton
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoLibraryButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoLibraryButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoLibraryButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    
    //-----cameraButton
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:cameraButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    
    
    
    self.capturedImages = [[NSMutableArray alloc] init];
    
    
    btnUpload = [[UIButton alloc ] init];
    [btnUpload setTitle:@"Save" forState:UIControlStateNormal];
    btnUpload.layer.borderColor=[UIColor grayColor].CGColor;
    btnUpload.layer.borderWidth=0.5f;
    [btnUpload setBackgroundColor:[UIColor whiteColor]];
    [btnUpload setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnUpload.titleLabel.font = [UIFont systemFontOfSize:18];
    btnUpload.layer.cornerRadius=5.0f;
    [btnUpload addTarget:self action:@selector(doValidate) forControlEvents:UIControlEventTouchUpInside];
    btnUpload.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnUpload];
    
    
    //-----upload button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnUpload attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnUpload attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.25 constant:0]];
    
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
    
    
    
    
    txtOCRView= [[UITextView alloc] init];
    txtOCRView.tag=2;
    txtOCRView.delegate=self;
    txtOCRView.layer.borderWidth=1.0;
    txtOCRView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    txtOCRView.layer.shadowRadius=10.0;
    txtOCRView.backgroundColor = [UIColor whiteColor];
    txtOCRView.layer.shadowOffset = CGSizeMake(0, 3);
    txtOCRView.layer.shadowRadius = 10.0;
    txtOCRView.layer.shadowColor = [UIColor blackColor].CGColor;
    txtOCRView.layer.shadowOpacity = 0.8;
    txtOCRView.layer.cornerRadius = 15.0;
    txtOCRView.font = [UIFont systemFontOfSize:18];
    txtOCRView.autocorrectionType = UITextAutocorrectionTypeNo;
    txtOCRView.keyboardType = UIKeyboardTypeDefault;
    txtOCRView.returnKeyType = UIReturnKeyDone;
    txtOCRView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtOCRView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtOCRView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:mainView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtOCRView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeCenterX multiplier:1.45 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtOCRView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeHeight multiplier:0.85 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtOCRView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeWidth multiplier:0.45 constant:0]];

    
    ocrButton = [[UIButton alloc ] init];
    [ocrButton setTitle:@"OCR" forState:UIControlStateNormal];
    ocrButton.layer.borderColor=[UIColor grayColor].CGColor;
    ocrButton.layer.borderWidth=0.5f;
    [ocrButton setBackgroundColor:[UIColor whiteColor]];
    [ocrButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ocrButton.titleLabel.font = [UIFont systemFontOfSize:18];
    ocrButton.layer.cornerRadius=5.0f;
    [ocrButton addTarget:self action:@selector(recognizeImageWithTesseract) forControlEvents:UIControlEventTouchUpInside];
    ocrButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:ocrButton];
    
    
    //-----upload button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:ocrButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:ocrButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:ocrButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    

//    progressView = [[UIProgressView alloc] init];
//    [progressView setProgressViewStyle:UIProgressViewStyleDefault];
//    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 5.2f);
//    //progressView.tintColor=[UIColor grayColor];
//    progressView.progressTintColor=[UIColor redColor];
//    progressView.trackTintColor=[UIColor grayColor];
//    progressView.transform = transform;
//    progressView.layer.cornerRadius=15.0f;
//    //progressView.layer.masksToBounds=YES;
//    //progressView.clipsToBounds=YES;
//    progressView.progress = 0.0f;
//    progressView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview: progressView];
//    
//    //-----progress bar
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:mainView attribute:NSLayoutAttributeCenterY multiplier:1.65 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeHeight multiplier:0.0025 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeWidth multiplier:0.95 constant:0]];
    
    
    
    //----activity indicator
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2,self.view.frame.size.height / 2);
    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    activityIndicator.hidden=NO;
    activityIndicator.color=[UIColor grayColor];
    [activityIndicator setHidesWhenStopped:YES];
    [self.view addSubview:activityIndicator];
    

    //--activity indicator
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicator attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:mainView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicator attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicator attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicator attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    
    
    
    lblStatus = [[UILabel alloc] init];
    lblStatus.translatesAutoresizingMaskIntoConstraints=NO;
    lblStatus.textColor=[UIColor redColor];
    [self.view addSubview:lblStatus];
    
    //---Modified lable
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.66 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblStatus attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.9 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblStatus attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblStatus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    
    
    ocrPerformed=@"N";
    ocrEditFlag=@"N";
    
    // Create a queue to perform recognition operations
    self.operationQueue = [[NSOperationQueue alloc] init];
    
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

-(BOOL) textViewShouldBeginEditing:(UITextView *)textField
{
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }
    
    //--ImageDoC
    if(textField.tag==2)
    {
        
        ocrEditFlag=@"Y";
        
        return YES; //to disable keyboard
    }
    
    else
        return YES;
    
}


-(void) txtOCRViewEdited{
    
    ocrEditFlag=@"Y";
    
}

- (BOOL)textFieldShouldReturn:(UITextView *)textField {
    if (textField == self.txtOCRView) {
        ocrEditFlag=@"Y";
        [textField resignFirstResponder];
        return NO;
    }
    
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
        popoverViewController.tableName=tableName;
        popoverViewController.fieldTag=(int)sender.tag;
        popoverViewController.dateField=dateField;
        popoverViewController.dateRange=dateRange;
        popoverViewController.dateFormat=dateFormat;
        popoverViewController.filter=filter;
        popoverViewController.delegate=self;
        
       
        
        // Present the view controller using the popover style.
        popoverViewController.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:popoverViewController animated: YES completion: nil];
        
        // Get the popover presentation controller and configure it.
        UIPopoverPresentationController *presentationController =[popoverViewController popoverPresentationController];
        presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        presentationController.sourceView = self.view;
        NSLog(@"x %f and y %f %@",sender.frame.origin.x,sender.frame.origin.y,sender.class);
        presentationController.sourceRect =  CGRectMake(0, sender.frame.origin.y, 1, 1);
        
        
        

        
        
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
    
    
    
    
    //------To Check User Account Relations
    
    
    
    @try{
        
        
        NSLog(@"RefNo %@",self.refNo);
        
        [self.txtOCRView resignFirstResponder];
        
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
        
        if([CommonUtils checkEmptyString:txtOCRView.text]==YES)
        {
            
            [CommonUtils showMessage:@"OCR data is empty":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([ocrPerformed isEqualToString:@"N"])
        {
            
            [CommonUtils showMessage:@"Please perform OCR":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            return;
            
        }
        
        ocrPerformed=@"Y";
        
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
                                                                        @"docID":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%ld",(long)self.docID.tag]]),
                                                                        @"ocrFlag":@"Y",
                                                                        @"ocrData":emptyStringIfNil(txtOCRView.text),
                                                                        @"ocrOriginal":emptyStringIfNil(ocrOriginal),
                                                                        @"ocrEditFlag":emptyStringIfNil(ocrEditFlag)
                                                                        
                                                                        };
                                       
                                       
                                       //NSString *jsonString = [container JSONRepresentation];
                                       NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
                                       
                                       
                                       
                                       NSData *newData=[CommonUtils connectHostImage :@"uploadImageDetails" :jsonDictionary:self:selectedImage:targetFileName:self.refNo];
                                       [self parseResponseImage:newData:@"uploadImageDetails":@"imageDetailsWrapper"];
                                       
                                       if([imageData.imageUploadStatus boolValue] == NO)
                                       {
                                           [CommonUtils showMessage:@"Image couldn't upload, please retry again":self];
                                           [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                           return;
                                       }
                                       else
                                       {
                                           
                                           [CommonUtils showMessage:@"Image uploaded successfully":self];
                                           imageView.image=nil;
                                           selectedImage=nil;
                                           txtOCRView.text=@"";
                                           ocrOriginal=@"";
                                           ocrEditFlag=@"N";
                                           docID.text=@"";
                                           ocrPerformed=@"N";
                                           lblStatus.text=@"";
                                           
                                           [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                           //return;
                                           
                                       }
                                       

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
        
        photoLibraryButton.layer.borderColor=[UIColor grayColor].CGColor;
        
        
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




- (void) parseResponseImage:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        //NSLog(@"get validate user %@",userid);
        
        
        
        NSString *myData = [[NSString alloc] initWithData:data
                                                 encoding:NSUTF8StringEncoding];
        NSLog(@"JSON data = %@", myData);
        NSError *error = nil;
        
        //parsing the JSON response
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:data
                         options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            NSLog(@"Successfully deserialized...");
            
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);

                    
                }
                
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
                
                
                
                
                
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                //[CommonUtils showMessage:@"Invalid userid or password":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponse"];
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}

- (void) parseResponseImageLoad:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        //NSLog(@"get validate user %@",userid);
        
        
        

        NSError *error = nil;
        
        //parsing the JSON response
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:data
                         options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            NSLog(@"Successfully deserialized...");
            

            
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                NSString *base64String=[jsonObject objectForKey:@"image"];
                
                //NSLog(@"base64String %@", base64String);
                
                NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
                //NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
                //NSLog(@"decodedString %@", decodedString); // foo
                
                [self.imageView setImage:[UIImage imageWithData:decodedData]];
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
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
                
                
                
                
                
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                //[CommonUtils showMessage:@"Invalid userid or password":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponse"];
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}



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
    
    
    
    self.imagePickerController = imagePickerController1;
    self.imagePickerController.hidesBottomBarWhenPushed=YES;
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController.tabBarController presentViewController:self.imagePickerController animated:YES completion:nil];
}


#pragma mark - Toolbar actions


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
            
            self.txtOCRView.text=@"";
            ocrPerformed=@"N";
            lblStatus.text=@"";
            
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

    
    [CommonUtils startActivityIndicator:self];
    
    
}

-(void)stopActivityIndicator
{

    
    [CommonUtils stopActivityIndicator:self];
    
}

static inline NSString* emptyStringIfNil(NSString *value) {
    return value? value : @"";
}

//-(void)recognizeImageWithTesseract:(UIImage *)image
//{
-(void)recognizeImageWithTesseract
{
    // Animate a progress activity indicator
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    //----check image is selected or not
    CGImageRef cgref = [self.selectedImage CGImage];
    CIImage *cim = [self.selectedImage CIImage];
    
    if (cim == nil && cgref == NULL)
    {
        [CommonUtils showMessage:@"Please select image to OCR" :self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        return;
    }
    
    UIAlertController *alertController;
    
    alertController=[UIAlertController
                     alertControllerWithTitle:@"Confirmation"
                     message:[NSString stringWithFormat:@"Would you like to perform OCR on the selected image?"]
                     preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   
                                   //[NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
                                   
                                    self.txtOCRView.text=@"";
                                   
                                   photoLibraryButton.enabled=NO;
                                   ocrButton.enabled=NO;
                                   btnUpload.enabled=NO;
                                   cameraButton.enabled=NO;
                                   docID.enabled=NO;
                                   
                                   [self.activityIndicator startAnimating];

                                    // Create a new `G8RecognitionOperation` to perform the OCR asynchronously
                                    // It is assumed that there is a .traineddata file for the language pack
                                    // you want Tesseract to use in the "tessdata" folder in the root of the
                                    // project AND that the "tessdata" folder is a referenced folder and NOT
                                    // a symbolic group in your project
                                    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng"];
                                    
                                    // Use the original Tesseract engine mode in performing the recognition
                                    // (see G8Constants.h) for other engine mode options
                                    operation.tesseract.engineMode = G8OCREngineModeTesseractOnly;
                                    
                                    // Let Tesseract automatically segment the page into blocks of text
                                    // based on its analysis (see G8Constants.h) for other page segmentation
                                    // mode options
                                    operation.tesseract.pageSegmentationMode = G8PageSegmentationModeAutoOnly;
                                    
                                    // Optionally limit the time Tesseract should spend performing the
                                    // recognition
                                    //operation.tesseract.maximumRecognitionTime = 1.0;
                                    
                                    // Set the delegate for the recognition to be this class
                                    // (see `progressImageRecognitionForTesseract` and
                                    // `shouldCancelImageRecognitionForTesseract` methods below)
                                    operation.delegate = self;
                                    
                                    // Optionally limit Tesseract's recognition to the following whitelist
                                    // and blacklist of characters
                                    operation.tesseract.charWhitelist = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()-=_:;{}[]|?><=/|'";
                                    //operation.tesseract.charBlacklist = @"56789";
                                    
                                    // Set the image on which Tesseract should perform recognition
                                    operation.tesseract.image = selectedImage; //image;
                                    
                                    // Optionally limit the region in the image on which Tesseract should
                                    // perform recognition to a rectangle
                                    //operation.tesseract.rect = CGRectMake(20, 20, 100, 100);
                                    
                                    // Specify the function block that should be executed when Tesseract
                                    // finishes performing recognition on the image
                                    operation.recognitionCompleteBlock = ^(G8Tesseract *tesseract) {
                                        // Fetch the recognized text
                                        NSString *recognizedText = tesseract.recognizedText;
                                        
                                        NSLog(@"%@", recognizedText);
                                        
                                        // Remove the animated progress activity indicator
                                        //[NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                        
                                        // Spawn an alert with the recognized text
                                //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OCR Result"
                                //                                                        message:recognizedText
                                //                                                       delegate:nil
                                //                                              cancelButtonTitle:@"OK"
                                //                                              otherButtonTitles:nil];
                                //        [alert show];
                                //        

                                        //[CommonUtils showMessage:recognizedText:self];
                                        
                                        
                                        txtOCRView.text=recognizedText;
                                        ocrOriginal=recognizedText;
                                        
                                        ocrPerformed=@"Y";
                                        photoLibraryButton.enabled=YES;
                                        ocrButton.enabled=YES;
                                        btnUpload.enabled=YES;
                                        cameraButton.enabled=YES;
                                        docID.enabled=YES;
                                        
                                        [self.activityIndicator stopAnimating];

                                        
                                    };
                                    
                                    // Display the image to be recognized in the view
                                    //self.imageToRecognize.image = operation.tesseract.thresholdedImage;
                                    self.imageView.image=operation.tesseract.thresholdedImage;
                                    
                                    // Finally, add the recognition operation to the queue
                                    [self.operationQueue addOperation:operation];
                                   
                                   //[NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                   
                                   
                                   
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
    
    //[self.activityIndicator stopAnimating];
    
    //[NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}

/**
 *  This function is part of Tesseract's delegate. It will be called
 *  periodically as the recognition happens so you can observe the progress.
 *
 *  @param tesseract The `G8Tesseract` object performing the recognition.
 */
- (void)progressImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    NSLog(@"progress: %lu", (unsigned long)tesseract.progress);
    
    lblStatus.text=[NSString stringWithFormat: @"%ld",(unsigned long)tesseract.progress];
}

/**
 *  This function is part of Tesseract's delegate. It will be called
 *  periodically as the recognition happens so you can cancel the recogntion
 *  prematurely if necessary.
 *
 *  @param tesseract The `G8Tesseract` object performing the recognition.
 *
 *  @return Whether or not to cancel the recognition.
 */
- (BOOL)shouldCancelImageRecognitionForTesseract:(G8Tesseract *)tesseract {
    return NO;  // return YES, if you need to cancel recognition prematurely
}

//- (void)recognizeSampleImage:(id)sender {
//    [self recognizeImageWithTesseract:[UIImage imageNamed:@"image_sample.jpg"]];
//}

- (void)clearCache:(id)sender
{
    [G8Tesseract clearCache];
}

//#pragma mark - UIImagePickerController Delegate
//
//- (void)imagePickerController:(UIImagePickerController *)picker
//didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    UIImage *image = info[UIImagePickerControllerOriginalImage];
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    [self recognizeImageWithTesseract:image];
//}



@end
