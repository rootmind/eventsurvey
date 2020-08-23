//
//  PersonalViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 22/08/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "SurveyViewController.h"
#import "PersonalData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "QueueViewController.h"
#import <QuartzCore/CALayer.h>




@interface SurveyViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

//#define kOFFSET_FOR_KEYBOARD 80.0

CGFloat lblConstraintPerX=0.52f;
CGFloat lblConstraintPerY=1.0f;
CGFloat lblConstraintPerWidth=0.5f;
CGFloat lblConstraintPerHeight=0.8f;

CGFloat constraintPerX=1.19f;
CGFloat constraintPerY=1.0f;
CGFloat constraintPerWidth=0.80f;
CGFloat constraintPerHeight=0.8f;

CGFloat constraintPer1X=0.69f;
CGFloat constraintPer1Y=1.0f;
CGFloat constraintPer1Width=0.3f;
CGFloat constraintPer1Height=0.8f;

CGFloat lblConstraintPer2X=0.50f;//1.52f;
CGFloat lblConstraintPer2Y=1.0f;//1.0f;
CGFloat lblConstraintPer2Width=0.45f;
CGFloat lblConstraintPer2Height=0.8f;

CGFloat constraintPer2X=1.45f;   //1.69f;
CGFloat constraintPer2Y=1.0f;
CGFloat constraintPer2Width= 0.5f;//0.3f;
CGFloat constraintPer2Height=0.8f;


@implementation SurveyViewController


//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize menuName;
//@synthesize viewMode;

//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
@synthesize dataDictionary;



//@synthesize personalArray;
//@synthesize personalData;

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

//@synthesize webView;
//@synthesize activityIndicator;
@synthesize lblLoading;

//@synthesize timerView;
//@synthesize switchFlag;

//int hours, minutes, seconds,secondsLeft;



//@synthesize accountType;
//@synthesize refNo;
//@synthesize existingCustomerFlag;
//@synthesize existingRefNo;
//@synthesize txtRefNo;
//@synthesize swtExistingCustomer;
//@synthesize txtExtRelation;
//@synthesize txtExtRelationNo;
//
//@synthesize txtCustomerName;
//@synthesize txtFirstName;
//@synthesize txtMiddleName;
//@synthesize txtLastName;


//@synthesize txtTitle;
//@synthesize txtCategoryType;
//@synthesize txtBranch;
//@synthesize txtJointOwn;
//@synthesize txtNatureOfRelation;
//@synthesize txtResidenceStatus;
//@synthesize txtNationality;
//@synthesize txtDateOfBirth;
//@synthesize txtEducation;
//@synthesize txtMaritalStatus;
//@synthesize txtGender;

//@synthesize txtMotherMaidenName;
//@synthesize txtSegment;
//@synthesize txtPreferredLang;
//@synthesize txtFamilyUAE;
//@synthesize txtFamilySize;
//@synthesize txtCarOwnership;
//@synthesize txtCarYear;
//@synthesize txtMedia;
//@synthesize txtFavCity;
//@synthesize txtDomicile;

//@synthesize txtPassportNo;
//@synthesize txtPassportExpDate;
//@synthesize txtPassportIssueDate;
//@synthesize txtPassportIssuePlace;
//@synthesize txtPassportIssueCountry;
//@synthesize txtEmiratesId;
//@synthesize txtEmiratesIdExpDate;

@synthesize errorArray;
@synthesize errorData;


//@synthesize recordStatus;
//@synthesize btnExtRelationshipNo;
//
@synthesize popoverCodeValue;
//@synthesize pathArray;
//@synthesize pathData;

@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;

@synthesize eventDataArray;
@synthesize eventTemplateDataArray;
@synthesize results;
@synthesize resultsEventTemplate;

@synthesize resultsEventTemplatePage1;
@synthesize resultsEventTemplatePage2;
@synthesize resultsEventTemplatePage3;

@synthesize txtComponent;
@synthesize swtComponent;
@synthesize listTableName;
@synthesize multiListTableName;
@synthesize dateFields;
@synthesize numericFields;
@synthesize fieldNames;
@synthesize mandatoryFields;
@synthesize inActiveFields;
@synthesize maxLengthFields;
//@synthesize dataEntryValues;

//@synthesize numberFormatter;

@synthesize surveyDataDictionary;
@synthesize tableViewPage1;
@synthesize tableViewPage2;
@synthesize tableViewPage3;

@synthesize eventID;
@synthesize eventName;
@synthesize instituteID;
@synthesize instituteName;
@synthesize screenView1;
@synthesize screenView2;
@synthesize screenView3;
@synthesize segmentedControl;
@synthesize eventImage;
@synthesize btnSubmit;
@synthesize popoverTag;

- (void)viewDidLoad {

    @try{


    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    
//    if([actionMode isEqualToString:@"UPDATE"])
//    {
//        [self.navigationItem setHidesBackButton:NO animated:YES];
//    }
//    else
//    {
//        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        
//    }
//   // self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
//    //[self.splitViewController.displayModeButtonItem action];
//    
//    
////    self.navigationItem.title= [NSString stringWithFormat:@"%@ - %@",self.menuName,@"Personal Details"];//@"Personal Detaills";
//    self.navigationItem.title= @"Personal Details";
//    
//    
//    [CommonUtils loadActivityIndicator:self];
    
    CoreDataController *coreDataController=[CoreDataController sharedCoreDataController];
    
    managedObjectContext = coreDataController.managedObjectContext;
    managedObjectModel=coreDataController.managedObjectModel;
    persistentStoreCoordinator = coreDataController.persistentStoreCoordinator;
    
    NSLog(@"Before Fetch EventTemplate");
    //---To Fetch----
    
   
    NSFetchRequest *requestEventTemplate= [NSFetchRequest fetchRequestWithEntityName:@"MST_EventTemplate"];
    //[requestEventTemplate setReturnsObjectsAsFaults:NO];
    NSError *error=nil;
    [requestEventTemplate setPredicate:[NSPredicate predicateWithFormat:@"eventID == %@", eventID]];
    
    NSArray *resultsSortEventTemplate = [managedObjectContext executeFetchRequest:requestEventTemplate error:&
                                     error];
    if (!resultsSortEventTemplate) {
        NSLog(@"Error fetching EventTemplate objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
    
    //NSLog(@" resultsSortEventTemplate-1 %@",resultsSortEventTemplate);
    //EventTemplateMO *eventTemplateDataMO=(EventTemplateMO *)resultsSortEventTemplate[0];
    
    //NSLog(@"Return values from MO desc value %@",eventTemplateDataMO.component);
    //NSLog(@"Return values from PVC MO desc value %@",eventTemplateDataMO.seqNo);
    
    NSSortDescriptor *viewOrderDescriptor =
    [[NSSortDescriptor alloc] initWithKey:@"viewOrder"
                                ascending:YES
                                 selector:@selector(localizedStandardCompare:)];
    NSArray *descriptors = [NSArray arrayWithObjects:viewOrderDescriptor, nil];
    
    resultsEventTemplate = [resultsSortEventTemplate sortedArrayUsingDescriptors:descriptors];
    

    //------filtered for page number
    NSPredicate *page1Predicate = [NSPredicate predicateWithFormat:@"pageNo == 'PAGE-1'"];
    NSPredicate *page2Predicate = [NSPredicate predicateWithFormat:@"pageNo == 'PAGE-2'"];
    NSPredicate *page3Predicate = [NSPredicate predicateWithFormat:@"pageNo == 'PAGE-3'"];

    NSArray *resultsSortEventTemplatePage1 = [resultsSortEventTemplate filteredArrayUsingPredicate:page1Predicate];
    NSArray *resultsSortEventTemplatePage2 = [resultsSortEventTemplate filteredArrayUsingPredicate:page2Predicate];
    NSArray *resultsSortEventTemplatePage3 = [resultsSortEventTemplate filteredArrayUsingPredicate:page3Predicate];

    //------sort order for each page
    resultsEventTemplatePage1 = [resultsSortEventTemplatePage1 sortedArrayUsingDescriptors:descriptors];
    resultsEventTemplatePage2 = [resultsSortEventTemplatePage2 sortedArrayUsingDescriptors:descriptors];
    resultsEventTemplatePage3 = [resultsSortEventTemplatePage3 sortedArrayUsingDescriptors:descriptors];
    
    
    
//     NSLog(@" resultsEventTemplatePage1 %@",resultsEventTemplatePage1);
//     NSLog(@" resultsEventTemplatePage2 %@",resultsEventTemplatePage2);
//     NSLog(@" resultsEventTemplatePage3 %@",resultsEventTemplatePage3);

    
//    if(NSString stringWithContents, eventTemplateDataMO.componet)
//    {
//    UITextField *txtUserid = [[UITextField alloc] init];
//    txtUserid.borderStyle = UITextBorderStyleRoundedRect;
//    txtUserid.layer.borderWidth=0.5;
//    txtUserid.layer.borderColor=[UIColor blackColor].CGColor;
//    txtUserid.layer.cornerRadius=5.0;
//    txtUserid.font = [UIFont systemFontOfSize:18];
//    txtUserid.placeholder = @"Enter userid";
//    txtUserid.autocorrectionType = UITextAutocorrectionTypeNo;
//    txtUserid.keyboardType = UIKeyboardTypeDefault;
//    txtUserid.returnKeyType = UIReturnKeyDone;
//    txtUserid.clearButtonMode = UITextFieldViewModeWhileEditing;
//    txtUserid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    txtUserid.delegate = self;
//    txtUserid.text=@"";
//    txtUserid.delegate=self;
//    txtUserid.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:txtUserid];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
//    }
    
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
    
//    //self.navigationItem.title=@"Account Summary";
//    NSString *buttonLabel=@"Save";
//    NSString *buttonLabelRej;
//    
//    
//    if([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
//    {
//        buttonLabelRej=@"Reject";
//    }
//    
//    if([self.actionMode isEqualToString:@"ENQUIRY"] || [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
//    {
//        buttonLabel=@"Next";
//        
//    
//    }
//  
//    



    //submit button
//    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:self action:@selector(doValidate)];
//    self.navigationItem.rightBarButtonItem =rightNavButton ;


    
    // create a spacer
    //UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    
    //space.width = 30;
    
    //NSArray *buttons = @[rightNavButton, space, rejrightNavButton ];
    
    //self.navigationItem.rightBarButtonItems = buttons;
    
    
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
    
    [self displayEventHeader];
    
    NSArray *itemArray = [NSArray arrayWithObjects: [resultsEventTemplatePage1 count]>0?@"PAGE-1":nil, [resultsEventTemplatePage2 count]>0?@"PAGE-2":nil, [resultsEventTemplatePage3 count]>0?@"PAGE-3":nil,nil];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    [segmentedControl addTarget:self action:@selector(segmentControlAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.backgroundColor=[UIColor whiteColor];
    segmentedControl.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:segmentedControl];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:segmentedControl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.38 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:segmentedControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:segmentedControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.04 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:segmentedControl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.97 constant:0]];

    
    
    
    //----------Screen View1------------
    
    screenView1 = [[UIView alloc] init];
    screenView1.layer.borderWidth=1.0;
    screenView1.layer.borderColor=[UIColor whiteColor].CGColor;
    screenView1.layer.shadowRadius=10.0;
    screenView1.backgroundColor = [UIColor whiteColor];
    screenView1.layer.shadowOffset = CGSizeMake(0, 3);
    screenView1.layer.shadowRadius = 10.0;
    screenView1.layer.shadowColor = [UIColor blackColor].CGColor;
    screenView1.layer.shadowOpacity = 0.8;
    screenView1.layer.cornerRadius = 15.0;
    screenView1.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:screenView1];
    
    //---Screen UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.97 constant:0]];
    
    //----------Screen View2--------
    screenView2 = [[UIView alloc] init];
    screenView2.layer.borderWidth=1.0;
    screenView2.layer.borderColor=[UIColor whiteColor].CGColor;
    screenView2.layer.shadowRadius=10.0;
    screenView2.backgroundColor = [UIColor whiteColor];
    screenView2.layer.shadowOffset = CGSizeMake(0, 3);
    screenView2.layer.shadowRadius = 10.0;
    screenView2.layer.shadowColor = [UIColor blackColor].CGColor;
    screenView2.layer.shadowOpacity = 0.8;
    screenView2.layer.cornerRadius = 15.0;
    screenView2.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:screenView2];
    
    //---Screen UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.97 constant:0]];
    
    
    //----------Screen View3--------
    screenView3 = [[UIView alloc] init];
    screenView3.layer.borderWidth=1.0;
    screenView3.layer.borderColor=[UIColor whiteColor].CGColor;
    screenView3.layer.shadowRadius=10.0;
    screenView3.backgroundColor = [UIColor whiteColor];
    screenView3.layer.shadowOffset = CGSizeMake(0, 3);
    screenView3.layer.shadowRadius = 10.0;
    screenView3.layer.shadowColor = [UIColor blackColor].CGColor;
    screenView3.layer.shadowOpacity = 0.8;
    screenView3.layer.cornerRadius = 15.0;
    screenView3.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:screenView3];
    
    //---Screen UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.97 constant:0]];
    
    
    [self displayPage1];
    [self displayPage2];
    [self displayPage3];
   
    screenView1.hidden=NO;
    screenView2.hidden=YES;
    screenView3.hidden=YES;
    
  
    
      
    btnSubmit = [[UIButton alloc ] init];//WithFrame:CGRectMake(120, 200, 60, 30) ];
    [btnSubmit setTitle:@"Submit" forState:UIControlStateNormal];
    //btnSubmit.titleLabel.text=@"Login";
    //[btnSubmit setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    //btnSubmit.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btnSubmit.layer.borderColor=[UIColor grayColor].CGColor;
    btnSubmit.layer.borderWidth=0.5f;
    [btnSubmit setBackgroundColor:[UIColor strongAzureColor]];
    [btnSubmit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //btnSubmit.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    btnSubmit.titleLabel.font = [UIFont systemFontOfSize:24];
    btnSubmit.layer.cornerRadius=5.0f;
    //btnSubmit.layer.masksToBounds=YES;
    //btnSubmit.clipsToBounds=YES;
    [btnSubmit addTarget:self action:@selector(doValidate) forControlEvents:UIControlEventTouchUpInside];
    btnSubmit.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnSubmit];
    
    //-----submit button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSubmit attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSubmit attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.91 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSubmit attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.97 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSubmit attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
    
    //switchFlag=@"N";
    
    
    
