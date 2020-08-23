//
//  IdentificationViewController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 7/30/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "IdentificationViewController.h"
#import "IdentificationData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "OccupationViewController.h"
#import "QueueViewController.h"





@interface IdentificationViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintX1=0.52f;
CGFloat lblConstraintY1=1.0f;
CGFloat lblConstraintWidth1=0.5f;
CGFloat lblConstraintHeight1=0.8f;

CGFloat constraintX1=1.19f;
CGFloat constraintY1=1.0f;
CGFloat constraintWidth1=0.80f;
CGFloat constraintHeight1=0.8f;

CGFloat constraint1X1=0.69f;
CGFloat constraint1Y1=1.0f;
CGFloat constraint1Width1=0.3f;
CGFloat constraint1Height1=0.8f;

CGFloat lblConstraint2X1=1.52f;
CGFloat lblConstraint2Y1=1.0f;
CGFloat lblConstraint2Width1=0.5f;
CGFloat lblConstraint2Height1=0.8f;

CGFloat constraint2X1=1.69f;
CGFloat constraint2Y1=1.0f;
CGFloat constraint2Width1=0.3f;
CGFloat constraint2Height1=0.8f;




@implementation IdentificationViewController




//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;
@synthesize menuName;
//@synthesize viewMode;

//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
@synthesize dataDictionary;



@synthesize identificationArray;
@synthesize identificationData;


@synthesize dateToolBar;
@synthesize datePicker;

//@synthesize labelArray;
//@synthesize labelNameArray;
//@synthesize label2Array;
//@synthesize labelName2Array;
//@synthesize componentsArray;
//@synthesize componentsNameArray;
//@synthesize components2Array;
//@synthesize componentsName2Array;
@synthesize dataArray;

@synthesize webView;
//@synthesize activityIndicator;
@synthesize lblLoading;

@synthesize timerView;
//@synthesize switchFlag;

int hours, minutes, seconds,secondsLeft;



//@synthesize txtPassportNo;
//@synthesize txtPassportExpDate;
//@synthesize txtPassportIssueDate;
//@synthesize txtPassportIssuePlace;
//@synthesize txtPassportIssueCountry;
//@synthesize txtEmiratesId;
//@synthesize txtEmiratesIdExpDate;

@synthesize txtMotherMaidenName;
@synthesize txtSegment;
@synthesize txtPreferredLang;
@synthesize txtFamilyUAE;
@synthesize txtFamilySize;
@synthesize txtCarOwnership;
@synthesize txtCarYear;
@synthesize txtMedia;
@synthesize txtFavCity;
@synthesize txtDomicile;

@synthesize txtVisaIssuePlace;
@synthesize txtImmigrationFile;
@synthesize txtVisaIssueDate;
@synthesize txtVisaExpDate;



@synthesize txtDrivingLicenseNo;
@synthesize txtDrivingExpDate;
@synthesize txtLabourCardNo;
@synthesize txtLabourCardExpDate;


@synthesize recordStatus;
@synthesize accountType;

@synthesize popoverCodeValue;
@synthesize pathArray;
@synthesize pathData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    if([actionMode isEqualToString:@"UPDATE"])
    {
        [self.navigationItem setHidesBackButton:NO animated:YES];
    }
    else
    {
        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        
    }
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
//    [self.splitViewController.displayModeButtonItem action];
    
    
    //self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Passport Details"];
    self.navigationItem.title=@"Visa Details";
    
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
    
    NSString *buttonLabel=@"Save";
    NSString *buttonLabelRej;
    
    
    if([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
    {
        buttonLabelRej=@"Reject";
    }
    
    if([self.actionMode isEqualToString:@"ENQUIRY"] || [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
    {
        buttonLabel=@"Next";
        
        
    }
    
    
    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:buttonLabel style:UIBarButtonItemStylePlain target:self action:@selector(doValidate)];
    
    UIBarButtonItem *rejrightNavButton = [[UIBarButtonItem alloc]initWithTitle:buttonLabelRej style:UIBarButtonItemStylePlain target:self action:@selector(doReject)];
    
    //self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    // create a spacer
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    
    NSArray *buttons = @[rightNavButton, space, rejrightNavButton ];
    
    self.navigationItem.rightBarButtonItems = buttons;
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
    //    sublayerHeader.bounds=headerView.bounds;
    //    [self.view.layer addSublayer:sublayerHeader];
    
    
    
    
    
    
    
    //UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
    //card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
    //card.contentMode=UIViewContentModeCenter;
    //[self.view addSubview:card];
    
    //[self fetchonBoardData];
    
    
    UIView *screenView = [[UIView alloc] init];
    screenView.layer.borderWidth=1.0;
    screenView.layer.borderColor=[UIColor whiteColor].CGColor;
    screenView.layer.shadowRadius=10.0;
    screenView.backgroundColor = [UIColor whiteColor];
    screenView.layer.shadowOffset = CGSizeMake(0, 3);
    screenView.layer.shadowRadius = 10.0;
    screenView.layer.shadowColor = [UIColor blackColor].CGColor;
    screenView.layer.shadowOpacity = 0.8;
    screenView.layer.cornerRadius = 15.0;
    screenView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:screenView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.03 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.83 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.70 constant:0]];
    
    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.frame = CGRectMake(30,200,270,300);
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    tableView.layer.borderWidth=1.0f;
    tableView.layer.borderColor=[UIColor whiteColor].CGColor;
    tableView.layer.cornerRadius=15.0f;
    //tableView.allowsSelection = NO;
    tableView.alwaysBounceVertical = NO;
    tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    
    tableView.sectionHeaderHeight = 0.0;
    tableView.sectionFooterHeight = 0.0;
    tableView.rowHeight=UITableViewAutomaticDimension;
    
    
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //    CGRect titleRect = CGRectMake(0, 0, 100, 20);
    //    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    //    tableTitle.textColor = [UIColor captionColor];
    //    tableTitle.backgroundColor = [tableView backgroundColor];
    //    tableTitle.opaque = YES;
    //    tableTitle.font = [UIFont boldSystemFontOfSize:14];
    //    tableTitle.textAlignment=NSTextAlignmentCenter;
    //    tableTitle.text = @"onBoardData";
    //    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
    //    tableView.tableHeaderView = tableTitle;
    
    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //[tableView setSeparatorColor:[UIColor whiteColor]];
    tableView.separatorInset=UIEdgeInsetsZero;
    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    // add to canvas
    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [screenView addSubview:tableView];
    
    
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    

    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
    
    
    timerView = [[UILabel alloc] init];
    timerView.layer.borderWidth=1.0;
    timerView.layer.borderColor=[UIColor whiteColor].CGColor;
    timerView.layer.shadowRadius=10.0;
    timerView.backgroundColor = [UIColor whiteColor];
    timerView.layer.shadowOffset = CGSizeMake(0, 3);
    timerView.layer.shadowRadius = 10.0;
    timerView.layer.shadowColor = [UIColor blackColor].CGColor;
    timerView.layer.shadowOpacity = 0.8;
    timerView.layer.cornerRadius = 15.0;
    timerView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:timerView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.35 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    secondsLeft = 16925;
    [self countdownTimer];
    
    
    UIButton *enameView = [[UIButton alloc] init];
    enameView.layer.borderWidth=1.0;
    enameView.layer.borderColor=[UIColor whiteColor].CGColor;
    enameView.layer.shadowRadius=10.0;
    enameView.backgroundColor = [UIColor whiteColor];
    enameView.layer.shadowOffset = CGSizeMake(0, 3);
    enameView.layer.shadowRadius = 10.0;
    enameView.layer.shadowColor = [UIColor blackColor].CGColor;
    enameView.layer.shadowOpacity = 0.8;
    enameView.layer.cornerRadius = 15.0;
    enameView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:enameView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    UIButton *dedupView = [[UIButton alloc] init];
    dedupView.layer.borderWidth=1.0;
    dedupView.layer.borderColor=[UIColor whiteColor].CGColor;
    dedupView.layer.shadowRadius=10.0;
    dedupView.backgroundColor = [UIColor whiteColor];
    dedupView.layer.shadowOffset = CGSizeMake(0, 3);
    dedupView.layer.shadowRadius = 10.0;
    dedupView.layer.shadowColor = [UIColor blackColor].CGColor;
    dedupView.layer.shadowOpacity = 0.8;
    dedupView.layer.cornerRadius = 15.0;
    dedupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:dedupView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    
    
    [self viewPathStatus];
    
    [self displayGraph];
    
    
    
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] ||[actionMode isEqualToString:@"ENQUIRY"] || ([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]))// && [viewMode isEqualToString:@"Y"])
    {
        
        [self viewData];
         //viewMode=@"N";
        
        
    }
  
    
    
    //[self displayHeader];
    
    
    
    
    
    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
    
    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
    {
        return NO;
    }
    
    //    if (textField == self.txtCustomerName) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //
    //    if (textField == self.txtShortName) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }

    
    [textField resignFirstResponder];
    
    if(textField.tag==7)
    {
        return NO;
    }
    else
        
        return YES;
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    if (textField.tag == 0) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
//    //--Passport No
//    if (textField.tag == 1) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 15;
//        
//    }
//    //--Passport Issue Place
//    if (textField.tag == 2) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//    //--Passport Issue Place
//    if (textField.tag == 5) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
    //--Visa Issue Place
    if (textField.tag == 1) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Immigration No
    if (textField.tag == 4) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Driving License
    if (textField.tag == 5) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Labour Card No
    if (textField.tag == 7) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Mother Maiden Name
    if (textField.tag == 9) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Segment