//    timerView = [[UILabel alloc] init];
//    timerView.layer.borderWidth=1.0;
//    timerView.layer.borderColor=[UIColor whiteColor].CGColor;
//    timerView.layer.shadowRadius=10.0;
//    timerView.backgroundColor = [UIColor whiteColor];
//    timerView.layer.shadowOffset = CGSizeMake(0, 3);
//    timerView.layer.shadowRadius = 10.0;
//    timerView.layer.shadowColor = [UIColor blackColor].CGColor;
//    timerView.layer.shadowOpacity = 0.8;
//    timerView.layer.cornerRadius = 15.0;
//    timerView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:timerView];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.35 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    secondsLeft = 16925;
//    [self countdownTimer];

    
//    UIButton *enameView = [[UIButton alloc] init];
//    [enameView setTitle:@"eName Check" forState:UIControlStateNormal];
//    [enameView setTitleColor:[UIColor gambogeColor] forState:UIControlStateNormal];
//    enameView.titleLabel.font = [UIFont systemFontOfSize:30];
//    enameView.layer.borderWidth=1.0;
//    enameView.layer.borderColor=[UIColor whiteColor].CGColor;
//    enameView.layer.shadowRadius=10.0;
//    enameView.backgroundColor = [UIColor whiteColor];
//    enameView.layer.shadowOffset = CGSizeMake(0, 3);
//    enameView.layer.shadowRadius = 10.0;
//    enameView.layer.shadowColor = [UIColor blackColor].CGColor;
//    enameView.layer.shadowOpacity = 0.8;
//    enameView.layer.cornerRadius = 15.0;
//    enameView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:enameView];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.75 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//
//    UIButton *btnDedup = [[UIButton alloc] init];
//    [btnDedup setTitle:@"Dedup" forState:UIControlStateNormal];
//    [btnDedup setTitleColor:[UIColor deepvermilionColor] forState:UIControlStateNormal];
//    btnDedup.titleLabel.font = [UIFont systemFontOfSize:30];
//    btnDedup.layer.borderWidth=1.0;
//    btnDedup.layer.borderColor=[UIColor whiteColor].CGColor;
//    btnDedup.layer.shadowRadius=10.0;
//    btnDedup.backgroundColor = [UIColor whiteColor];
//    btnDedup.layer.shadowOffset = CGSizeMake(0, 3);
//    btnDedup.layer.shadowRadius = 10.0;
//    btnDedup.layer.shadowColor = [UIColor blackColor].CGColor;
//    btnDedup.layer.shadowOpacity = 0.8;
//    btnDedup.layer.cornerRadius = 15.0;
//    
//    [btnDedup addTarget:self action:@selector(doDedup:) forControlEvents:UIControlEventTouchUpInside];
//    btnDedup.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnDedup];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDedup attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.50 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDedup attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDedup attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDedup attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
    

    
    
    //[self viewPathStatus];
    

    //[self displayGraph];
    
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    listTableName = [[NSMutableDictionary alloc]init];
    multiListTableName = [[NSMutableDictionary alloc]init];
    dateFields = [[NSMutableDictionary alloc]init];
    numericFields= [[NSMutableDictionary alloc]init];
    fieldNames= [[NSMutableDictionary alloc]init];
    mandatoryFields= [[NSMutableDictionary alloc]init];
    inActiveFields= [[NSMutableDictionary alloc]init];
    maxLengthFields = [[NSMutableDictionary alloc]init];
    surveyDataDictionary = [[NSMutableDictionary alloc]init];


    //----assign keyvalue as SeqNo in the dictionary so that all SeqNo numbers will be captured initially
    EventTemplateMO *eventTemplateDataMO;
    for (int i=0; i<=resultsEventTemplate.count-1; i++)
    {
        eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplate[i];
        
        //Store Survey Data
        [surveyDataDictionary setObject:@"" forKey:eventTemplateDataMO.seqNo];

    }



    //------to get page number format; string to number
    //numberFormatter = [[NSNumberFormatter alloc] init];
    //numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;


    //--when not new
//    if([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"])// && [viewMode isEqualToString:@"Y"])
//    {
//        
//        [self viewData];
//        
//        
//        
//        //viewMode=@"N";
//        
//        
//    }
    

    
    //[self displayHeader];
    
    
    
    
    
    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
    
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in ViewDidLoad %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in ViewDidLoad");
    }
    
    
}


- (void) displayPage1{


    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableViewPage1 = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableViewPage1.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableViewPage1.delegate = self;
    tableViewPage1.dataSource = self;
    //tableViewPage1.frame = CGRectMake(30,200,270,300);
    tableViewPage1.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    tableViewPage1.layer.borderWidth=1.0f;
    tableViewPage1.layer.borderColor=[UIColor whiteColor].CGColor;
    tableViewPage1.layer.cornerRadius=15.0f;
    //tableViewPage1.allowsSelection = NO;
    tableViewPage1.alwaysBounceVertical = NO;
    tableViewPage1.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    
    tableViewPage1.sectionHeaderHeight = 0.0;
    tableViewPage1.sectionFooterHeight = 0.0;
    tableViewPage1.rowHeight=UITableViewAutomaticDimension;
    
    
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
    
    //tableViewPage1.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //[tableView setSeparatorColor:[UIColor whiteColor]];
    tableViewPage1.separatorInset=UIEdgeInsetsZero;
    //tableViewPage1.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    // add to canvas
    tableViewPage1.translatesAutoresizingMaskIntoConstraints=NO;
    [screenView1 addSubview:tableViewPage1];
    
    
    
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
    
    
    
    
    //---Table UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView1 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView1 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView1 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
  

}

- (void) displayPage2{


    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableViewPage2 = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableViewPage2.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableViewPage2.delegate = self;
    tableViewPage2.dataSource = self;
    //tableViewPage2.frame = CGRectMake(30,200,270,300);
    tableViewPage2.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    tableViewPage2.layer.borderWidth=1.0f;
    tableViewPage2.layer.borderColor=[UIColor whiteColor].CGColor;
    tableViewPage2.layer.cornerRadius=15.0f;
    //tableViewPage2.allowsSelection = NO;
    tableViewPage2.alwaysBounceVertical = NO;
    tableViewPage2.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    
    tableViewPage2.sectionHeaderHeight = 0.0;
    tableViewPage2.sectionFooterHeight = 0.0;
    tableViewPage2.rowHeight=UITableViewAutomaticDimension;
    
    
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
    
    //tableViewPage2.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //[tableView setSeparatorColor:[UIColor whiteColor]];
    tableViewPage2.separatorInset=UIEdgeInsetsZero;
    //tableViewPage2.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    // add to canvas
    tableViewPage2.translatesAutoresizingMaskIntoConstraints=NO;
    [screenView2 addSubview:tableViewPage2];
    
    
    
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
    
    
    
    
    //---Table UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView2 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView2 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView2 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
  

}

- (void) displayPage3{


    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableViewPage3 = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableViewPage3.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableViewPage3.delegate = self;
    tableViewPage3.dataSource = self;
    //tableViewPage3.frame = CGRectMake(30,200,270,300);
    tableViewPage3.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    tableViewPage3.layer.borderWidth=1.0f;
    tableViewPage3.layer.borderColor=[UIColor whiteColor].CGColor;
    tableViewPage3.layer.cornerRadius=15.0f;
    //tableViewPage3.allowsSelection = NO;
    tableViewPage3.alwaysBounceVertical = NO;
    tableViewPage3.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    
    tableViewPage3.sectionHeaderHeight = 0.0;
    tableViewPage3.sectionFooterHeight = 0.0;
    tableViewPage3.rowHeight=UITableViewAutomaticDimension;
    
    
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
    
    //tableViewPage3.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //[tableView setSeparatorColor:[UIColor whiteColor]];
    tableViewPage3.separatorInset=UIEdgeInsetsZero;
    //tableViewPage3.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    // add to canvas
    tableViewPage3.translatesAutoresizingMaskIntoConstraints=NO;
    [screenView3 addSubview:tableViewPage3];
    
    
    
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
    
    
    
    
    //---Table UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView3 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView3 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView3 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableViewPage3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView3 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
  

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
      NSInteger nextTag = textField.tag + 1;
      // Try to find next responder
      UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
      if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
      } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
      }
      return NO; // We do not want UITextField to insert line-breaks.
    
}

- (BOOL)textViewShouldReturn:(UITextField *)textView {
    
      NSInteger nextTag = textView.tag + 1;
      // Try to find next responder
      UIResponder* nextResponder = [textView.superview viewWithTag:nextTag];
      if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
      } else {
        // Not found, so remove keyboard.
        [textView resignFirstResponder];
      }
      return NO; // We do not want UITextField to insert line-breaks.
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

        //Prevent crashing undo bug – see note below.
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }


        //----To get max length allowed to enter data
        NSString *strMaxLength = [maxLengthFields valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]];
        NSUInteger maxLength=0;
        if(strMaxLength !=nil && ![strMaxLength isEqualToString:@""])
        {
                maxLength=[strMaxLength intValue];
        }
        else
        {
                //this is hardcoded here based on the backend value of 500 max length
                maxLength=400;
        }

  
         //NSLog(@"numericFields-1 field Tag %ld", (long)textField.tag);
        if([numericFields valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]] !=nil)
        {
                     //NSLog(@"numericFields-2 field Tag %ld", (long)textField.tag);
                    NSUInteger newLength = [textField.text length] + [string length] - range.length;
            
            
                    NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
            
                    // allow backspace
                    if (range.length > 0 && [string length] == 0) {
                        return YES;
                    }
            //        // do not allow . at the beggining
            //        if (range.location == 0 && [string isEqualToString:@"."]) {
            //            return NO;
            //        }
                    // set the text field value manually
                    NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
                    newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
            
                    if(newLength > maxLength)
                    {
                        return NO;
                    }
                    textField.text = newValue;
                    // return NO because we're manually setting the value
                    return NO;
        }
        else
        {
                    NSUInteger newLength = [textField.text length] + [string length] - range.length;
                    return newLength <= maxLength;
            
        }

//
//    if (textField.tag == 0) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 50;
//        
//    }
//    
//     //Relationship Number
//    if (textField.tag == 3) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        //        return newLength <= 20;
//        
//        
//        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
//        
//        // allow backspace
//        if (range.length > 0 && [string length] == 0) {
//            return YES;
//        }
////        // do not allow . at the beggining
////        if (range.location == 0 && [string isEqualToString:@"."]) {
////            return NO;
////        }
//        // set the text field value manually
//        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
//        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
//        
//        if(newLength > 20)
//        {
//            return NO;
//        }
//        textField.text = newValue;
//        // return NO because we're manually setting the value
//        return NO;
//        
//    }
//    //--Customer Name
//    if (textField.tag == 4) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 35;
//        
//    }
//    
//    //--Passport No
//    if (textField.tag == 15) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 15;
//        
//    }
//    //--Passport Issue Place
//    if (textField.tag == 16) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//  
//    
//    //--Emirates id
//    if (textField.tag == 20) {
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

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)string
{

        //Prevent crashing undo bug – see note below.
        if(range.length + range.location > textView.text.length)
        {
            return NO;
        }


        //----To get max length allowed to enter data
        NSString *strMaxLength = [maxLengthFields valueForKey:[NSString stringWithFormat:@"%ld",(long)textView.tag]];
        NSUInteger maxLength=0;
        if(strMaxLength !=nil && ![strMaxLength isEqualToString:@""])
        {
                maxLength=[strMaxLength intValue];
        }
        else
        {
                //this is hardcoded here based on the backend value of 500 max length
                maxLength=1500;
        }

  
        NSUInteger newLength = [textView.text length] + [string length] - range.length;
        return newLength <= maxLength;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if([dateFields valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]] !=nil)
    {
        [self popoverDate:textField :@"":NULL];
        popoverTag=textField.tag;
        return YES;
    }
    
    
    if([listTableName valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]] !=nil)
    {
        
         //NSLog(@"List table name %@", [listTableName valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]]);
        
        [self popoverData:textField:[listTableName valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]]:@"N"];
        return NO;
    }
    if([multiListTableName valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]] !=nil)
    {
        
        //NSLog(@"Multi List table name %@", [multiListTableName valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]]);
        
        [self popoverData:textField:[multiListTableName valueForKey:[NSString stringWithFormat:@"%ld",(long)textField.tag]]:@"Y"];
        return NO;
    }

    else
        return YES;
    
}




-(void) popoverDate: (UITextField *)sender :(NSString *)dateRange :(NSString *)dateFormat
{
//    [self popoverData:sender :NULL:@"Y":dateRange:dateFormat:@"N"];
    
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateTextField) forControlEvents:UIControlEventValueChanged];
    [sender setInputView:datePicker];
    
    datePicker.datePickerMode=UIDatePickerModeDate;
    
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor lightBlueColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [sender setInputAccessoryView:toolBar];
    
    NSLog(@"dateField datepicker");
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *) multiSelect
{
    [self popoverData:sender :tableName:@"N":NULL:NULL:multiSelect];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *)dateField :(NSString *)dateRange :(NSString *)dateFormat :(NSString *)multiSelect
{
    @try
    {
        
        NSLog(@"dateField %@",dateField);
    
        PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
        popoverViewController.multiSelect=multiSelect;
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
        presentationController.sourceView = sender;
        //NSLog(@"x %f and y %f %@",sender.frame.origin.x,sender.frame.origin.y,sender.class);
        presentationController.sourceRect = sender.bounds; //CGRectMake(0, sender.frame.origin.y, 1, 1);
       

        
        
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


-(void)updateTextField
{

  UITextField *textField = (UITextField *)[self.view viewWithTag:popoverTag];
  //UIDatePicker *picker = (UIDatePicker*) textField.inputView;
  NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
  [formatter setDateFormat:@"dd/MM/YYYY"];
  textField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];

  
}


-(void)ShowSelectedDate
{
    UITextField *textField = (UITextField *)[self.view viewWithTag:popoverTag];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/YYYY"];
    textField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    [textField resignFirstResponder];
}

//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//  
//    [self animateTextField: textField up: YES];
//    
// 
//    
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//
//    [self animateTextField: textField up: NO];
//
//    //Store Survey Data
//    
//    [surveyDataDictionary setObject:removeSpecialCharacters(textField.text) forKey:[NSString stringWithFormat:@"%ld", (long)textField.tag]];
//    
//}
//
//- (void) animateTextField: (UITextField*) textField up: (BOOL) up
//{
//    const int movementDistance = textField.frame.origin.y / 2;//80; // tweak as needed
//    const float movementDuration = 0.3f; // tweak as needed
//    
//    int movement = (up ? -movementDistance : movementDistance);
//    
//    [UIView beginAnimations: @"anim" context: nil];
//    [UIView setAnimationBeginsFromCurrentState: YES];
//    [UIView setAnimationDuration: movementDuration];
//    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
//    [UIView commitAnimations];
//}

- (void)textViewDidEndEditing:(UITextView *)textView
{

    //Store Survey Data
    [surveyDataDictionary setObject:removeSpecialCharacters(textView.text) forKey:[NSString stringWithFormat:@"%ld", (long)textView.tag]];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
     if(tableView==tableViewPage1)
     {
        return [resultsEventTemplatePage1 count];
     
     }
     else if(tableView==tableViewPage2)
     {
        return [resultsEventTemplatePage2 count];
     
     }
     else if(tableView==tableViewPage3)
     {
        return [resultsEventTemplatePage3 count];
     
     }
     else return 0;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

         EventTemplateMO *eventTemplateDataMO;
        
         if(tableView==tableViewPage1)
         {
            eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplatePage1[indexPath.section];

         }
         else if(tableView==tableViewPage2)
         {
            eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplatePage2[indexPath.section];
            

         }
         else if(tableView==tableViewPage3)
         {
            eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplatePage3[indexPath.section];
            
         
         }
     
        if([eventTemplateDataMO.component isEqualToString:@"MTEXT"])
        {

            return 100;
        }
        else{
            return 100;
        }
        

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    
    //if(section == 0)
    //{
        
//        return [NSString stringWithFormat:@"     EventID:%@\n     Event Name:%@\n     InstituteID:%@\n     Institute Name:%@",eventID,eventName,instituteID,instituteName ];
        
    //}
//    else if(section == 3)
//    {
//        
//        return @" ID Details";
//        
//    }
//    else if(section == 8)
//    {
//        
//        return @" Passport Details";
//        
//    }
//    else if(section == 15)
//    {
//        
//        return @" ID Details";
//        
//    }
//    else if(section == 25)
//    {
//        
//        return @" Bank Use Only";
//        
//    }
    //else
        
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
    return 0.0f;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.layer.borderColor=[UIColor borderColor].CGColor;
    //cell.layer.shadowRadius=3.0f;
    //cell.layer.shadowOffset = CGSizeMake(0, 3);
    //cell.layer.shadowColor = [UIColor blackColor].CGColor;
    //cell.layer.shadowOpacity = 0.8;
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:18.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
    cell.textLabel.font  = myFont;
    //cell.textLabel.textColor=[UIColor blueColor];
    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:18.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
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
    
    
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    @try
    {

        static NSString *MyIdentifier = @"MyReuseIdentifier";
        UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:MyIdentifier];

        EventTemplateMO *eventTemplateDataMO;
        
         if(tableView1==tableViewPage1)
         {
            eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplatePage1[indexPath.section];
         
         }
         if(tableView1==tableViewPage2)
         {
            eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplatePage2[indexPath.section];
         
         }
         if(tableView1==tableViewPage3)
         {
            eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplatePage3[indexPath.section];
         
         }
        
        CommonLabel *lblLableName;
        UIFont *lblFont;
        UITextView *textView;
        UIFont *compFont;


        //------Capture FieldNames----
        [fieldNames setObject:emptyStringIfNil(eventTemplateDataMO.fieldName) forKey:eventTemplateDataMO.seqNo];


        //-------Max Length of Fields
        [maxLengthFields setObject:emptyStringIfNil(eventTemplateDataMO.maxLength) forKey:eventTemplateDataMO.seqNo];
        
        
        //-----Capture inactive fields---
        if(![eventTemplateDataMO.status isEqualToString:@"ACTIVE"])
        {
            [inActiveFields setObject:emptyStringIfNil(eventTemplateDataMO.fieldName) forKey:eventTemplateDataMO.seqNo];
        }


        if (cell == nil) {
                cell = [[UITableViewCell alloc] init] ;//]WithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
                //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                cell.accessoryType = UITableViewCellAccessoryNone;
                //cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
                NSLog(@"CellNil %ld %@ %@ %@", (long)indexPath.section, eventTemplateDataMO.seqNo, eventTemplateDataMO.labelName, eventTemplateDataMO.mandatory);
        
                lblLableName=[[CommonLabel alloc]initWithFrame:CGRectZero];
                lblFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
                lblLableName.font=lblFont;
                lblLableName.numberOfLines=20;
                lblLableName.lineBreakMode=NSLineBreakByWordWrapping;
                lblLableName.translatesAutoresizingMaskIntoConstraints=NO;
                [cell.contentView addSubview:lblLableName];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLableName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLableName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLableName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
                
                [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLableName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
                
                if([eventTemplateDataMO.component isEqualToString:@"TEXT"] || [eventTemplateDataMO.component isEqualToString:@"DATE"] || [eventTemplateDataMO.component isEqualToString:@"LIST"] || [eventTemplateDataMO.component isEqualToString:@"MLIST"] || [eventTemplateDataMO.component isEqualToString:@"NTEXT"])
                {
                    
                    txtComponent = [[CommonTextField alloc] init];
                    txtComponent.tag=[eventTemplateDataMO.seqNo integerValue];
                    txtComponent.delegate=self;
                    txtComponent.placeholder=eventTemplateDataMO.labelName;
                    compFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
                    txtComponent.font=compFont;
                    txtComponent.translatesAutoresizingMaskIntoConstraints=NO;
                    [cell.contentView addSubview:txtComponent];
                    
                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtComponent attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
                    
                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtComponent attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
                    
                    
                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtComponent attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
                    
                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtComponent attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
                    

                    //Disable the field
                    if(![eventTemplateDataMO.status isEqualToString:@"ACTIVE"])
                    {
                        txtComponent.enabled=NO;
                    }
                    
                    txtComponent.text=[surveyDataDictionary valueForKey:eventTemplateDataMO.seqNo];
                    
                }

                if([eventTemplateDataMO.component isEqualToString:@"CHECKBOX"])
                {
                    swtComponent = [[UISwitch alloc] init];
                    swtComponent.tag=[eventTemplateDataMO.seqNo integerValue];
                    [swtComponent addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
                    swtComponent.translatesAutoresizingMaskIntoConstraints=NO;
                    [cell.contentView addSubview:swtComponent];

                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:swtComponent attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];

                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:swtComponent attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];


                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:swtComponent attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];

                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:swtComponent attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
                    

                    //Disable the field
                    if(![eventTemplateDataMO.status isEqualToString:@"ACTIVE"])
                    {
                        swtComponent.enabled=NO;
                    }

                    [self operateSwitch:swtComponent :[surveyDataDictionary valueForKey:eventTemplateDataMO.seqNo]];

                }
                
                if([eventTemplateDataMO.component isEqualToString:@"MTEXT"])
                {
                    //NSLog(@"MTEXT component %@",eventTemplateDataMO.component);
                    
                    textView = [[UITextView alloc] init];
                    textView.layer.borderWidth=0.1;
                    //self.txtCustomerName.layer.borderColor=[UIColor blackColor].CGColor;
                    textView.layer.cornerRadius=5.0;
                    [textView setFont:[UIFont systemFontOfSize:14]];
                    //[self setPlaceholder: @"Customer Name"];
                    [textView setTextColor:[UIColor blackColor]];
                    [textView setTextAlignment:NSTextAlignmentLeft];
                    [textView setAutocorrectionType:UITextAutocorrectionTypeDefault];
                    [textView setKeyboardType:UIKeyboardTypeDefault];
                    [textView setReturnKeyType:UIReturnKeyDone];
                    textView.tag=[eventTemplateDataMO.seqNo integerValue];
                    textView.delegate=self;
                    //textView.placeholder=eventTemplateDataMO.labelName;

                    compFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
                    textView.font=compFont;
                    
                    textView.translatesAutoresizingMaskIntoConstraints=NO;
                    [cell.contentView addSubview:textView];
                    
                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
                    
                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
                    
                    
                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
                    
                    [cell addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
                

                    //Disable the field
                    if(![eventTemplateDataMO.status isEqualToString:@"ACTIVE"])
                    {
                        textView.editable=NO;
                    }
                    
                    textView.text=[surveyDataDictionary valueForKey:eventTemplateDataMO.seqNo];

                }

                if([eventTemplateDataMO.mandatory isEqualToString:@"Y"])
                {
                    lblLableName.text=[NSString stringWithFormat:@"*%@. %@",eventTemplateDataMO.viewOrder, eventTemplateDataMO.labelName];
                    [mandatoryFields setObject:emptyStringIfNil(eventTemplateDataMO.fieldName) forKey:eventTemplateDataMO.seqNo];
                    
                    if([lblLableName.text length]>0)
                    {
                        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: lblLableName.attributedText];
                        [text addAttribute:NSForegroundColorAttributeName
                             value:[UIColor redColor] 
                             range:NSMakeRange(0, 1)];
                        [lblLableName setAttributedText: text];
                    }

                }
                else
                {
                    lblLableName.text=[NSString stringWithFormat:@"%@. %@",eventTemplateDataMO.viewOrder, eventTemplateDataMO.labelName];
                
                }
                if([eventTemplateDataMO.component isEqualToString:@"NTEXT"])
                {
                    
                    [numericFields setObject:emptyStringIfNil(eventTemplateDataMO.fieldName) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtComponent.tag]];
                    
                    
                }
                if([eventTemplateDataMO.component isEqualToString:@"DATE"])
                {
                    
                     [dateFields setObject:emptyStringIfNil(eventTemplateDataMO.fieldName) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtComponent.tag]];
                    
                    
                }
                if([eventTemplateDataMO.component isEqualToString:@"LIST"])
                {
                    
                    
                    
                    [listTableName setObject:emptyStringIfNil(eventTemplateDataMO.listTableName) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtComponent.tag]];
                    
                }
                if([eventTemplateDataMO.component isEqualToString:@"MLIST"])
                {
                    
                    
                    
                     [multiListTableName setObject:emptyStringIfNil(eventTemplateDataMO.listTableName) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtComponent.tag]];
                    
                    
                }
            
            
                //NSLog(@"CellForRow Compoent %@ %@ %@",eventTemplateDataMO.seqNo,  eventTemplateDataMO.component, eventTemplateDataMO.labelName);


            
        }