//    if (textField.tag == 12) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//    //--Emirates id
//    if (textField.tag == 14) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 15;
//        
//    }
    
    //    if (textField == self.self.txtSalary) {
    //
    //        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    //
    //        // allow backspace
    //        if (range.length > 0 && [string length] == 0) {
    //            return YES;
    //        }
    //        // do not allow . at the beggining
    //        if (range.location == 0 && [string isEqualToString:@"."]) {
    //            return NO;
    //        }
    //        // set the text field value manually
    //        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
    //        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
    //        textField.text = newValue;
    //        // return NO because we're manually setting the value
    //        return NO;
    //    }
    //    return YES;
    
    return YES;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }
    //    if ([textField isEqual: txtDOB])
    //    {
    //        [self setDate:txtDOB];
    //        return NO;
    //
    //    }
    //    else if([textField isEqual:txtNationality])
    //    {
    //        [self popoverData:txtNationality:@"NATIONALITY"];
    //        return NO; //to disable keyboard
    //    }
    //    else if([textField isEqual:txtJointOwn])
    //    {
    //        [self popoverData:txtJointOwn:@"JOINTOWN"];
    //        return NO; //to disable keyboard
    //    }
    
    //NSLog(@"fieldTag %ld", (long)textField.tag);
    
    
//    //Passport issue Date
//    if(textField.tag==3)
//    {
//        [self popoverDate:textField :@"LT":NULL];
//        return NO; //to disable keyboard
//    }
//    //Passport Expiry Date
//    if(textField.tag==4)
//    {
//        [self popoverDate:textField :@"GT":NULL];
//        return NO; //to disable keyboard
//    }
//    //--passport issue country
//    else if(textField.tag==5)
//    {
//        [self popoverData:textField:@"NATIONALITY"];
//        return NO; //to disable keyboard
//    }
//    //--emirates id expiry date
//    else if(textField.tag==15)
//    {
//        [self popoverDate:textField :@"GT":NULL];
//        return NO; //to disable keyboard
//    }
    
    //--visa issue date
    else if(textField.tag==2)
    {
        [self popoverDate:textField :@"LT":NULL];
        return NO; //to disable keyboard
    }
    //--visa expiry date
    else if(textField.tag==3)
    {
        [self popoverDate:textField :@"GT":NULL];
        return NO; //to disable keyboard
    }
    //--driving licence expiry date
    else if(textField.tag==6)
    {
        [self popoverDate:textField :@"GT":NULL];
        return NO; //to disable keyboard
    }
    //--labourcard expiry date
    else if(textField.tag==8)
    {
        [self popoverDate:textField :@"GT":NULL];
        return NO; //to disable keyboard
    }
    //Family In UAE
    else if(textField.tag==10)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }

    //Preferred Language
    else if (textField.tag ==11)
    {
        [self popoverData:textField:@"PreferredLanguage"];
        return NO;
        
    }
    //--Segment
    else if (textField.tag ==12)
    {
        [self popoverData:textField:@"Segment"];
        return NO;
        
    }
    
    //Family Size In UAE
    else if(textField.tag==13)
    {
        [self popoverData:textField:@"NUMBER"];
        return NO; //to disable keyboard
    }
    //Car Ownership
    else if(textField.tag==14)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //Car Year
    else if(textField.tag==15)
    {
        [self popoverDate:textField:NULL:@"YYYY"];
        return NO; //to disable keyboard
    }
    //--Media
    else if(textField.tag==16)
    {
        [self popoverData:textField:@"Media"];
        return NO; //to disable keyboard
    }
    //Favourite City
    else if(textField.tag==17)
    {
        [self popoverData:textField:@"FavouriteCity"];
        return NO; //to disable keyboard
    }
    

 
    else
        return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
    
    
}