//        else{
//            
//
//                NSLog(@"CellNotNil %ld %@ %@ %@", indexPath.section, eventTemplateDataMO.seqNo, eventTemplateDataMO.labelName, eventTemplateDataMO.fieldName);
//            
//                if([eventTemplateDataMO.component isEqualToString:@"TEXT"] || [eventTemplateDataMO.component isEqualToString:@"DATE"] || [eventTemplateDataMO.component isEqualToString:@"LIST"] || [eventTemplateDataMO.component isEqualToString:@"MLIST"] || [eventTemplateDataMO.component isEqualToString:@"NTEXT"])
//                {
//                    NSLog(@"CellNotNil %@",eventTemplateDataMO.fieldName);
//                    txtComponent.text=(CommonTextField *)[cell.contentView viewWithTag:(long)[surveyDataDictionary valueForKey:eventTemplateDataMO.seqNo]];
//                    
//                    
//                }
//                if([eventTemplateDataMO.component isEqualToString:@"CHECKBOX"])
//                {
//                
//                    swtComponent=(UISwitch *)[cell.contentView viewWithTag:(long)[surveyDataDictionary valueForKey:eventTemplateDataMO.seqNo]];
//                }
//                if([eventTemplateDataMO.component isEqualToString:@"MTEXT"])
//                {
//
//                    textView.text=(UITextView *)[cell.contentView viewWithTag:(long)[surveyDataDictionary valueForKey:eventTemplateDataMO.seqNo]];
//                
//                }
//            
//        }

    
    
    
        return cell;
    

    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in cellForRowAtIndexPath %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in cellForRowAtIndexPath");
    }
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
    
//    NSUInteger row = indexPath.section;//row;
//    
//    
//    
//    if (row != NSNotFound)
//    {
//        personalData = [personalArray objectAtIndex:indexPath.section];
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
//    
//    
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
    
}


- (void) doValidate {
    
    
    
    //------validation starts---------
    
//    if([switchFlag isEqualToString:@"Y"])
//    {
//        
//        
//        if([CommonUtils checkEmptyString:txtExtRelation.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Select Existing Relationship Type":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//        if([CommonUtils checkEmptyString:txtExtRelationNo.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Enter Existing Relationship No":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//       
//        
//    }
    
//    if([CommonUtils checkEmptyString:txtCustomerName.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Customer Name can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
    

    
//    if([CommonUtils checkEmptyString:txtFirstName.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"First Name can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtTitle.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Title can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtCategoryType.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Category Type can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtBranch.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Branch can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtJointOwn.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Joint Own can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtGender.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Gender can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }

//    if([CommonUtils checkEmptyString:txtNatureOfRelation.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Nature Of Relation  can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtResidenceStatus.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Residence Status can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtNationality.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Nationality can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtDateOfBirth.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Date Of Birth can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtEducation.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Education can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtMaritalStatus.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Marital Status can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    
//    if([CommonUtils checkEmptyString:txtPassportNo.text]==YES)
//    {
//
//        [CommonUtils showMessage:@"Passport Number can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//
//        return;
//
//    }
//
//    if([CommonUtils checkEmptyString:txtPassportIssuePlace.text]==YES)
//    {
//
//        [CommonUtils showMessage:@"Passport Issue Place can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//
//        return;
//
//    }
//    if([CommonUtils checkEmptyString:txtPassportIssueDate.text]==YES)
//    {
//
//        [CommonUtils showMessage:@"Passport Issue Date can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//
//        return;
//
//    }
//    if([CommonUtils checkEmptyString:txtPassportExpDate.text]==YES)
//    {
//
//        [CommonUtils showMessage:@"Passport Expiry Date can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//
//        return;
//
//    }
//    if([CommonUtils checkEmptyString:txtPassportIssueCountry.text]==YES)
//    {
//
//        [CommonUtils showMessage:@"Passport Issue Country can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtEmiratesId.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Emirates Id can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtEmiratesIdExpDate.text]==YES)
//    {
//
//        [CommonUtils showMessage:@"Emirates Id Expiry Date can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//
//        return;
//
//    }

    
   //    if([CommonUtils checkEmptyString:txtPreferredLang.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Preferred Language can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtFamilyUAE.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Family in UAE can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtFamilySize.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@" Family Size can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtCarOwnership.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@" Car Ownership can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    //--Having car than only allow Car Year
//    if([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCarOwnership.tag]] isEqualToString:@"YES01"] &&   [CommonUtils checkEmptyString:txtCarYear.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@" Car Year can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtMedia.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@" Media can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtFavCity.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Favourite City can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
    
//    if([actionMode isEqualToString:@"FETCH"])
//    {
//        actionMode=@"UPDATE";
//    }
//    
    
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    
    //[self buildJSON];
    
    
      [self buildMO];

                                               
                                               
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}

//
//- (void) buildJSON {
//    
//    
//    NSDictionary *jsonDictionary;
//    //NSData *newData;
//    //NSString *cifNumber;
//    //NSString *accountNumber;
//    //NSString *creditCardNumber;
//    
//
//    
//   
//    
//     NSLog(@"action mode in personal %@",actionMode);
//    
//    //------To Check User Account Relations
//    
////    if ([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtExtRelation.tag]] isEqualToString:@"CIF01"]) {
////        
////        cifNumber=self.txtExtRelationNo.text;
////        accountNumber=@"";
////        creditCardNumber=@"";
////        
////    }
////    else if ([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtExtRelation.tag]] isEqualToString:@"ACC02"]) {
////        
////        cifNumber=@"";
////        accountNumber=self.txtExtRelationNo.text;
////        creditCardNumber=@"";
////        
////    }
////    else if ([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtExtRelation.tag]] isEqualToString:@"CCN03"]) {
////        
////        cifNumber=@"";
////        accountNumber=@"";
////        creditCardNumber=self.txtExtRelationNo.text;
////        
////    }
//    //--
//    
//    //--Erases car year when CarOwnership is NO
////    if ([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCarOwnership.tag]] isEqualToString:@"NO002"]) {
////        
////        self.txtCarYear.text=@"";
////    }
//    
//
//    
//     //recordStatus=@"INPROGRESS";
//    
//    
//    @try{
//        
//        
////            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
////            {
////                jsonDictionary= @{@"refNo":self.refNo};
////            }
////            else
////            {
//        
//                NSLog(@"RefNo %@",self.refNo);
//               
//                
//               
//                //-------
//                
////                jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo),
////                                  @"accountType":emptyStringIfNil(self.accountType),
////                                  @"extCustomerFlag":emptyStringIfNil(switchFlag),
////                                  @"extRelationship":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtExtRelation.tag]]),
////                                  @"cifNumber":emptyStringIfNil(cifNumber),
////                                  @"extAccountNo":emptyStringIfNil(accountNumber),
////                                  @"extCreditCardNo":emptyStringIfNil(creditCardNumber),
////                                  @"relationshipNo":emptyStringIfNil(self.txtExtRelationNo.text),
////                                  @"customerName":emptyStringIfNil(self.txtCustomerName.text),
////                                  @"firstName":emptyStringIfNil(self.txtFirstName.text),
////                                  @"middleName":emptyStringIfNil(self.txtMiddleName.text),
////                                  @"lastName":emptyStringIfNil(self.txtLastName.text),
////                                  @"title":[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtTitle.tag]],
////                                  @"categoryType":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCategoryType.tag]]),
////                                  @"branch":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtBranch.tag]]),
////                                  @"jointOwn":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtJointOwn.tag]]),
////                                  @"natureOfRelation":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtNatureOfRelation.tag]]),
////                                  @"residenceStatus":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtResidenceStatus.tag]]),
////                                  @"nationality":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtNationality.tag]]),
////                                  @"dob":emptyStringIfNil(self.txtDateOfBirth.text),
////                                  @"educated":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtEducation.tag]]),
////                                  @"maritalStatus":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtMaritalStatus.tag]]),
////                                  @"gender":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtGender.tag]]),
////                                  @"passportNo":emptyStringIfNil(self.txtPassportNo.text),
////                                  @"passportIssueDate":emptyStringIfNil(self.txtPassportIssueDate.text),
////                                  @"passportExpDate":emptyStringIfNil(self.txtPassportExpDate.text),
////                                  @"passportIssuePlace":emptyStringIfNil(self.txtPassportIssuePlace.text),
////                                  @"passportIssueCountry":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPassportIssueCountry.tag]]),
////                                  @"emiratesID":emptyStringIfNil(self.txtEmiratesId.text),
////                                  @"emiratesIDExpDate":emptyStringIfNil(self.txtEmiratesIdExpDate.text),
////                                  @"recordStatus":emptyStringIfNil(self.recordStatus)
////                                  
////                                  };
//        
////        @"motherMaidenName":emptyStringIfNil(self.txtMotherMaidenName.text),
////        @"segment":emptyStringIfNil(self.txtSegment.text),
////        @"preferredLanguage":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPreferredLang.tag]]),
////        @"familyInUAE":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFamilyUAE.tag]]),
////        @"familySizeUAE":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFamilySize.tag]]),
////        @"carOwnership":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCarOwnership.tag]]),
////        @"carYear":([self.txtCarYear.text length]==0?@"":self.txtCarYear.text),
////        @"media":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtMedia.tag]]),
////        @"favouriteCity":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFavCity.tag]]),
////        @"domicile":emptyStringIfNil(self.txtDomicile.text),
//        
//
//        
//            //}
//        
//        
//            //        for (int i=0; i<=[componentsArray count]-1; i++) {
//            //
//            //            if([[componentsArray objectAtIndex:i] isKindOfClass:[UITextField class]])
//            //            {
//            //
//            //                [jsonDictionary initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>
//            //
//            //
//            //            }
//            //        }
//            
//            
//            
//            
//            //NSString *jsonString = [container JSONRepresentation];
//            NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
//            
////            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
////            {
////                
////                newData=[CommonUtils connectHost :@"fetchPersonalDetails" :jsonDictionary:self];
////                [self parseResponse:newData:@"fetchPersonalDetails":@"personalDetailsWrapper"];
////                
////            }
//            if([actionMode isEqualToString:@"NEW"])// && [viewMode isEqualToString:@"N"])
//            {
//                
//                //newData=[CommonUtils connectHost :@"insertPersonalDetails" :jsonDictionary:self];
//                //[self parseResponse:newData:@"insertPersonalDetails":@"personalDetailsWrapper"];
//                
//                
//                
//                //viewMode=@"N";
//            }
//            if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
//            {
//                
//                //newData=[CommonUtils connectHost :@"updatePersonalDetails" :jsonDictionary:self];
//                //[self parseResponse:newData:@"updatePersonalDetails":@"personalDetailsWrapper"];
//                
//                //viewMode=@"Y";
//            }
//        
//        
//        
//        
//            //------Business Error Validation
//        
//            if([errorArray count]>0)
//            {
//                NSString *errorString=@"";
//                
//                for (int i=0; i<=errorArray.count-1; i++)
//                {
//                    
//                    errorData = [errorArray objectAtIndex:i];
//                    
//                    
//                    NSString *errString=[NSString stringWithFormat:@"%@ - %@\n",errorData.errorCode,errorData.errorDesc];
//                    
//                    
//                    errorString =[errorString stringByAppendingString:errString];
//         
//                }
//                
//                [CommonUtils showMessage:errorString :self];
//                
//                return;
//            }
//        
//        
//            //--------------
//        
//            self.refNo=personalData.refNo;
// 
//               NSLog(@"RefNo %@",self.refNo);
//        
//                //NSLog(@"ViewMode %@",self.viewMode);
//               
//               //---invoke next screen---
//               //if([viewMode isEqualToString:@"N"])
//               //{
//                   NSLog(@"To invoke next screen");
//                   
////                   if([actionMode isEqualToString:@"NEW"])
////                   {
////                       viewMode=@"N";
////                   }
////                   if([actionMode isEqualToString:@"UPDATE"])
////                   {
////                       viewMode=@"Y";
////                   }
//        
////                   IdentificationViewController *identificationViewController = [[IdentificationViewController alloc]initWithNibName:nil bundle:nil];
////                   identificationViewController.actionMode=self.actionMode;
////                   identificationViewController.recordStatus=self.recordStatus;
////                   //identificationViewController.viewMode=self.viewMode;
////                   identificationViewController.refNo=self.refNo;
////                   identificationViewController.accountType=self.accountType;
////                   identificationViewController.menuName=self.menuName;
////                   identificationViewController.existingRefNo=existingRefNo;
////                    NSLog(@"To invoke next screen existingRefNo %@ ",identificationViewController.existingRefNo);
////
////                    identificationViewController.existingCustomerFlag=existingCustomerFlag;
////                    NSLog(@"To invoke next screen existingCustomerFlag %@ ",identificationViewController.existingCustomerFlag);
////
////        
////                   [self.navigationController pushViewController:identificationViewController animated:YES];
//               //}
//        
//
//        
//               //----------
//        }
//
//        @catch (NSException *exception) {
//                   
//            NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
//            [CommonUtils showMessage:[exception reason] :self];
//            
//            
//        }
//        @finally {
//                   
//            NSLog(@"finally in buildJSON Code");
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        }
//        
//}
//
//
//

//- (void) viewData {
//
//    @try{
//        
//        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
//    
//    //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//    //{
//    //    NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
//    //}
// 
//    //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//    //{
//        
//        //NSData *newData=[CommonUtils connectHost :@"fetchPersonalDetails" :jsonDictionary:self];
//        //[self parseResponse:newData:@"fetchPersonalDetails":@"personalDetailsWrapper"];
//  
//        
//    //}
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    
//    }
//
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//        
//        
//    }
//    @finally {
//        
//        NSLog(@"finally in Personal viewData Code");
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    }
//
//}
//




//- (void) doValidateExistingCustomer {
//    
//    
//    
//    //------validation starts---------
//    
//    if([switchFlag isEqualToString:@"Y"])
//    {
//        
//        
//        if([CommonUtils checkEmptyString:txtExtRelation.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Select Existing Relationship Type":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//        if([CommonUtils checkEmptyString:txtExtRelationNo.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Enter Existing Relationship No":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//        
//        if([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//        {
//            
//           // [self viewExistingCustomerData];
//            
//
//            
//      
//            
//        }
//        
//    }
//    
//  
//}



//- (void) viewExistingCustomerData {
//    
//    @try{
//        
//        
//        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
//        
//        
//        
//       // NSDictionary *jsonDictionary= @{@"cifNumber":emptyStringIfNil(self.txtExtRelationNo.text),
//       //                                 @"extAccountNo":emptyStringIfNil(self.txtExtRelationNo.text),
//       //                                 @"extCreditCardNo":emptyStringIfNil(self.txtExtRelationNo.text)};
//        
//       
//        
//        //NSData *newData=[CommonUtils connectHost :@"fetchExistingCustomer" :jsonDictionary:self];
//        //[self parseResponse:newData:@"fetchExistingCustomer":@"personalDetailsWrapper"];
//        
//        personalData = [personalArray objectAtIndex:0];
//        existingRefNo=personalData.existingRefNo;
//        
//        if (existingRefNo !=NULL) {
//            
//        
//        UIAlertController *alertController=[UIAlertController
//                                            alertControllerWithTitle:@"Confirmation"
//                                            message:[NSString stringWithFormat:@"Do you want to load existing data for %@ ?",existingRefNo]
//                                            preferredStyle:UIAlertControllerStyleAlert];
//        
//        
//        
//        UIAlertAction* okAction = [UIAlertAction
//                                   actionWithTitle:@"Proceed"
//                                   style:UIAlertActionStyleDefault
//                                   handler:^(UIAlertAction * action)
//                                   {
//                                       
//              
//                                       
//                                       //[self loadData];
//                                       
//                 
//                                       
//                                   }];
//        
//        
//        UIAlertAction* cancelAction = [UIAlertAction
//                                       actionWithTitle:@"Cancel"
//                                       style:UIAlertActionStyleDefault
//                                       handler:^(UIAlertAction * action)
//                                       {
//                                           //[alert dismissViewControllerAnimated:YES completion:nil];
//                                       }];
//        
//        [alertController addAction:okAction];
//        [alertController addAction:cancelAction];
//        
//        [self presentViewController:alertController animated:YES completion:nil];
//        
//        }
//        else
//        {
//            [CommonUtils showMessage:@"Records Not Found" :self];
//        }
//
//        
//        
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//    }
//    
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in view Existing Customer viewData code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//        
//        
//    }
//    @finally {
//        
//        NSLog(@"finally in view Existing Customer viewData Code");
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    }
//    
//}

//-(void) loadData {
//    
//    
//    @try{
//        
//        
//        
//            
//            
//                
//                personalData = [personalArray objectAtIndex:0];
//                switchFlag=emptyStringIfNil(personalData.extCustomerFlag);
//                NSLog(@"switchflag %@",switchFlag);
//                [self operateSwitch:switchFlag];
//                txtRefNo.text=emptyStringIfNil(personalData.refNo);
//                txtExtRelation.text=emptyStringIfNil(personalData.extRelationshipValue);
//                txtExtRelationNo.text=emptyStringIfNil(personalData.relationshipNo);
//                txtCustomerName.text=emptyStringIfNil(personalData.customerName);
//                txtFirstName.text=emptyStringIfNil(personalData.firstName);
//                txtMiddleName.text=emptyStringIfNil(personalData.middleName);
//                txtLastName.text=emptyStringIfNil(personalData.lastName);
//
//                txtTitle.text=emptyStringIfNil(personalData.titleValue);
//                txtCategoryType.text=emptyStringIfNil(personalData.categoryTypeValue);
//                txtBranch.text=emptyStringIfNil(personalData.branchValue);
//                txtJointOwn.text=emptyStringIfNil(personalData.jointOwnValue);
//                txtNatureOfRelation.text=emptyStringIfNil(personalData.natureOfRelationValue);
//                txtResidenceStatus.text=emptyStringIfNil(personalData.residenceStatusValue);
//                txtNationality.text=emptyStringIfNil(personalData.nationalityValue);
//                txtDateOfBirth.text=emptyStringIfNil(personalData.dob);
//                txtEducation.text=emptyStringIfNil(personalData.educatedValue);
//                txtMaritalStatus.text=emptyStringIfNil(personalData.maritalStatusValue);
//                txtGender.text=emptyStringIfNil(personalData.genderValue);
//                    
//            //        
//            //    txtPreferredLang.text=emptyStringIfNil(personalData.preferredLanguageValue);
//            //    txtFamilyUAE.text=emptyStringIfNil(personalData.familyInUAEValue);
//            //    txtFamilySize.text=emptyStringIfNil(personalData.familySizeUAEValue);
//            //    txtCarOwnership.text=emptyStringIfNil(personalData.carOwnershipValue);
//            //    txtCarYear.text=emptyStringIfNil(personalData.carYear);
//            //    txtMedia.text=emptyStringIfNil(personalData.mediaValue);
//            //    txtFavCity.text=emptyStringIfNil(personalData.favouriteCityValue);
//            //    txtDomicile.text=emptyStringIfNil(personalData.domicile);
//                    
//            //    txtMotherMaidenName.text=emptyStringIfNil(personalData.motherMaidenName);
//            //    txtSegment.text=emptyStringIfNil(personalData.segment);
//
//                    
//                txtPassportNo.text=emptyStringIfNil(personalData.passportNo);
//                txtPassportIssueDate.text=emptyStringIfNil(personalData.passportIssueDate);
//                txtPassportExpDate.text=emptyStringIfNil(personalData.passportExpDate);
//                txtPassportIssuePlace.text=emptyStringIfNil(personalData.passportIssuePlace);
//                txtPassportIssueCountry.text=emptyStringIfNil(personalData.passportIssueCountryValue);
//                txtEmiratesId.text=emptyStringIfNil(personalData.emiratesID);
//                txtEmiratesIdExpDate.text=emptyStringIfNil(personalData.emiratesIDExpDate);
//                
//             
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.passportIssueCountry) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtPassportIssueCountry.tag]];
//                    
//                
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.extRelationship) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtExtRelation.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.title) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtTitle.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.categoryType) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtCategoryType.tag]];
//                
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.branch) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtBranch.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.jointOwn) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtJointOwn.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.natureOfRelation) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtNatureOfRelation.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.residenceStatus) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtResidenceStatus.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.nationality) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtNationality.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.educated) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtEducation.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.maritalStatus) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtMaritalStatus.tag]];
//                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.gender) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtGender.tag]];
//                    
//                    
//                    
//            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.preferredLanguage) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtPreferredLang.tag]];
//            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.familyInUAE) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFamilyUAE.tag]];
//            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.familySizeUAE) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFamilySize.tag]];
//            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.carOwnership) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtCarOwnership.tag]];
//            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.media) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtMedia.tag]];
//            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.favouriteCity) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFavCity.tag]];
//                
//                
//                   
//                
//                
//                NSLog(@"cell data loaded ");
//        
//    }
//    
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in Load Data code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//        
//        
//    }
//    @finally {
//        
//        NSLog(@"finally in Load Data Code");
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    }
//
//    
//    
//}