-(void) popoverDate: (UITextField *)sender :(NSString *)dateRange :(NSString *)dateFormat
{
    [self popoverData:sender :NULL:@"Y":dateRange:dateFormat];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName
{
    [self popoverData:sender :tableName:@"N":NULL:NULL];
}



-(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *)dateField :(NSString *)dateRange :(NSString *)dateFormat
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


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
    [self animateTextField: textField up: NO];
    
    
    
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = textField.frame.origin.y / 2;//80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 9;//[componentsArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 50;
//
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    
    if(section == 0)
    {
        
        return @" Visa Details";
        
    }
    if (section == 4) {
        
        
        return @" Other Details";
    }
    
    else
        
        return nil;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if(section ==0)
//    {
//        return 0.00f;
//    }
//    return 10.0f;
//}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*if ((indexPath.row % 2) == 1) {
     cell.backgroundColor = [UIColor grayColor];
     //cell.textLabel.backgroundColor = [UIColor blackColor];
     cell.selectionStyle = UITableViewCellSelectionStyleGray;
     }
     else
     {
     cell.backgroundColor = [UIColor whiteColor];
     
     }*/
    
    cell.backgroundColor=[UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor lightGrayColor];
    //cell.layer.borderWidth=0.5f;
    //cell.layer.cornerRadius=15.0f;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //cell.layer.borderColor=[UIColor borderColor].CGColor;
    //cell.layer.shadowRadius=3.0f;
    //cell.layer.shadowOffset = CGSizeMake(0, 3);
    //cell.layer.shadowColor = [UIColor blackColor].CGColor;
    //cell.layer.shadowOpacity = 0.8;
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
    cell.textLabel.font  = myFont;
    //cell.textLabel.textColor=[UIColor blueColor];
    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:10.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
    cell.detailTextLabel.font  = mySecondFont;
    //cell.detailTextLabel.textColor=[UIColor blueColor];
    
    
    //top shadow
    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
    //CAGradientLayer *topShadow = [CAGradientLayer layer];
    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
    
    //[cell.contentView addSubview:topShadowView];
    
    
    
    //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
    //imv.image=[UIImage imageNamed:@"money-wallet-icon.png"];
    //    cell.imageView.image=[[UIImage imageNamed:@"account-sum-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    //    CAGradientLayer *gradient = [CAGradientLayer layer];
    //    gradient.frame = cell.bounds;
    //    gradient.layer.cornerRadius=10.0f;
    //    gradient.color=[UIColor whiteColor];
    //    //gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor], (id)[[UIColor redColor]CGColor], nil];
    //    [cell.layer addSublayer:gradient];
    
    
    //[cell addSubview:imv];
    
    
    //NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
    //NSLog(@"table view%ldd",(long) indexPath.section);
    
    
    //    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",[self.accountNumber objectAtIndex:indexPath.row],[self.accountCurrency objectAtIndex:indexPath.row],[self.accountCurrentBalance objectAtIndex:indexPath.row]];
    
    //onBoardData = [onBoardArray objectAtIndex:indexPath.row];
    //onBoardData = [onBoardArray objectAtIndex:indexPath.section];
    
    //identificationData = [identificationArray objectAtIndex:indexPath.section];
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];//]WithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
//        if(indexPath.section==0)
//        {
//            
//            CommonLabel *lblPassportNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblPassportNo.text=@"Passport No";
//            lblPassportNo.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblPassportNo];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
//            
//            
//            txtPassportNo=[[CommonTextField alloc] initWithFrame:CGRectZero];
//            txtPassportNo.tag=1;
//            txtPassportNo.delegate=self;
//            txtPassportNo.placeholder=@"Passport No";
//            txtPassportNo.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtPassportNo];
//            
// 
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
//            
//            
//            CommonLabel *lblPassportIssuePlace=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblPassportIssuePlace.text=@"Passport Issue Place";
//            lblPassportIssuePlace.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblPassportIssuePlace];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssuePlace attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssuePlace attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssuePlace attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssuePlace attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
//            
//            
//            txtPassportIssuePlace = [[CommonTextField alloc] init];
//            txtPassportIssuePlace.tag=2;
//            txtPassportIssuePlace.delegate=self;
//            txtPassportIssuePlace.placeholder=@"Passport Issue Place";
//            txtPassportIssuePlace.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtPassportIssuePlace];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssuePlace attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssuePlace attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssuePlace attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssuePlace attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
//            
//            
//            
//            
//        }
//        else if(indexPath.section==1)
//        {
//            
//            CommonLabel *lblPassportIssueDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblPassportIssueDate.text=@"Passport Issue Date";
//            lblPassportIssueDate.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblPassportIssueDate];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
//            
//            
//            txtPassportIssueDate = [[CommonTextField alloc] init];
//            txtPassportIssueDate.tag=3;
//            txtPassportIssueDate.delegate=self;
//            txtPassportIssueDate.placeholder=@"Passport Issue Date";
//            txtPassportIssueDate.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtPassportIssueDate];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
//            
//            
//            CommonLabel *lblPassportExpDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblPassportExpDate.text=@"Passport Expiry Date";
//            lblPassportExpDate.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblPassportExpDate];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
//            
//            
//            txtPassportExpDate = [[CommonTextField alloc] init];
//            txtPassportExpDate.tag=4;
//            txtPassportExpDate.delegate=self;
//            txtPassportExpDate.placeholder=@"Passport Expiry Date";
//            txtPassportExpDate.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtPassportExpDate];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
//            
//            
//        }
//        else if(indexPath.section==2){
//            
//            CommonLabel *lblPassportIssueCountry=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblPassportIssueCountry.text=@"Passport Issue Cntry";
//            lblPassportIssueCountry.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblPassportIssueCountry];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueCountry attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueCountry attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueCountry attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueCountry attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
//            
//            
//            txtPassportIssueCountry=[[CommonTextField alloc] initWithFrame:CGRectZero];
//            txtPassportIssueCountry.tag=5;
//            txtPassportIssueCountry.delegate=self;
//            txtPassportIssueCountry.placeholder=@"Passport Issue Country";
//            txtPassportIssueCountry.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtPassportIssueCountry];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueCountry attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueCountry attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueCountry attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueCountry attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
//            
//            
//        }
         if(indexPath.section==0){
            CommonLabel *visaIssueDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            visaIssueDate.text=@"Visa Issue Place";
            visaIssueDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:visaIssueDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:visaIssueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:visaIssueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:visaIssueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:visaIssueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            txtVisaIssuePlace=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtVisaIssuePlace.tag=1;
            txtVisaIssuePlace.delegate=self;
            txtVisaIssuePlace.placeholder=@"Visa Issue Place";
            txtVisaIssuePlace.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtVisaIssuePlace];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaIssuePlace attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaIssuePlace attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaIssuePlace attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaIssuePlace attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            
            
            CommonLabel *lblVisaIssueDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblVisaIssueDate.text=@"Visa Issue Date";
            lblVisaIssueDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblVisaIssueDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVisaIssueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVisaIssueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVisaIssueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVisaIssueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
            
            txtVisaIssueDate = [[CommonTextField alloc] init];
            txtVisaIssueDate.tag=2;
            txtVisaIssueDate.delegate=self;
            txtVisaIssueDate.placeholder=@"Visa Issue Date";
            txtVisaIssueDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtVisaIssueDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaIssueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaIssueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaIssueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaIssueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
            
        }
        else if(indexPath.section==1){
            CommonLabel *lblVisaExpDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblVisaExpDate.text=@"Visa Expiry Date";
            lblVisaExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblVisaExpDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVisaExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVisaExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVisaExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVisaExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            txtVisaExpDate=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtVisaExpDate.tag=3;
            txtVisaExpDate.delegate=self;
            txtVisaExpDate.placeholder=@"Visa Exp Date";
            txtVisaExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtVisaExpDate];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVisaExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            CommonLabel *lblImmigrationFile=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblImmigrationFile.text=@"Immigration File No";
            lblImmigrationFile.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblImmigrationFile];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblImmigrationFile attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblImmigrationFile attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblImmigrationFile attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblImmigrationFile attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
            
            txtImmigrationFile = [[CommonTextField alloc] init];
            txtImmigrationFile.tag=4;
            txtImmigrationFile.delegate=self;
            txtImmigrationFile.placeholder=@"Immigration File Number";
            txtImmigrationFile.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtImmigrationFile];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtImmigrationFile attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtImmigrationFile attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtImmigrationFile attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtImmigrationFile attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
            
            
           
            
            
        }
        else if(indexPath.section==2){
            
            
            
            CommonLabel *lblDrivingLicenseNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDrivingLicenseNo.text=@"Driving License No";
            lblDrivingLicenseNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDrivingLicenseNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDrivingLicenseNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDrivingLicenseNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDrivingLicenseNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDrivingLicenseNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            
            
            txtDrivingLicenseNo=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtDrivingLicenseNo.tag=5;
            txtDrivingLicenseNo.delegate=self;
            txtDrivingLicenseNo.placeholder=@"Driving License No";
            txtDrivingLicenseNo.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtDrivingLicenseNo];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDrivingLicenseNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDrivingLicenseNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDrivingLicenseNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDrivingLicenseNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            CommonLabel *lblDrivingLicenseExpDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDrivingLicenseExpDate.text=@"Driving Lic Exp Date";
            lblDrivingLicenseExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDrivingLicenseExpDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDrivingLicenseExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDrivingLicenseExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDrivingLicenseExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDrivingLicenseExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
           
            
            txtDrivingExpDate=[[CommonTextField alloc] init];
            txtDrivingExpDate.tag=6;
            txtDrivingExpDate.delegate=self;
            txtDrivingExpDate.placeholder=@"Driving License Exp Date";
            txtDrivingExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtDrivingExpDate];
            
  
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDrivingExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDrivingExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDrivingExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDrivingExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
            
        }
        
        else if(indexPath.section==3){
            
            
            CommonLabel *lblLobourCardNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblLobourCardNo.text=@"Labour Card No";
            lblLobourCardNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblLobourCardNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLobourCardNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLobourCardNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLobourCardNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLobourCardNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            txtLabourCardNo=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtLabourCardNo.tag=7;
            txtLabourCardNo.delegate=self;
            txtLabourCardNo.placeholder=@"Lobour Card No";
            txtLabourCardNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtLabourCardNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLabourCardNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLabourCardNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLabourCardNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLabourCardNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            
            CommonLabel *lblLobourExpDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblLobourExpDate.text=@"Labour Card Exp Dt";
            lblLobourExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblLobourExpDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLobourExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLobourExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLobourExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLobourExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
            
            txtLabourCardExpDate = [[CommonTextField alloc] init];
            txtLabourCardExpDate.tag=8;
            txtLabourCardExpDate.delegate=self;
            txtLabourCardExpDate.placeholder=@"Labour Card Exp Date";
            txtLabourCardExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtLabourCardExpDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLabourCardExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLabourCardExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLabourCardExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLabourCardExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
            
           
            
            
        }
        if(indexPath.section==4){
            
            CommonLabel *lblMotherMaidenName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMotherMaidenName.text=@"Mother Maiden Name";
            lblMotherMaidenName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMotherMaidenName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMotherMaidenName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMotherMaidenName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMotherMaidenName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMotherMaidenName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            txtMotherMaidenName = [[CommonTextField alloc] init];
            txtMotherMaidenName.tag=9;
            txtMotherMaidenName.delegate=self;
            txtMotherMaidenName.placeholder=@"Mother Maiden Name";
            txtMotherMaidenName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMotherMaidenName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMotherMaidenName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMotherMaidenName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMotherMaidenName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMotherMaidenName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            
            CommonLabel *lblSegment=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSegment.text=@"Segment";
            lblSegment.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSegment];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSegment attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSegment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSegment attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSegment attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
            
            txtSegment= [[CommonTextField alloc] init];
            txtSegment.tag=12;
            txtSegment.delegate=self;
            txtSegment.placeholder=@"Segment";
            txtSegment.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSegment];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSegment attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSegment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSegment attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSegment attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
            
            
            
        }

        
        if(indexPath.section==5){
            
            CommonLabel *lblPreferredLangauge=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPreferredLangauge.text=@"Preferred Langauge";
            lblPreferredLangauge.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPreferredLangauge];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreferredLangauge attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreferredLangauge attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreferredLangauge attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreferredLangauge attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            txtPreferredLang = [[CommonTextField alloc] init];
            txtPreferredLang.tag=11;
            txtPreferredLang.delegate=self;
            txtPreferredLang.placeholder=@"Preferred Langauge";
            txtPreferredLang.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPreferredLang];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreferredLang attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreferredLang attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreferredLang attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreferredLang attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            CommonLabel *lblFamilyinUae=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblFamilyinUae.text=@"Family In UAE";
            lblFamilyinUae.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblFamilyinUae];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilyinUae attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilyinUae attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilyinUae attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilyinUae attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
            
            txtFamilyUAE= [[CommonTextField alloc] init];
            txtFamilyUAE.tag=10;
            txtFamilyUAE.delegate=self;
            txtFamilyUAE.placeholder=@"Family In UAE";
            txtFamilyUAE.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtFamilyUAE];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilyUAE attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilyUAE attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilyUAE attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilyUAE attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
          
            
            
        }
        
        if(indexPath.section==6){
            
            CommonLabel *lblFamilySize=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblFamilySize.text=@"Family Size";
            lblFamilySize.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblFamilySize];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilySize attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilySize attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilySize attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilySize attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            txtFamilySize = [[CommonTextField alloc] init];
            txtFamilySize.tag=13;
            txtFamilySize.delegate=self;
            txtFamilySize.placeholder=@"Family Size";
            txtFamilySize.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtFamilySize];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilySize attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilySize attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilySize attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilySize attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            
            
            CommonLabel *lblCarOwnership=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCarOwnership.text=@"Car Ownership";
            lblCarOwnership.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCarOwnership];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarOwnership attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarOwnership attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarOwnership attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarOwnership attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
            
            txtCarOwnership= [[CommonTextField alloc] init];
            txtCarOwnership.tag=14;
            txtCarOwnership.delegate=self;
            txtCarOwnership.placeholder=@"Car Ownership";
            txtCarOwnership.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCarOwnership];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarOwnership attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarOwnership attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarOwnership attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarOwnership attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
            
        }
        
        if(indexPath.section==7){
            
            CommonLabel *lblCarYear=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCarYear.text=@"Car Year";
            lblCarYear.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCarYear];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarYear attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarYear attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarYear attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarYear attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            txtCarYear = [[CommonTextField alloc] init];
            txtCarYear.tag=15;
            txtCarYear.delegate=self;
            txtCarYear.placeholder=@"Car Year";
            txtCarYear.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCarYear];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarYear attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarYear attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarYear attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarYear attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            
            
            CommonLabel *lblMedia=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMedia.text=@"Media";
            lblMedia.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMedia];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMedia attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMedia attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMedia attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMedia attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
            
            txtMedia= [[CommonTextField alloc] init];
            txtMedia.tag=16;
            txtMedia.delegate=self;
            txtMedia.placeholder=@"Media";
            txtMedia.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMedia];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMedia attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMedia attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMedia attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMedia attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
            
        }
        
        
        
        if(indexPath.section==8){
            
            CommonLabel *lblFavouriteCity=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblFavouriteCity.text=@"Favourite City";
            lblFavouriteCity.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblFavouriteCity];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavouriteCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavouriteCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1  constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavouriteCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavouriteCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
            
            
            txtFavCity = [[CommonTextField alloc] init];
            txtFavCity.tag=17;
            txtFavCity.delegate=self;
            txtFavCity.placeholder=@"Favourite City";
            txtFavCity.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtFavCity];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
            
            
            
            CommonLabel *lblDomicile=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDomicile.text=@"Domicile";
            lblDomicile.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDomicile];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDomicile attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDomicile attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDomicile attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDomicile attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
            
            
            txtDomicile=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtDomicile.tag=18;
            txtDomicile.delegate=self;
            txtDomicile.placeholder=@"Domicile";
            txtDomicile.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDomicile];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDomicile attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDomicile attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDomicile attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDomicile attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
            
            
        }



//        
//        if(indexPath.section==8){
//            
//            CommonLabel *lblEmiratesExpDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblEmiratesExpDate.text=@"Emirates Id Exp Dt";
//            lblEmiratesExpDate.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblEmiratesExpDate];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1  constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1  constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
//            
//            
//            txtFavCity = [[CommonTextField alloc] init];
//            txtFavCity.tag=22;
//            txtFavCity.delegate=self;
//            txtFavCity.placeholder=@"Favourite City";
//            txtFavCity.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtFavCity];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
//            
//            
//            
//           
//            
//            
//        }

        


        
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
     if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"])  && [identificationArray count]>0)
    {
        [self loadData];
    
        
    }
    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    // Create a view controller with the title as its
    //    // navigation title and push it.
    //    NSUInteger row = indexPath.row;
    //    if (row != NSNotFound)
    //    {
    //        // Create the view controller and initialize it with the
    //        // next level of data.
    //        MyViewController *viewController = [[MyViewController alloc]
    //                                            initWithTable:tableView andDataAtIndexPath:indexPath];
    //        [[self navigationController] pushViewController:viewController
    //                                               animated:YES];
    //    }
//    
//    NSUInteger row = indexPath.section;//row;
//    
//    
//    
//    if (row != NSNotFound)
//    {
//        identificationData = [identificationArray objectAtIndex:0];
//        
//     
//        
//        // NSLog(@"selected account %@",onBoardData.accountNumber);
//        
//        if([actionMode isEqualToString:@"TRNHISTORY"])
//        {
//            
//            
//            //            AccountTrnViewController *accountTrnViewController = [[AccountTrnViewController alloc]initWithNibName:nil bundle:nil];
//            //
//            //            //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
//            //
//            //            accountTrnViewController.cifNumber=onBoardData.cifNumber;
//            //            accountTrnViewController.accountNumber=onBoardData.accountNumber;
//            //            accountTrnViewController.sessionid=self.sessionid;
//            //            accountTrnViewController.userid=self.userid;
//            //
//            //            [self.navigationController pushViewController:accountTrnViewController animated:YES];
//            
//        }
//        
//        
//        
//    }
 
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}