//- (void) viewPathStatus {
//    
//    @try{
//        
//            [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
//        
//        
//            //when empty first time
//            if([self.refNo isEqualToString:@""] || [self.refNo length]<=0)
//            {
//                self.refNo=@"0";
//            }
//        
//            //NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
//            
//            //NSData *newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
//            //[self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];
//            
//                
//           
//        
//
//        
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//    }
//    
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//        
//        
//    }
//    @finally {
//        
//        NSLog(@"finally in PathStatus Code");
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    }
//    
//}


//- (void) doReject {
//    
//   
//    @try{
//        
//        
//            UIAlertController *alertController=[UIAlertController
//                                                alertControllerWithTitle:@"Confirmation"
//                                                message:[NSString stringWithFormat:@"Do you want to send this Application %@ back to maker?",self.refNo]
//                                                preferredStyle:UIAlertControllerStyleAlert];
//            
//            
//            
//            UIAlertAction* okAction = [UIAlertAction
//                                       actionWithTitle:@"Proceed"
//                                       style:UIAlertActionStyleDefault
//                                       handler:^(UIAlertAction * action)
//                                       {
//                                           
//                                           
//                                           
//                                           
//                                           [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
//                                           
//                                           //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//                                           //{
//                                           //NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo),
//                                           //                                @"recordStatus":@"INPROGRESS"
//                                           //                                };
//                                           //}
//                                           
//                                           //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//                                           //{
//                                           
//                                           //NSData *newData=[CommonUtils connectHost :@"updateApplicationStatus" :jsonDictionary:self];
//                                           //[self parseResponse:newData:@"updateApplicationStatus":@"personalDetailsWrapper"];
//                                           
//                                           
//                                           
//                                           
//                                           QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//                                           queueViewController.actionMode=@"UPDATE";
//                                           queueViewController.menuId=@"QUEUEAPPROVER";
//                                           queueViewController.recordStatus=@"CREATE";
//                                           [self.navigationController pushViewController:queueViewController animated:YES];
//                                           
//                                           
//                                           //}
//                                           [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//                                           
//                                           
//                                           
//                                       }];
//            
//            
//            UIAlertAction* cancelAction = [UIAlertAction
//                                           actionWithTitle:@"Cancel"
//                                           style:UIAlertActionStyleDefault
//                                           handler:^(UIAlertAction * action)
//                                           {
//                                               //[alert dismissViewControllerAnimated:YES completion:nil];
//                                           }];
//            
//            [alertController addAction:okAction];
//            [alertController addAction:cancelAction];
//            
//            [self presentViewController:alertController animated:YES completion:nil];
//
//  
//
//        
//    }
//    
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//        
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    }
//    @finally {
//        
//        NSLog(@"finally in doreject Code");
//    }
//    
//}


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
//            
//            return newData;
//            
//            
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
//         [CommonUtils showMessage:[exception reason] :self];
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
//




//- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
//    
//    
//    @try {
//        
//        
//        
//        //NSLog(@"get customer info enterest %@",userid);
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
//            //NSLog(@"userid print :%@",userid);
//            //NSLog(@"sessionid print :%@",sessionid);
//            
//            
//            NSNumber *success = [jsonObject objectForKey:@"success"];
//            if([success boolValue] == YES){
//                
//                
//                
//                //set the customer object of the second view controller
//                //dataDictionary =[jsonObject objectForKey:@"fetchPersonalDetails"];
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
//                personalArray = [[NSMutableArray alloc] init];
//                
//                // Get an array of dictionaries with the key "locations"
//                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
//                NSArray *array = [dataDictionary objectForKey:dataFile];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    personalData = [[PersonalData alloc] initWithJSONDictionary:dict];
//                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
//                    
//                    
//                    
//                    // Add the Location object to the array
//                    [personalArray addObject:personalData];
//                    
//                    
//                }
//                
//                
//                NSLog(@"data count %lu",(unsigned long)personalArray.count);
//                
//                
//                // Create a new array to hold the locations
//                errorArray = [[NSMutableArray alloc] init];
//                
//                // Get an array of dictionaries with the key "locations"
//                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
//                NSArray *subArray = [dataDictionary objectForKey:@"errorWrapper"];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in subArray) {
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    errorData = [[ErrorData alloc] initWithJSONDictionary:dict];
//                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
//                    
//                    
//                    
//                    // Add the Location object to the array
//                    [errorArray addObject:errorData];
//                    
//                    
//                }
//                
//                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
//                //
//                //                for(NSString *key in [customerMasterData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
//                //
//                //                    if ([key isEqualToString:@"Customer number"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
//                //                    }
//                //                    if ([key isEqualToString:@"Customer name"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
//                //                    }
//                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
//                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
//                //                    //}
//                //
//                //                }
//                
//                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"onBoardDataWrapper"];
//                
//                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
//                
//                
//                
//                
//                //                for(NSString *key in [customerDetailData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
//                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
//                //
//                //                }
//                
//                
//                //                accountName = [customerDetailData objectForKey:@"customerName"];
//                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
//                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
//                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
//                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
//                //                onBoardDatatatus= [customerDetailData objectForKey:@"onBoardDatatatus"];
//                
//                
//                //                for(NSString *key in [customerDetailData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
//                //
//                //                    if ([key isEqualToString:@"accountNumber"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
//                //                    }
//                //                    if ([key isEqualToString:@"Customer name"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
//                //                    }
//                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
//                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
//                //                    //}
//                //
//                //                }
//                
//                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
//                //                onBoardDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
//                //                onBoardDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
//                
//                
//                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                
//                //                for (NSString *string in onBoardDataKeyData) {
//                //                    NSLog(@" array key data:%@", string);
//                //                }
//                //
//                //                for (NSString *string in onBoardDataValueData) {
//                //                    NSLog(@" array value data:%@", string);
//                //                }
//                
//                //for (NSDictionary *info in [customerInfo allValues])
//                //{
//                //   [custData addObject:[info valueForKey:@"custName"]];
//                //}
//                
//                //NSArray * values = [dictionary allValues];
//                //NSArray *keys = [dictionary allKeys];
//                //NSArray *values = [dictionary allValues];
//                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
//                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
//                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//                //    [yourArray addObject:obj];
//                //}];
//                
//                
//            }
//            else {
//                NSLog(@"Success is invalid...");
//                
//                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
//                
//                
//            }
//            
//        }
//        else{
//            
//            [CommonUtils showError:error:self:@"parseResponse"];
//            
//            
//            
//        }
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
//         [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in parseResponse Code");
//    }
//    
//}

//- (void) parseResponsePath:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
//    
//    
//    @try {
//        
//        
//        
//        //NSLog(@"get customer info enterest %@",userid);
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
//            //NSLog(@"userid print :%@",userid);
//            //NSLog(@"sessionid print :%@",sessionid);
//            
//            
//            NSNumber *success = [jsonObject objectForKey:@"success"];
//            if([success boolValue] == YES){
//                
//                
//                
//                //set the customer object of the second view controller
//                //dataDictionary =[jsonObject objectForKey:@"fetchPersonalDetails"];
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
//                pathArray = [[NSMutableArray alloc] init];
//                
//                // Get an array of dictionaries with the key "locations"
//                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
//                NSArray *array = [dataDictionary objectForKey:dataFile];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    pathData = [[PathData alloc] initWithJSONDictionary:dict];
//                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
//                    
//                    // Add the Location object to the array
//                    [pathArray addObject:pathData];
//                }
//                
//                
//                NSLog(@"data count %lu",(unsigned long)pathArray.count);
//                
//                
//                
//                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
//                //
//                //                for(NSString *key in [customerMasterData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
//                //
//                //                    if ([key isEqualToString:@"Customer number"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
//                //                    }
//                //                    if ([key isEqualToString:@"Customer name"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
//                //                    }
//                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
//                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
//                //                    //}
//                //
//                //                }
//                
//                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"onBoardDataWrapper"];
//                
//                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
//                
//                
//                
//                
//                //                for(NSString *key in [customerDetailData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
//                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
//                //
//                //                }
//                
//                
//                //                accountName = [customerDetailData objectForKey:@"customerName"];
//                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
//                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
//                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
//                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
//                //                onBoardDatatatus= [customerDetailData objectForKey:@"onBoardDatatatus"];
//                
//                
//                //                for(NSString *key in [customerDetailData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
//                //
//                //                    if ([key isEqualToString:@"accountNumber"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
//                //                    }
//                //                    if ([key isEqualToString:@"Customer name"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
//                //                    }
//                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
//                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
//                //                    //}
//                //
//                //                }
//                
//                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
//                //                onBoardDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
//                //                onBoardDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
//                
//                
//                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                
//                //                for (NSString *string in onBoardDataKeyData) {
//                //                    NSLog(@" array key data:%@", string);
//                //                }
//                //
//                //                for (NSString *string in onBoardDataValueData) {
//                //                    NSLog(@" array value data:%@", string);
//                //                }
//                
//                //for (NSDictionary *info in [customerInfo allValues])
//                //{
//                //   [custData addObject:[info valueForKey:@"custName"]];
//                //}
//                
//                //NSArray * values = [dictionary allValues];
//                //NSArray *keys = [dictionary allKeys];
//                //NSArray *values = [dictionary allValues];
//                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
//                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
//                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//                //    [yourArray addObject:obj];
//                //}];
//                
//                
//            }
//            else {
//                NSLog(@"Success is invalid...");
//                
//                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
//                
//                
//            }
//            
//        }
//        else{
//            
//            [CommonUtils showError:error:self:@"parseResponse"];
//            
//            
//            
//        }
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in parseResponse Code");
//    }
//    
//}


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
//    //    UILabel *lblEventName  = [[UILabel alloc] initWithFrame:labelFrame];
//    //    lblEventName.textColor = [UIColor blackColor];
//    //    lblEventName.text = [NSString stringWithFormat:@"Available Balance    %@",availableBalance];
//    //    //set the number of lines to 0, meaning use as many lines as needed
//    //    lblEventName.numberOfLines = 0;
//    //    //lblEventName.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
//    //    lblEventName.font = [UIFont boldSystemFontOfSize:12.0f];
//    //    lblEventName.textAlignment =  NSTextAlignmentLeft;
//    //    //lblEventName.layer.borderColor = [UIColor blackColor].CGColor;
//    //    //lblEventName.layer.borderWidth = 1.0;
//    //    //Resizes and moves the receiver view so it just encloses its subviews.
//    //    //watch the border of the frame in this example
//    //    //[lblEventName sizeToFit];
//    //    [self.view addSubview:lblEventName];
//
//}
//
//



- (void)addItemViewController:(PopoverViewController *)controller didFinishEnteringItem:(NSString *)item  didFinishEnteringItem1:(NSString *)code didFinishEnteringItem2:(int)fieldTag
{
    //NSLog(@"This was returned from PopoverViewController %ld", (long)fieldTag);
    // NSArray *components = [item componentsSeparatedByString:@"\n"];
    //NSLog(@" popvalues %@ %@", item, code);
    
    
    id viewObj = [self.view viewWithTag:(long)fieldTag];
    
    if([viewObj isKindOfClass:[UITextField class]])
    {
        UITextField *textField =(UITextField *)viewObj;
        textField.text=removeSpecialCharacters(item);
        [popoverCodeValue setObject:emptyStringIfNil(code) forKey:[NSString stringWithFormat:@"%d", fieldTag]];
 
        //Store Survey Data
        [surveyDataDictionary setObject:removeSpecialCharacters(item) forKey:[NSString stringWithFormat:@"%d", fieldTag]];

        //[dataArray insertObject:code atIndex:fieldTag];
    }
    


}

- (NSString *)changeSwitch:(id)sender{
    
    UISwitch *switchComponent = (UISwitch *)sender;
    
    if([sender isOn]){
        //NSLog(@"Switch is ON");
        
        //Store Survey Data
        [surveyDataDictionary setObject:@"Y" forKey:[NSString stringWithFormat:@"%ld", (long)switchComponent.tag]];
        return @"Y";
        
    } else{
        
        //NSLog(@"Switch is OFF");
        
        //Store Survey Data
        [surveyDataDictionary setObject:@"N" forKey:[NSString stringWithFormat:@"%ld", (long)switchComponent.tag]];
        return @"N";
     
    }
}

- (void)operateSwitch:(UISwitch *)sender : (NSString*)flag{

    if([flag isEqualToString:@"Y"]){
        [sender setOn:YES animated:YES];
        //NSLog(@"Switch is ON");
    } else{
        [sender setOn:NO animated:YES];
        //NSLog(@"Switch is OFF");
    }
}

- (void)operateSwitch:(UISwitch*)sender{

    if([sender isOn]){
        [sender setOn:NO animated:YES];
        //NSLog(@"Switch is OFF");
    } else{
        [sender setOn:YES animated:YES];
        //NSLog(@"Switch is ON");
    }
}

- (void)operateSwitchOFF:(UISwitch*)sender{

    if([sender isOn]){
        [sender setOn:NO animated:YES];
        //NSLog(@"Switch is OFF");
    }
}

//-(void)countdownTimer{
//    
//    secondsLeft = hours = minutes = seconds = 0;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
//    
//}
//
//- (void)updateCounter:(NSTimer *)theTimer {
//    if(secondsLeft > 0 ){
//        secondsLeft -- ;
//        hours = secondsLeft / 3600;
//        minutes = (secondsLeft % 3600) / 60;
//        seconds = (secondsLeft %3600) % 60;
//        self.timerView.font=[UIFont systemFontOfSize:45.0f];
//        self.timerView.textColor=[UIColor brownColor];
//        self.timerView.textAlignment=NSTextAlignmentCenter;
//        self.timerView.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
//    }
//    else{
//        secondsLeft = 16925;
//    }
//}

//-(void)displayGraph
//{
//    
//    webView = [[UIWebView alloc] init];//]WithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
//    webView.tag=55;
//    webView.delegate = self;
//    webView.layer.borderWidth=1.0;
//    webView.layer.borderColor=[UIColor whiteColor].CGColor;
//    webView.layer.shadowRadius=10.0;
//    webView.backgroundColor = [UIColor whiteColor];
//    webView.layer.shadowOffset = CGSizeMake(0, 3);
//    webView.layer.shadowRadius = 10.0;
//    webView.layer.shadowColor = [UIColor blackColor].CGColor;
//    webView.layer.shadowOpacity = 0.8;
//    webView.layer.cornerRadius = 15.0;
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"pathstatus" ofType:@"html" inDirectory:@"www"]];
//    [webView loadRequest:[NSURLRequest requestWithURL:url]];
//    webView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:webView];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.78 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.58 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.23 constant:0]];
//    
//    
//}
//
//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    
//    NSString* json;
//    
//    @try
//    {
//        
//        
//        
//        NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
//        
//        
//        for (int i=0; i<=pathArray.count-1; i++)
//        {
//            
//            pathData = [pathArray objectAtIndex:i];
//            
//            
//            NSLog(@"path screen %@",pathData.screen);
//            
//            
//            if(pathData.screen==NULL)
//            {
//                [jsonDictionary setObject:pathStringIfNil(pathData.status) forKey:@"PERSONAL"];
//            }
//            else{
//                [jsonDictionary setObject:pathStringIfNil(pathData.status) forKey:pathData.screen];
//            }
//            
//            
//        }
//        
//        
//        NSError *errorOut;
//        NSString *jsonString;
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                           options:NSJSONWritingPrettyPrinted
//                                                             error:&errorOut];
//        
//        if (! jsonData) {
//            NSLog(@"Got an error in json creation chart: %@", errorOut);
//        } else {
//            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }
//        
//        NSLog(@"jsondata %@",jsonString);
//        
//        
//        json = [NSString stringWithFormat:@ "loadDashboardChart(%@);",jsonString];
//        
//        NSLog(@"function json %@",json);
//        [self.webView stringByEvaluatingJavaScriptFromString: json];
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in webViewDidFinishLoad code %@ reason %@ " , [exception name], [exception reason]);
//        
//        
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in webViewDidFinishLoad  Code");
//    }
//    
//}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
//{
//    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
//    return [sObj valueForKey:InstVar];
//}

-(void) logout:(id) sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    return;
}





//-(void)doDedup :(UIButton *)sender
//{
//    @try
//    {
//        
//          NSLog(@"button click doDedup ");
//        
//        if([CommonUtils checkEmptyString:txtCustomerName.text]==YES && [CommonUtils checkEmptyString:txtDateOfBirth.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Enter Data Before Duplicate Check":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//    
//
////        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
////        
////        DedupViewController *dedupViewController = [[DedupViewController alloc]initWithNibName:nil bundle:nil];
////        
////
////        //--
//////        dedupViewController.cifNumber=self.txtExtRelationNo.text;
//////        dedupViewController.accountNumber=self.txtExtRelationNo.text;
//////        dedupViewController.creditCardNumber=self.txtExtRelationNo.text;
////        dedupViewController.customerName=self.txtCustomerName.text;
////        //dedupViewController.firstName=self.txtFirstName.text;
////        dedupViewController.dob=self.txtDateOfBirth.text;
////        //dedupViewController.refNo=self.refNo;
////
////        
////        
////        // Present the view controller using the popover style.
////        dedupViewController.modalPresentationStyle = UIModalPresentationPopover;
////        [self presentViewController:dedupViewController animated: YES completion: nil];
////        
////        // Get the popover presentation controller and configure it.
////        UIPopoverPresentationController *presentationController =[dedupViewController popoverPresentationController];
////        presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
////        presentationController.sourceView = self.view;
////        NSLog(@"x %f and y %f %@",sender.frame.origin.x,sender.frame.origin.y,sender.class);
////        presentationController.sourceRect =  CGRectMake(80, sender.frame.origin.y/4, 1, 1);
//
//        
//        //dedupViewController.passportNumber=self.txtExtRelationNo.text;
//        //dedupViewController.emiratesId=self.txtExtRelationNo.text;
//        //dedupViewController.fieldTag=(int)sender.tag;
//        //dedupViewController.delegate=self;
//        
////        UIPopoverController *dedupController =[[UIPopoverController alloc] initWithContentViewController:dedupViewController];
////        [dedupController setPopoverContentSize:CGSizeMake(dedupViewController.view.frame.size.width/2, dedupViewController.view.frame.size.height/2)];
//        
//        
////        if(dedupController.popoverVisible==NO){
////            
////            //NSLog(@" dedup popover x %lf",sender.frame.origin.x);
////            //NSLog(@" dedup popover y %lf",sender.frame.origin.y);
////            //CGRectMake(0, sender.frame.origin.y, 1, 1)
////            
////            [dedupController presentPopoverFromRect:CGRectMake(80, sender.frame.origin.y/4, 1, 1) inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
////        }
////        else{
////            [dedupController dismissPopoverAnimated:YES];
////        }
//        
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in do dedup code %@ reason %@ " , [exception name], [exception reason]);
//        
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in do dedup Code");
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    }
//    
//    
//}

- (void) buildMO {
    
    @try{
        
         NSLog(@"BuildMO Starts");
        
//        UITextField *textField;
//        UITextView *textView;
//        UISwitch *switchComponent;
//        NSString *dataValue;
        NSString *mandatoryFieldEmpty=@"N";

//        NSMutableArray *cells = [[NSMutableArray alloc] init];


        //NSLog(@"numberofsections %ld",[tableViewPage1 numberOfSections]);



       
//        //--------tableViewPage1 Loop to read data------
//        for (NSInteger j = 0; j < [tableViewPage1 numberOfSections]; ++j)
//        {
//            
//            for (NSInteger i = 0; i < [tableViewPage1 numberOfRowsInSection:j]; ++i)
//            {
//                [cells addObject:[tableViewPage1 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
//
//            }
//
//        }
//         //--------tableViewPage2 Loop to read data------
//        for (NSInteger j = 0; j < [tableViewPage2 numberOfSections]; ++j)
//        {
//            
//            for (NSInteger i = 0; i < [tableViewPage2 numberOfRowsInSection:j]; ++i)
//            {
//                [cells addObject:[tableViewPage2 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
//            }
//
//        }
//         //--------tableViewPage3 Loop to read data------
//        for (NSInteger j = 0; j < [tableViewPage3 numberOfSections]; ++j)
//        {
//            
//            for (NSInteger i = 0; i < [tableViewPage3 numberOfRowsInSection:j]; ++i)
//            {
//                [cells addObject:[tableViewPage3 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
//            }
//
//        }
//        
//        NSLog(@"Cell inserted in Array");
//
//        surveyDataDictionary=[[NSMutableDictionary alloc]init];
//    
//        for (UITableViewCell *cell in cells)
//        {
//            for(UIView *view in cell.contentView.subviews)
//            {
//                if ([view isKindOfClass:[UITextField class]]) {
//                    
//                    textField = (UITextField *)view;
//                    dataValue=emptyStringIfNil(textField.text);
//                    dataValue=[dataValue stringByReplacingOccurrencesOfString:@"|" withString:@""];
//                    dataValue=[dataValue stringByReplacingOccurrencesOfString:@"#" withString:@""];
//            
//                    [surveyDataDictionary setObject:dataValue forKey:[NSString stringWithFormat:@"%ld", (long)textField.tag]];
//                    
//                    NSLog(@"textField-  %@",textField.text );
//                    
//                    
//                }
//                if ([view isKindOfClass:[UITextView class]]) {
//                    
//                    textView = (UITextView *)view;
//                    dataValue=emptyStringIfNil(textView.text);
//                    dataValue=[dataValue stringByReplacingOccurrencesOfString:@"|" withString:@""];
//                    dataValue=[dataValue stringByReplacingOccurrencesOfString:@"#" withString:@""];
//                    [surveyDataDictionary setObject:dataValue forKey:[NSString stringWithFormat:@"%ld", (long)textView.tag]];
//                    
//                    NSLog(@"textView-  %@",textView.text );
//                    
//                }
//                if([view isKindOfClass:[UISwitch class]]){
//                    
//                    switchComponent=(UISwitch *)view;
//                     [surveyDataDictionary setObject:[self changeSwitch:switchComponent] forKey:[NSString stringWithFormat:@"%ld", (long)switchComponent.tag]];
//                }
//                
//                
//            }
//        }


        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        NSString *currentDateTime = [formatter stringFromDate:[NSDate date]];
        
        NSLog(@"Survey data currentDateTime %@",currentDateTime);
        
        NSArray *sortedKeys = [[surveyDataDictionary allKeys] sortedArrayUsingSelector:@selector(localizedStandardCompare:)];
        //NSLog(@"Survey data sortedKeys %@",sortedKeys);
 
        
        NSString *surveyDataConcat=@"";
        for(NSString *key in sortedKeys) {
            
             //NSLog(@"Surveydatain for loop start %@, %@", key, [surveyDataDictionary valueForKey:key]);
            
            surveyDataConcat=[NSString stringWithFormat:@"%@%@|%@#",surveyDataConcat,[fieldNames valueForKey:key],emptyStringIfNil([surveyDataDictionary valueForKey:key])];
             NSLog(@"Survey data in for loop %@",surveyDataConcat);
            
            //------Not in the Inactive fields && Available in the Mandatory fields &&  Data is empty then show the message
            if(![inActiveFields valueForKey:key] && [mandatoryFields valueForKey:key] && [emptyStringIfNil([surveyDataDictionary valueForKey:key]) isEqualToString:@""])
            {
                mandatoryFieldEmpty=@"Y";
            }
            
        }

        if([mandatoryFieldEmpty isEqualToString:@"Y"])
        {
            [CommonUtils showMessage:@"Please enter mandatory information" :self];
            return;
        }
        
        
        //--------Get confirmation and save---
        UIAlertController *alertController=[UIAlertController
                             alertControllerWithTitle:@"Confirmation"
                             message:[NSString stringWithFormat:@"Would you like to submit data?"]
                             preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* okAction = [UIAlertAction
                                   actionWithTitle:@"Yes"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
 
        
                                SurveyMO *surveyMO = (SurveyMO *)[NSEntityDescription insertNewObjectForEntityForName:@"Survey" inManagedObjectContext:managedObjectContext];
                                surveyMO.eventID=eventID;
                                surveyMO.instituteID=instituteID;
                                surveyMO.surveyData=surveyDataConcat;
                                surveyMO.sync=@"N";
                                surveyMO.surveyorID=[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"];
                                surveyMO.surveyDateTime=currentDateTime;
                                surveyMO.eventName=eventName;
                                surveyMO.surveyorName=[[NSUserDefaults standardUserDefaults] stringForKey:@"userName"];
                                surveyMO.instituteName=instituteName;
                                
                                
                                NSError *error = nil;
                                if ([managedObjectContext save:&error] == NO) {
                                    NSAssert(NO, @"Error saving context parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
                                }
                                
                                
                                //NSLog(@"Before Fetch Survey Data");
                                //---To Fetch----
                                NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Survey"];
                                //[request setReturnsObjectsAsFaults:NO];
                                NSArray *resultsSurvey = [managedObjectContext executeFetchRequest:request error:&error];
                                if (!resultsSurvey) {
                                    NSLog(@"Error fetching Event objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
                                }
                                
                                //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
                                //NSLog(@"Return values from Survey MO  results %@",resultsSurvey);
                                //SurveyMO *surveyMOResults=(SurveyMO *)resultsSurvey[0];
                                //NSLog(@"Return values from MO desc value %@",surveyMOResults.surveyData);
                                

                                [self clearScreen];
                                [CommonUtils showMessage:@"Survey data saved" :self];
                                
                                                                          }];
                
                UIAlertAction* noAction = [UIAlertAction
                                           actionWithTitle:@"No"
                                           style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction * action)
                                           {
                                               
                                               
                                               
                                           }];
                
                
                [alertController addAction:okAction];
                [alertController addAction:noAction];
    
                [self presentViewController:alertController animated:YES completion:nil];
                

        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in do dedup code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in do dedup Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }

}

//
//-(void) loadActivityIndicatorsrdedefrdedeeddsxxds
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
    return (value == (id)[NSNull null] || value.length == 0 )? value = @"":value; //value? value : @"";
}

//static inline NSString* pathStringIfNil(NSString *value) {
//    
//    return ([value isEqualToString:@"Y"]? @"100" : @"0");
//}

////Keyboard up
////03-May-2016
//
//#define kOFFSET_FOR_KEYBOARD 352.0
//
//-(void)keyboardWillShow {
//    // Animate the current view out of the way
//    if (self.view.frame.origin.y >= 0)
//    {
//        [self setViewMovedUp:YES];
//    }
//    else if (self.view.frame.origin.y < 0)
//    {
//        [self setViewMovedUp:NO];
//    }
//}
//
//-(void)keyboardWillHide {
//    if (self.view.frame.origin.y >= 0)
//    {
//        [self setViewMovedUp:YES];
//    }
//    else if (self.view.frame.origin.y < 0)
//    {
//        [self setViewMovedUp:NO];
//    }
//}
//
//-(void)textFieldDidBeginEditing:(UITextField *)sender
//{
//    //if ([sender isEqual:mailTf])
//    //{
//        //move the main view, so that the keyboard does not hide it.
//        if  (self.view.frame.origin.y >= 0)
//        {
//            [self setViewMovedUp:YES];
//        }
//    //}
//}
//
////method to move the view up/down whenever the keyboard is shown/dismissed
//-(void)setViewMovedUp:(BOOL)movedUp
//{
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
//
//    CGRect rect = self.view.frame;
//    if (movedUp)
//    {
//        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard 
//        // 2. increase the size of the view so that the area behind the keyboard is covered up.
//        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
//        rect.size.height += kOFFSET_FOR_KEYBOARD;
//    }
//    else
//    {
//        // revert back to the normal state.
//        rect.origin.y += kOFFSET_FOR_KEYBOARD;
//        rect.size.height -= kOFFSET_FOR_KEYBOARD;
//    }
//    self.view.frame = rect;
//
//    [UIView commitAnimations];
//}
//
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    // register for keyboard notifications
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                         selector:@selector(keyboardWillShow)
//                                             name:UIKeyboardWillShowNotification
//                                           object:nil];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                         selector:@selector(keyboardWillHide)
//                                             name:UIKeyboardWillHideNotification
//                                           object:nil];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    // unregister for keyboard notifications while not visible.
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                             name:UIKeyboardWillShowNotification
//                                           object:nil];
//
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                             name:UIKeyboardWillHideNotification
//                                           object:nil];
//}
//
////-----------end of textfield keyboard scroll up




- (void)segmentControlAction:(UISegmentedControl *)segment
{
    // lazy load data for a segment choice (write this based on your data)
    //[self fetchAccounts];//:segmentedControl.selectedSegmentIndex];
    
    
    if(segmentedControl.selectedSegmentIndex == 0)
    {
     
        
  
            screenView1.hidden=NO;
            screenView2.hidden=YES;
            screenView3.hidden=YES;


        
    }
    else if(segmentedControl.selectedSegmentIndex == 1){
        
        

            screenView1.hidden=YES;
            screenView2.hidden=NO;
            screenView3.hidden=YES;
        
    }
    else if(segmentedControl.selectedSegmentIndex == 2){
        
        

            screenView1.hidden=YES;
            screenView2.hidden=YES;
            screenView3.hidden=NO;
        
    }
    else{
    
        
            screenView1.hidden=NO;
            screenView2.hidden=YES;
            screenView3.hidden=YES;
 
        
    }
    
    [UIView  beginAnimations: @"Showinfo"context: nil];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];

}