- (void) doValidate {
    
    
    //------validation starts---------
//        if([CommonUtils checkEmptyString:txtPassportNo.text]==YES)
//        {
//    
//            [CommonUtils showMessage:@"Passport Number can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    
//            return;
//    
//        }
//    
//        if([CommonUtils checkEmptyString:txtPassportIssuePlace.text]==YES)
//        {
//    
//            [CommonUtils showMessage:@"Passport Issue Place can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//        if([CommonUtils checkEmptyString:txtPassportIssueDate.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Passport Issue Date can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//        if([CommonUtils checkEmptyString:txtPassportExpDate.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Passport Expiry Date can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//        if([CommonUtils checkEmptyString:txtPassportIssueCountry.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Passport Issue Country can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
        if([CommonUtils checkEmptyString:txtVisaIssuePlace.text]==YES)
        {
            
            [CommonUtils showMessage:@"Visa Issue Place can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtVisaIssueDate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Visa Issue Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }  if([CommonUtils checkEmptyString:txtVisaExpDate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Visa Expiry Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtImmigrationFile.text]==YES)
        {
            
            [CommonUtils showMessage:@"Immigration File No  can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtDrivingExpDate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Driving License Expiry Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtLabourCardExpDate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Labour Card Expiry Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtPreferredLang.text]==YES)
        {
    
            [CommonUtils showMessage:@"Preferred Language can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtFamilyUAE.text]==YES)
        {
    
            [CommonUtils showMessage:@"Family in UAE can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtFamilySize.text]==YES)
        {
    
            [CommonUtils showMessage:@" Family Size can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtCarOwnership.text]==YES)
        {
    
            [CommonUtils showMessage:@" Car Ownership can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        //--Having car than only allow Car Year
        if([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCarOwnership.tag]] isEqualToString:@"YES01"] &&   [CommonUtils checkEmptyString:txtCarYear.text]==YES)
        {
    
            [CommonUtils showMessage:@" Car Year can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtMedia.text]==YES)
        {
    
            [CommonUtils showMessage:@" Media can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtFavCity.text]==YES)
        {
    
            [CommonUtils showMessage:@"Favourite City can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    

//        if([CommonUtils checkEmptyString:txtEmiratesIdExpDate.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Emirates Id Expiry Date can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
    
    
    
    
    
//    if([actionMode isEqualToString:@"FETCH"])
//    {
//        actionMode=@"UPDATE";
//    }
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    [self buildJSON];
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
    
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    //recordStatus=@"INPROGRESS";
    
    NSLog(@"identification action mode %@",actionMode);
    NSLog(@"identification Ref no %@",self.refNo);
    
    
    @try{
    
//        if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//        {
//            jsonDictionary= @{@"refNo":self.refNo};
//        }
//        else
//        {
        
           
            
            //-------
            
            jsonDictionary= @{
                                @"refNo":emptyStringIfNil(self.refNo),
                                @"immiFileNumber":emptyStringIfNil(self.txtImmigrationFile.text),
                                @"visaIssuePlace":emptyStringIfNil(self.txtVisaIssuePlace.text),
                                @"visaIssueDate":emptyStringIfNil(self.txtVisaIssueDate.text),
                                @"visaExpDate":emptyStringIfNil(self.txtVisaExpDate.text),
                                @"drivingLicenseNo":emptyStringIfNil(self.txtDrivingLicenseNo.text),
                                @"drivingLicenseExpDate":emptyStringIfNil(self.txtDrivingExpDate.text),
                                @"labourCardNo":emptyStringIfNil(self.txtLabourCardNo.text),
                                @"labourCardExpDate":emptyStringIfNil(self.txtLabourCardExpDate.text),
                                @"motherMaidenName":emptyStringIfNil(self.txtMotherMaidenName.text),
                                @"segment":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtSegment.tag]]),
                                @"preferredLanguage":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPreferredLang.tag]]),
                                @"familyInUAE":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFamilyUAE.tag]]),
                                @"familySizeUAE":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFamilySize.tag]]),
                                @"carOwnership":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCarOwnership.tag]]),
                                @"carYear":([self.txtCarYear.text length]==0?@"":self.txtCarYear.text),
                                @"media":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtMedia.tag]]),
                                @"favouriteCity":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFavCity.tag]]),
                                @"domicile":emptyStringIfNil(self.txtDomicile.text),
                               
                                @"recordStatus":emptyStringIfNil(self.recordStatus)
                                };

//        @"passportNo":emptyStringIfNil(self.txtPassportNo.text),
//        @"passportIssueDate":emptyStringIfNil(self.txtPassportIssueDate.text),
//        @"passportExpDate":emptyStringIfNil(self.txtPassportExpDate.text),
//        @"passportIssuePlace":emptyStringIfNil(self.txtPassportIssuePlace.text),
//        @"passportIssueCountry":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPassportIssueCountry.tag]]),
//        @"emiratesID":emptyStringIfNil(self.txtEmiratesId.text),
//        @"emiratesIDExpDate":emptyStringIfNil(self.txtEmiratesIdExpDate.text),
        
        //}
        
        
        //        for (int i=0; i<=[componentsArray count]-1; i++) {
        //
        //            if([[componentsArray objectAtIndex:i] isKindOfClass:[UITextField class]])
        //            {
        //
        //                [jsonDictionary initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>
        //
        //
        //            }
        //        }
        
        
        
        
        //NSString *jsonString = [container JSONRepresentation];
        