- (void) displayEventHeader{
    
    
    UIView *headerView = [[UIView alloc] init];
    //headerView.layer.borderWidth=1.0;
    //    headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    //    headerView.layer.shadowRadius=10.0;
    headerView.backgroundColor = [UIColor lightBlueColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor whiteColor];
    headerView.layer.shadowOffset = CGSizeMake(0, 3);
    headerView.layer.shadowRadius = 10.0;
    headerView.layer.shadowColor = [UIColor grayColor].CGColor;
    headerView.layer.shadowOpacity = 0.8;
    headerView.layer.cornerRadius = 15.0;
    //headerView.layer.doubleSided=YES;
    headerView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:headerView];
    
    //create the frame that will contain our label
    //CGRect labelFrame = CGRectMake(40, 60, 240, 80);
    
    //NSLog(@" frame width %lf",headerView.bounds.size.width);
    //NSLog(@" frame height %lf",headerView.bounds.size.height);

    
    UIImageView *imageView =[[UIImageView alloc] init];//]WithFrame:CGRectMake(50,50,80,80)];
    imageView.image=eventImage;
    imageView.contentMode=UIViewContentModeCenter;
    imageView.layer.masksToBounds=YES;
    //[imageView.layer setBorderColor:[UIColor borderBlueColor].CGColor];
    //[imageView.layer setBorderWidth:2.0f];
    //[imageView.layer setCornerRadius:15.0f];
    [imageView.layer setShadowColor:[UIColor grayColor].CGColor];
    imageView.translatesAutoresizingMaskIntoConstraints=NO;
    [headerView addSubview:imageView];
    
    
    //move the frame position
    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
    //headerView.bounds.origin.y +=  15.0f;
    UILabel *lblEventName = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblEventName = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblEventName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:50];//[UIFont systemFontOfSize:64.0f];
    lblEventName.textAlignment =  NSTextAlignmentLeft;
    lblEventName.textColor = [UIColor whiteColor];
    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerNumber.layer.borderWidth = 1.0;
    //lblEventName.text=[NSString stringWithFormat:@"%@",dashboardData.totalCASABalance];
    lblEventName.text=[NSString stringWithFormat:@"%@",eventName];
    lblEventName.translatesAutoresizingMaskIntoConstraints=NO;
    [headerView addSubview:lblEventName];
//    
//    UILabel *lblCurrency = [[UILabel alloc] init];//WithFrame:headerView.frame];
//    lblCurrency = [[UILabel alloc] init];//WithFrame:headerView.frame];
//    lblCurrency.font = [UIFont fontWithName:@"HelveticaNeue" size:12];//[UIFont systemFontOfSize:64.0f];
//    lblCurrency.textAlignment =  NSTextAlignmentLeft;
//    lblCurrency.textColor = [UIColor whiteColor];
//    //lblCurrency.text=dashboardData.accountCurrency;
//    lblCurrency.text=eventID;
//    lblCurrency.translatesAutoresizingMaskIntoConstraints=NO;
//    [headerView addSubview:lblCurrency];
//    
    
    UILabel *lblInstituteName = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblInstituteName = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblInstituteName.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    lblInstituteName.textAlignment =  NSTextAlignmentLeft;
    lblInstituteName.textColor = [UIColor whiteColor];
    lblInstituteName.text= [NSString stringWithFormat:@"%@",instituteName];
    lblInstituteName.translatesAutoresizingMaskIntoConstraints=NO;
    [headerView addSubview:lblInstituteName];
    
    UIView *lineView = [[UIView alloc] init];//WithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.translatesAutoresizingMaskIntoConstraints=NO;
    [headerView addSubview:lineView];
    
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.23 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.8 constant:0]];
    
    
    
    //---lblCIFNumber
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblEventName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblEventName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    //------currency
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCurrency attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCurrency attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    //---------available balance label
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblInstituteName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblInstituteName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    
    //------line view----//
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeHeight multiplier:0.02 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.6 constant:0]];


   //------Image View----//
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.23 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.16 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];


    
}

//Clear screen
-(void) clearScreen{


        UITextField *textField;
        UITextView *textView;
        UISwitch *switchComponent;

        NSMutableArray *cells = [[NSMutableArray alloc] init];
    
        //-------TableViewPage1 clear screen-----
        for (NSInteger j = 0; j < [tableViewPage1 numberOfSections]; ++j)
        {
            
            for (NSInteger i = 0; i < [tableViewPage1 numberOfRowsInSection:j]; ++i)
            {
                if([tableViewPage1 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]] != nil)
                {
                    [cells addObject:[tableViewPage1 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
                }
            }

        }
        //-------TableViewPage2 clear screen-----
        for (NSInteger j = 0; j < [tableViewPage2 numberOfSections]; ++j)
        {
            
            for (NSInteger i = 0; i < [tableViewPage2 numberOfRowsInSection:j]; ++i)
            {
                if([tableViewPage2 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]] != nil)
                {
                    [cells addObject:[tableViewPage2 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
                }
            }

        }
        //-------TableViewPage3 clear screen-----
        for (NSInteger j = 0; j < [tableViewPage3 numberOfSections]; ++j)
        {
            
            for (NSInteger i = 0; i < [tableViewPage3 numberOfRowsInSection:j]; ++i)
            {
                if([tableViewPage3 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]] != nil)
                {
                    [cells addObject:[tableViewPage3 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]]];
                }
            }

        }
    
        for (UITableViewCell *cell in cells)
        {
            for(UIView *view in cell.contentView.subviews)
            {
                if ([view isKindOfClass:[UITextField class]]) {
                    
                    textField = (UITextField *)view;
                    
                    textField.text=@"";
                    
                    
                }
                if ([view isKindOfClass:[UITextView class]]) {
                    
                    textView = (UITextView *)view;
                    textView.text=@"";
                    
                    
                }
                if([view isKindOfClass:[UISwitch class]]){
                    
                    switchComponent=(UISwitch *)view;
                    [self operateSwitchOFF:switchComponent];
                }
                
                
            }
        }

        //----assign keyvalue as SeqNo in the dictionary so that all SeqNo numbers will be captured initially
        EventTemplateMO *eventTemplateDataMO;
        for (int i=0; i<=resultsEventTemplate.count-1; i++)
        {
            eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplate[i];
            
            //Store Survey Data
            [surveyDataDictionary setObject:@"" forKey:eventTemplateDataMO.seqNo];

        }

        //move to page-1 after save
        segmentedControl.selectedSegmentIndex = 0;
    
        //if more than one page then move to page-1
        if(segmentedControl.numberOfSegments>1)
        {
            [self segmentControlAction:segmentedControl];
        }

}



static inline NSString* removeSpecialCharacters(NSString *data)
{

    NSString *value;
    value=emptyStringIfNil(data);
    value=[value stringByReplacingOccurrencesOfString:@"|" withString:@""];
    value=[value stringByReplacingOccurrencesOfString:@"#" withString:@""];
    return value;

}




@end