//        if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//        {
//            
//            newData=[CommonUtils connectHost :@"fetchPassportDetails" :jsonDictionary:self];
//            [self parseResponse:newData:@"fetchPassportDetails":@"passportWrapper"];
//            
//            
//        }
        //else
        //{
        
            
        
                newData=[CommonUtils connectHost :@"updatePassportDetails" :jsonDictionary:self];
                [self parseResponse:newData:@"updatePassportDetails":@"passportWrapper"];
            
            
        //}
        
        
        
        //---invoke next screen---
        //if([viewMode isEqualToString:@"N"])
        //{
            NSLog(@"To invoke Occupation screen %@",self.refNo);
            
//            if([actionMode isEqualToString:@"NEW"])
//            {
//                viewMode=@"N";
//            }
//            if([actionMode isEqualToString:@"UPDATE"])
//            {
//                viewMode=@"Y";
//            }
//            
            OccupationViewController *occupationViewController = [[OccupationViewController alloc]initWithNibName:nil bundle:nil];
            occupationViewController.actionMode=self.actionMode;
            occupationViewController.recordStatus=self.recordStatus;
            //occupationViewController.viewMode=self.viewMode;
            occupationViewController.refNo=self.refNo;
            occupationViewController.existingCustomerFlag=self.existingCustomerFlag;
            occupationViewController.accountType=self.accountType;
            occupationViewController.menuName=self.menuName;
            [self.navigationController pushViewController:occupationViewController animated:YES];
        //}

    }
    @catch (NSException *exception) {
        
            NSLog(@"Exception in fetch Identification Details code %@ reason %@ " , [exception name], [exception reason]);
        
            [CommonUtils showMessage:[exception reason] :self];
        
        
        
        
    }
    @finally {
        
        NSLog(@"finally in fetch Identification Details Code");
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }

    
}


- (void) viewData {
    


    NSLog(@"identification Ref no %@",self.refNo);
    
    
    @try{
        
        NSDictionary *jsonDictionary;
        
            [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
     
        
        
        if([self.actionMode isEqualToString:@"NEW"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"] && [self.existingCustomerFlag isEqualToString:@"Y"])
        {
            jsonDictionary= @{@"refNo":emptyStringIfNil(self.existingRefNo)};
             NSLog(@"Existing Ref No %@",self.existingRefNo);
            
        }
        else
        {
            jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        }
//
            NSData *newData=[CommonUtils connectHost :@"fetchPassportDetails" :jsonDictionary:self];
            [self parseResponse:newData:@"fetchPassportDetails":@"passportWrapper"];
        
          
        
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in fetch Identification Details viewData code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
        
        
        
        
    }
    @finally {
        
        NSLog(@"finally in Indentification Details viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
}


- (void) viewPathStatus {
    
    @try{
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        
        NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
       
        
        
        
        NSData *newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
        [self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];
        
        
        
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in PathStatus Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}

-(void) loadData {
    
    
    @try{
        
        
        identificationData = [identificationArray objectAtIndex:0];
        
//        txtPassportNo.text=emptyStringIfNil(identificationData.passportNo);
//        txtPassportIssueDate.text=emptyStringIfNil(identificationData.passportIssueDate);
//        txtPassportExpDate.text=emptyStringIfNil(identificationData.passportExpDate);
//        txtPassportIssuePlace.text=emptyStringIfNil(identificationData.passportIssuePlace);
//        txtPassportIssueCountry.text=emptyStringIfNil(identificationData.passportIssueCountryValue);
//        txtEmiratesId.text=emptyStringIfNil(identificationData.emiratesID);
//        txtEmiratesIdExpDate.text=emptyStringIfNil(identificationData.emiratesIDExpDate);
        
        txtImmigrationFile.text=emptyStringIfNil(identificationData.immiFileNumber);
        txtVisaIssuePlace.text=emptyStringIfNil(identificationData.visaIssuePlace);
        txtVisaIssueDate.text=emptyStringIfNil(identificationData.visaIssueDate);
        txtVisaExpDate.text=emptyStringIfNil(identificationData.visaExpDate);
        txtDrivingLicenseNo.text=emptyStringIfNil(identificationData.drivingLicenseNo);
        txtDrivingExpDate.text=emptyStringIfNil(identificationData.drivingLicenseExpDate);
        txtLabourCardNo.text=emptyStringIfNil(identificationData.labourCardNo);
        txtLabourCardExpDate.text=emptyStringIfNil(identificationData.labourCardExpDate);
        
        txtMotherMaidenName.text=emptyStringIfNil(identificationData.motherMaidenName);
        txtSegment.text=emptyStringIfNil(identificationData.segmentValue);
        txtPreferredLang.text=emptyStringIfNil(identificationData.preferredLanguageValue);
        txtFamilyUAE.text=emptyStringIfNil(identificationData.familyInUAEValue);
        txtFamilySize.text=emptyStringIfNil(identificationData.familySizeUAEValue);
        txtCarOwnership.text=emptyStringIfNil(identificationData.carOwnershipValue);
        txtCarYear.text=emptyStringIfNil(identificationData.carYear);
        txtMedia.text=emptyStringIfNil(identificationData.mediaValue);
        txtFavCity.text=emptyStringIfNil(identificationData.favouriteCityValue);
        txtDomicile.text=emptyStringIfNil(identificationData.domicile);
        
        [popoverCodeValue setObject:emptyStringIfNil(self.identificationData.segment) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtSegment.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.identificationData.preferredLanguage) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtPreferredLang.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.identificationData.familyInUAE) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFamilyUAE.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.identificationData.familySizeUAE) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFamilySize.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.identificationData.carOwnership) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtCarOwnership.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.identificationData.media) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtMedia.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.identificationData.favouriteCity) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFavCity.tag]];
        
        
        //[popoverCodeValue setObject:emptyStringIfNil(self.identificationData.passportIssueCountry) forKey:[NSString stringWithFormat:@"%d", self.txtPassportIssueCountry.tag]];
        
        
        
        
        NSLog(@"cell data loaded ");
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Load Data code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in Load Data Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
    
}

- (void) doReject {
    
    
    @try{
        
        
        UIAlertController *alertController=[UIAlertController
                                            alertControllerWithTitle:@"Confirmation"
                                            message:[NSString stringWithFormat:@"Do you want to send this Application %@ back to maker?",self.refNo]
                                            preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* okAction = [UIAlertAction
                                   actionWithTitle:@"Proceed"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
                                       
                                       
                                       
                                       [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
                                       
                                       //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
                                       //{
                                       NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo),
                                                                       @"recordStatus":@"INPROGRESS"
                                                                       };
                                       //}
                                       
                                       //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
                                       //{
                                       
                                       NSData *newData=[CommonUtils connectHost :@"updateApplicationStatus" :jsonDictionary:self];
                                       [self parseResponse:newData:@"updateApplicationStatus":@"personalDetailsWrapper"];
                                       
                                       
                                       
                                       
                                       QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                                       queueViewController.actionMode=@"UPDATE";
                                       queueViewController.menuId=@"QUEUEAPPROVER";
                                       queueViewController.recordStatus=@"CREATE";
                                       [self.navigationController pushViewController:queueViewController animated:YES];
                                       
                                       
                                       //}
                                       [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                       
                                       
                                       
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
        
        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in doreject Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}


//- (NSData *) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary {
//
//
//    @try {
//
//
//
//        NSLog(@"connectHost %@",userid);
//
//
//
//        NSError *errorOut;
//        NSString *jsonString;
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
//                                                             error:&errorOut];
//        
//        if (! jsonData) {
//            NSLog(@"Got an error in json creation: %@", errorOut);
//        } else {
//            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }
//        
//        NSLog(@"jsondata %@",jsonString);
//        
//        
//        //string for the URL request
//        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/onBoardDataServlet";
//        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://192.168.1.37:8083";
//        //create string for parameters that we need to send in the HTTP POST body
//        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=%@&message=%@",userid,sessionid,methodAction,jsonString];
//        
//        
//        //create a NSURL object from the string data
//        NSURL *myUrl = [NSURL URLWithString:myUrlString];
//        
//        //create a mutable HTTP request
//        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
//        //sets the receiver’s timeout interval, in seconds
//        [urlRequest setTimeoutInterval:120.0f];
//        //sets the receiver’s HTTP request method
//        [urlRequest setHTTPMethod:@"POST"];
//        //sets the request body of the receiver to the specified data.
//        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        //allocate a new operation queue
//        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//        //Loads the data for a URL request and executes a handler block on an
//        //operation queue when the request completes or fails.
//        /*[NSURLConnection
//         sendAsynchronousRequest:urlRequest
//         queue:queue
//         completionHandler:^(NSURLResponse *response,
//         NSData *data,
//         NSError *error) {
//         if ([data length] >0 && error == nil){
//         //process the JSON response
//         //use the main queue so that we can interact with the screen
//         dispatch_async(dispatch_get_main_queue(), ^{
//         [self parseResponse:data];
//         });
//         }
//         else if ([data length] == 0 && error == nil){
//         NSLog(@"Empty Response, not sure why?");
//         }
//         else if (error != nil){
//         NSLog(@"Not again, what is the error = %@", error);
//         }
//         }];*/
//        
//        
//        NSURLResponse *response = nil;
//        NSError *error = nil;
//        //getting the data
//        NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
//        if ([newData length] >0 && error == nil){
//            //process the JSON response
//            //use the main queue so that we can interact with the screen
//            
//            return newData;
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//            [CommonUtils showMessage:@"No response from host system":self];
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//            
//            [CommonUtils showError:error:self:@"connectHost"];
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//        //
//        //            //back to the main thread for the UI call
//        //            dispatch_async(dispatch_get_main_queue(), ^{
//        //                [spinner stopAnimating];
//        //            });
//        //            });
//        
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in connectHost code %@ reason %@ " , [exception name], [exception reason]);
//        
//         [CommonUtils showMessage:[exception reason] :self];
//        
//        
//    }
//    @finally {
//        
//        NSLog(@"finally in connectHost Code");
//    }
//    
//    
//    
//    
//    
//    
//}



- (void) parseResponse:(NSData *) data :(NSString *)methodAction :(NSString *)dataFile {
    
    
    @try {
        
        
        
        //NSLog(@"parse response %@",userid);
        
        
        
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
            
            //check if the customer code was valid
            //userid = [jsonObject objectForKey:@"userid"];
            //sessionid = [jsonObject objectForKey:@"sessionid"];
            
            //NSLog(@"userid print :%@",userid);
            //NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                    identificationArray = [[NSMutableArray alloc] init];
                
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    identificationData = [[IdentificationData alloc] initWithJSONDictionary:dict];
                    
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [identificationArray addObject:identificationData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)identificationArray.count);
                
                
                
                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
                //
                //                for(NSString *key in [customerMasterData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"Customer number"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"onBoardDataWrapper"];
                
                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
                
                
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
                //
                //                }
                
                
                //                accountName = [customerDetailData objectForKey:@"customerName"];
                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
                //                onBoardDatatatus= [customerDetailData objectForKey:@"onBoardDatatatus"];
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"accountNumber"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
                //                onBoardDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
                //                onBoardDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
                
                
                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                //                for (NSString *string in onBoardDataKeyData) {
                //                    NSLog(@" array key data:%@", string);
                //                }
                //
                //                for (NSString *string in onBoardDataValueData) {
                //                    NSLog(@" array value data:%@", string);
                //                }
                
                //for (NSDictionary *info in [customerInfo allValues])
                //{
                //   [custData addObject:[info valueForKey:@"custName"]];
                //}
                
                //NSArray * values = [dictionary allValues];
                //NSArray *keys = [dictionary allKeys];
                //NSArray *values = [dictionary allValues];
                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //    [yourArray addObject:obj];
                //}];
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
                
                
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

- (void) parseResponsePath:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        //NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            
            //check if the customer code was valid
            //userid = [jsonObject objectForKey:@"userid"];
            //sessionid = [jsonObject objectForKey:@"sessionid"];
            
            //NSLog(@"userid print :%@",userid);
            //NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                //dataDictionary =[jsonObject objectForKey:@"fetchPersonalDetails"];
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                pathArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    pathData = [[PathData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [pathArray addObject:pathData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)pathArray.count);
                
                
                
                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
                //
                //                for(NSString *key in [customerMasterData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"Customer number"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"onBoardDataWrapper"];
                
                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
                
                
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
                //
                //                }
                
                
                //                accountName = [customerDetailData objectForKey:@"customerName"];
                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
                //                onBoardDatatatus= [customerDetailData objectForKey:@"onBoardDatatatus"];
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"accountNumber"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
                //                onBoardDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
                //                onBoardDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
                
                
                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                //                for (NSString *string in onBoardDataKeyData) {
                //                    NSLog(@" array key data:%@", string);
                //                }
                //
                //                for (NSString *string in onBoardDataValueData) {
                //                    NSLog(@" array value data:%@", string);
                //                }
                
                //for (NSDictionary *info in [customerInfo allValues])
                //{
                //   [custData addObject:[info valueForKey:@"custName"]];
                //}
                
                //NSArray * values = [dictionary allValues];
                //NSArray *keys = [dictionary allKeys];
                //NSArray *values = [dictionary allValues];
                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //    [yourArray addObject:obj];
                //}];
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
                
                
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


//- (void) displayHeader{
//
//
//    if(onBoardArray.count >0)
//    {
//
//        onBoardData = [onBoardArray objectAtIndex:0];
//
//        //capture first account details
//        //customerName=[NSString stringWithFormat:@"%@",onBoardData.customerName ];
//        //customerSegment=[NSString stringWithFormat:@"%@",onBoardData.customerSegment];
//        //NSLog(@" custname %@",customerName);
//        //NSLog(@" custseg %@",customerSegment);
//    }
//
//
//    UIView *headerView = [[UIView alloc] init];
//    headerView.layer.borderWidth=1.0;
//    headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
//    headerView.layer.shadowRadius=10.0;
//    headerView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor whiteColor];
//    headerView.layer.shadowOffset = CGSizeMake(0, 3);
//    headerView.layer.shadowRadius = 10.0;
//    headerView.layer.shadowColor = [UIColor blackColor].CGColor;
//    headerView.layer.shadowOpacity = 0.8;
//    headerView.layer.cornerRadius = 15.0;
//    //headerView.layer.doubleSided=YES;
//    headerView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:headerView];
//
//    //create the frame that will contain our label
//    //CGRect labelFrame = CGRectMake(40, 60, 240, 80);
//
//    NSLog(@" frame width %lf",headerView.bounds.size.width);
//    NSLog(@" frame height %lf",headerView.bounds.size.height);
//
//
////    //CGRectMake(25, 90, 270, 100);
////    //labelFrame.size.height = 00.0f;
////    UILabel *lblCustomerName = [[UILabel alloc] init];//WithFrame:headerView.frame];
////    lblCustomerName.textColor = [UIColor blackColor];
////    //set the number of lines to contain a bigger text
////    //lblCustomerName.numberOfLines = 2;
////    //lblCustomerName.font = [UIFont italicSystemFontOfSize:12.0f];
////    lblCustomerName.font = [UIFont boldSystemFontOfSize:14.0f];
////    lblCustomerName.textAlignment =  NSTextAlignmentLeft;
////    //lblCustomerName.layer.borderColor = [UIColor blackColor].CGColor;
////    //lblCustomerName.layer.borderWidth = 1.0;
////    if(onBoardArray.count >0)
////    {
////        lblCustomerName.text =[NSString stringWithFormat:@"%@",onBoardData.customerName];
////    }
////    lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
////    [self.view addSubview:lblCustomerName];
//
//
//
//    //move the frame position
//    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
//    //headerView.bounds.origin.y +=  15.0f;
//    UILabel *lblCustomerSegment = [[UILabel alloc] init];//WithFrame:headerView.frame];
//    lblCustomerSegment.font = [UIFont boldSystemFontOfSize:14.0f];
//    lblCustomerSegment.textAlignment =  NSTextAlignmentLeft;
//    lblCustomerSegment.textColor = [UIColor blackColor];
//    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
//    //lblCustomerNumber.layer.borderWidth = 1.0;
//
////    if(onBoardArray.count >0)
////    {
////        lblCustomerSegment.text = [NSString stringWithFormat:@"%@",onBoardData.customerSegment];
////    }
//    lblCustomerSegment.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:lblCustomerSegment];
//
//
//    //---header UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
//
//
//    //----customer name
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.9 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
//    //-----customer segement
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
//
//
//
//    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.80 constant:0]];
//    //
//
//    //    //labelFrame.origin.y += labelFrame.size.height + 1.0f;
//    //    labelFrame.origin.y +=  20.0f;
//    //    UILabel *lblavalBalance  = [[UILabel alloc] initWithFrame:labelFrame];
//    //    lblavalBalance.textColor = [UIColor blackColor];
//    //    lblavalBalance.text = [NSString stringWithFormat:@"Available Balance    %@",availableBalance];
//    //    //set the number of lines to 0, meaning use as many lines as needed
//    //    lblavalBalance.numberOfLines = 0;
//    //    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
//    //    lblavalBalance.font = [UIFont boldSystemFontOfSize:12.0f];
//    //    lblavalBalance.textAlignment =  NSTextAlignmentLeft;
//    //    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
//    //    //lblavalBalance.layer.borderWidth = 1.0;
//    //    //Resizes and moves the receiver view so it just encloses its subviews.
//    //    //watch the border of the frame in this example
//    //    //[lblavalBalance sizeToFit];
//    //    [self.view addSubview:lblavalBalance];
//
//}
//
//
//-(void) displayMessage:(NSError *) error{
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"message"
//                                            message:@"Unable to connect to server, please try again"
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   [self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//    
//    
//}


- (void)addItemViewController:(PopoverViewController *)controller didFinishEnteringItem:(NSString *)item  didFinishEnteringItem1:(NSString *)code didFinishEnteringItem2:(int)fieldTag
{
    //NSLog(@"This was returned from PopoverViewController %ld", (long)fieldTag);
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



-(void)countdownTimer{
    
    secondsLeft = hours = minutes = seconds = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(secondsLeft > 0 ){
        secondsLeft -- ;
        hours = secondsLeft / 3600;
        minutes = (secondsLeft % 3600) / 60;
        seconds = (secondsLeft %3600) % 60;
        self.timerView.font=[UIFont systemFontOfSize:45.0f];
        self.timerView.textColor=[UIColor brownColor];
        self.timerView.textAlignment=NSTextAlignmentCenter;
        self.timerView.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    }
    else{
        secondsLeft = 16925;
    }
}

-(void)displayGraph
{
    
    webView = [[UIWebView alloc] init];//]WithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    webView.tag=55;
    webView.delegate = self;
    webView.layer.borderWidth=1.0;
    webView.layer.borderColor=[UIColor whiteColor].CGColor;
    webView.layer.shadowRadius=10.0;
    webView.backgroundColor = [UIColor whiteColor];
    webView.layer.shadowOffset = CGSizeMake(0, 3);
    webView.layer.shadowRadius = 10.0;
    webView.layer.shadowColor = [UIColor blackColor].CGColor;
    webView.layer.shadowOpacity = 0.8;
    webView.layer.cornerRadius = 15.0;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"pathstatus" ofType:@"html" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    webView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:webView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.78 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.58 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.23 constant:0]];
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString* json;
    
    @try
    {
        
        
        
        NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
        
        
        for (int i=0; i<=pathArray.count-1; i++)
        {
            
            pathData = [pathArray objectAtIndex:i];
            
            NSLog(@"path screen %@",pathData.screen);
            
            [jsonDictionary setObject:pathStringIfNil(pathData.status) forKey:pathData.screen];
            
            
        }
        
        
        NSError *errorOut;
        NSString *jsonString;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&errorOut];
        
        if (! jsonData) {
            NSLog(@"Got an error in json creation chart: %@", errorOut);
        } else {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        NSLog(@"jsondata %@",jsonString);
        
        
        json = [NSString stringWithFormat:@ "loadDashboardChart(%@);",jsonString];
        
        NSLog(@"function json %@",json);
        [self.webView stringByEvaluatingJavaScriptFromString: json];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in webViewDidFinishLoad code %@ reason %@ " , [exception name], [exception reason]);
        
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in webViewDidFinishLoad  Code");
    }
    
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


//
//-(void) loadActivityIndicator
//{
//    //----activity indicator
//    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    
//    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
//    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
//    activityIndicator.hidden=NO;
//    activityIndicator.color=[UIColor borderBlueColor];
//    [activityIndicator setHidesWhenStopped:YES];
//    
//    
//    
//    //-----label loading----
//    lblLoading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height+30.0f)];
//    lblLoading.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    lblLoading.font = [UIFont boldSystemFontOfSize:12.0f];
//    lblLoading.numberOfLines = 1;
//    lblLoading.textAlignment=NSTextAlignmentCenter;
//    lblLoading.backgroundColor = [UIColor clearColor];
//    lblLoading.textColor = [UIColor borderBlueColor];
//    
//    
//    [self.view addSubview:lblLoading];
//    [self.view bringSubviewToFront:lblLoading];
//    [lblLoading addSubview:activityIndicator];
//    
//}
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

static inline NSString* pathStringIfNil(NSString *value) {
    
    return ([value isEqualToString:@"Y"]? @"100" : @"0");
}


@end
