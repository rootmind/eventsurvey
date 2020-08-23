//
//  QueueViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 08/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SurveyViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "QueueViewController.h"




//#import "OCRViewController.h"
//#import "OCRPageViewController.h"

//#import "AddressData.h"






@interface QueueViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

//
//
//CGFloat lblConstraintQX=0.52f;
//CGFloat lblConstraintQY=1.0f;
//CGFloat lblConstraintQWidth=0.5f;
//CGFloat lblConstraintQHeight=0.8f;
//
//CGFloat constraintQX=1.19f;
//CGFloat constraintQY=1.0f;
//CGFloat constraintQWidth=0.80f;
//CGFloat constraintQHeight=0.8f;
//
//CGFloat constraintQ1X=0.69f;
//CGFloat constraintQ1Y=1.0f;
//CGFloat constraintQ1Width=0.3f;
//CGFloat constraintQ1Height=0.8f;
//
//CGFloat lblConstraintQ2X=1.52f;
//CGFloat lblConstraintQ2Y=1.0f;
//CGFloat lblConstraintQ2Width=0.5f;
//CGFloat lblConstraintQ2Height=0.8f;
//
//CGFloat constraintQ2X=1.69f;
//CGFloat constraintQ2Y=1.0f;
//CGFloat constraintQ2Width=0.3f;
//CGFloat constraintQ2Height=0.8f;


@implementation QueueViewController


//@synthesize userid;
//@synthesize sessionid;
//@synthesize actionMode;
//
//@synthesize menuName;
//@synthesize recordStatus;

//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
//@synthesize dataDictionary;



//@synthesize personalArray;
//@synthesize personalData;
//
//@synthesize dateToolBar;
//@synthesize datePicker;
//
//
//@synthesize dataArray;
//
//@synthesize refNo;
//
//@synthesize webView;
//
//
//@synthesize timerView;
//
//
//@synthesize menuId;

@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;

@synthesize eventDataArray;
@synthesize resultsEvent;

//int hours, minutes, seconds,secondsLeft;





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    //self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    //[self.splitViewController.displayModeButtonItem action];
    
    
    //self.navigationItem.title=@"Queue";
    
    
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
    
    
    //    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(callHost)];
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
    
    //---Screen UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.86 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.97 constant:0]];
    
    
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
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
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
    
    
    
    
    //---table UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    
//    UITabBar *tabBar=[[UITabBar alloc]init];
//    tabBar.delegate=self;
//    [self.view addSubview:tabBar];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabBar attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabBar attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabBar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    //UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:@"First" image:[UIImage imageNamed:@"money-wallet-icon.png"]];
    //UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:@"Second" image:[UIImage imageNamed:@"money-wallet-icon.png"]];
    
    //NSArray *itemsArray = @[firstItem, secondItem];
    
    //[tabBar setItems:itemsArray animated:YES];
    
    
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
    
    //secondsLeft = 16925;
    //[self countdownTimer];
    
    
//    UIButton *enameView = [[UIButton alloc] init];
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
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
//    UIButton *dedupView = [[UIButton alloc] init];
//    dedupView.layer.borderWidth=1.0;
//    dedupView.layer.borderColor=[UIColor whiteColor].CGColor;
//    dedupView.layer.shadowRadius=10.0;
//    dedupView.backgroundColor = [UIColor whiteColor];
//    dedupView.layer.shadowOffset = CGSizeMake(0, 3);
//    dedupView.layer.shadowRadius = 10.0;
//    dedupView.layer.shadowColor = [UIColor blackColor].CGColor;
//    dedupView.layer.shadowOpacity = 0.8;
//    dedupView.layer.cornerRadius = 15.0;
//    dedupView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:dedupView];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    //[self displayGraph];
    
    
    
    //[self fetchOnBoardQueue];
    
    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Sync" style:UIBarButtonItemStylePlain target:self action:@selector(doDownload)];
    
    self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    UIBarButtonItem* leftNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(deleteSurveyData)];
    
    self.navigationItem.leftBarButtonItem =leftNavButton ;

    
    
    
    CoreDataController *coreDataController=[CoreDataController sharedCoreDataController];

    managedObjectContext = coreDataController.managedObjectContext;
    managedObjectModel=coreDataController.managedObjectModel;
    persistentStoreCoordinator = coreDataController.persistentStoreCoordinator;
    NSError *error = nil;
    
    
    
//    NSLog(@"Queue Before Fetch EventUser");
//    //---To Fetch----
//    NSFetchRequest *requestEventUser = [NSFetchRequest fetchRequestWithEntityName:@"MST_EventUser"];
//    [requestEventUser setReturnsObjectsAsFaults:NO];
//    //NSError *error=nil;
//    [requestEventUser setPredicate:[NSPredicate predicateWithFormat:@"userid == %@",emptyStringIfNil([[NSUserDefaults standardUserDefaults] stringForKey:@"userid"])]];
//    
//    NSArray *resultsEventUser = [managedObjectContext executeFetchRequest:requestEventUser error:&error];
//    if (!resultsEventUser) {
//        NSLog(@"Error fetching buildJSONSaveSurveyData objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
//    }
//    
//    NSLog(@"Return values from EventUser MO  results %@",resultsEventUser);
//    MST_EventUserMO *eventUserDataMO=(MST_EventUserMO  *)resultsEventUser[0];
//    
//    NSLog(@"Return values from Queue EventUser MO  results %@",eventUserDataMO.description);
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    
    NSString *currentDateTime = [formatter stringFromDate:[NSDate date]];
    
    NSLog(@"Queue Before Fetch Event %@",currentDateTime);
    //---To Fetch----
    NSFetchRequest *requestEvent = [NSFetchRequest fetchRequestWithEntityName:@"MST_Event"];
    [requestEvent setReturnsObjectsAsFaults:NO];
    
    NSLog(@"userid filter %@",emptyStringIfNil([[NSUserDefaults standardUserDefaults] stringForKey:@"userid"]));
    
    [requestEvent setPredicate:[NSPredicate predicateWithFormat:@"userid == %@ AND startDate >= %@ AND %@ <= expiryDate1 ",emptyStringIfNil([[NSUserDefaults standardUserDefaults] stringForKey:@"userid"]),currentDateTime,currentDateTime]];

    resultsEvent = [managedObjectContext executeFetchRequest:requestEvent error:&error];
    if (!resultsEvent) {
        NSLog(@"Error fetching Event objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    
    //MST_expiry *eventDataMO=(MST_EventMO *)results[0];
    
    NSLog(@"Return values from Event MO  results %@",resultsEvent);
    //MST_EventMO *eventDataMO=(MST_EventMO *)resultsEvent[0];
    
    //NSLog(@"Return values from MO desc value %@",eventDataMO.desc);
    
//    NSLog(@"Before Fetch Users");
//    //---To Fetch----
//    NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"Users"];
//    [request setReturnsObjectsAsFaults:NO];
//    NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
//    if (!results) {
//        NSLog(@"Error fetching Users objects parseResponseUsers: %@\n%@", [error localizedDescription], [error userInfo]);
//    }

   
    
//    NSLog(@"Queue Before Fetch Institute");
//
//    //---To Fetch----
//    NSFetchRequest *requestInstitute = [NSFetchRequest fetchRequestWithEntityName:@"MST_Institute"];
//    [requestInstitute setReturnsObjectsAsFaults:NO];
//    //NSError *error=nil;
////    [requestInstitute setPredicate:[NSPredicate predicateWithFormat:@"sync == %@", @"N"]];
//    
//    NSArray *resultsInstitute = [managedObjectContext executeFetchRequest:requestInstitute error:&error];
//    if (!resultsInstitute) {
//        NSLog(@"Error fetching buildJSONSaveSurveyData objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
//    }
//    NSLog(@"Return values from EventInstitute MO  results %@",resultsInstitute);
//    MST_InstituteMO *instituteDataMO=(MST_InstituteMO  *)resultsInstitute[0];
//    
//    NSLog(@"Return values from Queue Institute MO  results %@",instituteDataMO.description);
//    
//    
//    
//    NSLog(@"Queue Before Fetch EventInstitute");
//    //---To Fetch----
//    NSFetchRequest *requestEventInstitute= [NSFetchRequest fetchRequestWithEntityName:@"MST_EventInstitute"];
//    [requestEventInstitute setReturnsObjectsAsFaults:NO];
//    NSArray *resultsEventInstitute = [managedObjectContext executeFetchRequest:requestEventInstitute error:&error];
//    if (!resultsEventInstitute) {
//        NSLog(@"Error fetching EventInstitute objects parseResponseEventInstitute: %@\n%@", [error localizedDescription], [error userInfo]);
//    }
//    
//    //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
//    
//    NSLog(@"Return values from EventInstitute MO  results %@",resultsEventInstitute);
//    MST_EventInstituteMO *eventInstituteDataMO=(MST_EventInstituteMO *)resultsEventInstitute[0];
//    
//    NSLog(@"Return values from MO EventInstituteMO desc value %@",eventInstituteDataMO.eventID);
//    
//    
    
//    NSLog(@"Queue Before Fetch EventTemplate");
//    //---To Fetch----
//    NSFetchRequest *requestEventTemplate= [NSFetchRequest fetchRequestWithEntityName:@"MST_EventTemplate"];
//    NSArray *resultsEventTemplate = [managedObjectContext executeFetchRequest:requestEventTemplate error:&error];
//    if (!resultsEventTemplate) {
//        NSLog(@"Error fetching EventTemplate objects parseResponseEventTemplate: %@\n%@", [error localizedDescription], [error userInfo]);
//    }
//    
//    //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
//    
//    NSLog(@"Return values from EventTemplate MO  results %@",resultsEventTemplate);
//    EventTemplateMO *eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplate[0];
//    
//    NSLog(@"Return values from MO desc value %@",eventTemplateDataMO.component);
//    NSLog(@"Return values from MO SeqNo value %@",eventTemplateDataMO.seqNo);

    
       
    
    
    
    [self doValidate];
    
    //[self initializeFetchedResultsController];
    
    
    //[self displayHeader];
    
    
    
    
    
    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
    
    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //    if (textField == self.txtCustomerName) {
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
    
    //        if ([textField isEqual: txtDOB])
    //        {
    //            [self setDate:txtDOB];
    //            return NO;
    //
    //        }
    
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
    
    
}



//-(void) setDate:(UITextField *)textField
//{
//    
//    
//    
//    //UITextField *textField =(UITextField *)sender;
//    NSLog(@"fieldTag1 %ld", (long)textField.tag);
//    
//    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,44,0, 0)];
//    textField.delegate=self;
//    datePicker.hidden=NO;
//    //[datePicker setDate:[NSDate date]];
//    datePicker.datePickerMode = UIDatePickerModeDate;
//    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
//    [textField setInputView:datePicker];
//    
//    
//    
//    dateToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
//    [dateToolBar setBarStyle:UIBarStyleDefault];
//    [dateToolBar sizeToFit];
//    
//    
//    UIBarButtonItem* flexButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace    target:self  action:nil];
//    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self  action:@selector(donePicker)];
//    NSArray* barItems = [NSArray arrayWithObjects:flexButton,doneButton, nil];
//    [dateToolBar setItems:barItems animated:YES];
//    
//    textField.inputAccessoryView=dateToolBar;
//    
//    
//    
//}

//-(void)donePicker
//{
//    
//    [dateToolBar removeFromSuperview];
//    [datePicker removeFromSuperview];
//    
//    
//    
//}

//-(void) dateTextField:(UITextField *)sender
//{
//    
//    NSLog(@"fieldTag2 %ld", (long)sender.tag);
//    
//    //UITextField *textField = (UITextField *)sender;
//    UIDatePicker *picker = (UIDatePicker*)sender.inputView;
//    [picker setMaximumDate:[NSDate date]];
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    NSDate *eventDate = picker.date;
//    [dateFormat setDateFormat:@"dd/MM/yyyy"];
//    
//    NSString *dateString = [dateFormat stringFromDate:eventDate];
//    sender.text = [NSString stringWithFormat:@"%@",dateString];
//}





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
    
    
    return [resultsEvent count]; //12;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 100;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 0.00f;
    }
    return 15.0f;
}

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
    
    cell.backgroundColor=[UIColor pumice];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor lightGrayColor];
    cell.layer.borderWidth=0.5f;
    cell.layer.cornerRadius=15.0f;
    cell.layer.borderColor=[UIColor borderColor].CGColor;
    cell.layer.shadowRadius=3.0f;
    cell.layer.shadowOffset = CGSizeMake(0, 3);
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOpacity = 0.8;
    
    
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
    
    //cell.imageView.image=[[UIImage imageNamed:@"briefcase.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    
    
    
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
    
    
    //personalData = [personalArray objectAtIndex:indexPath.section];
    
    
    MST_EventMO *eventDataMO=(MST_EventMO *)resultsEvent[indexPath.section];
    
    
    
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ \n%@\n%@\n%@\n%@",personalData.refNo, personalData.customerName,personalData.accountType,personalData.makerId,personalData.makerDateTime];
//    cell.textLabel.numberOfLines=0;
//    
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",personalData.recordStatus];
    //cell.detailTextLabel.numberOfLines=2;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ \n%@ \n%@ \nStartDate:%@ EndDate:%@",eventDataMO.code, eventDataMO.desc, eventDataMO.instituteName, eventDataMO.startDate,eventDataMO.expiryDate1];
    cell.textLabel.numberOfLines=0;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ \n%@",eventDataMO.userid,eventDataMO.status];
    
    
    
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.accessoryType = UITableViewCellAccessoryNone;
        
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor lightBluishColor];
        bgColorView.layer.masksToBounds = YES;
        cell.selectedBackgroundView = bgColorView;
        
           cell.accessoryView = [UIImageView accessoryImage];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
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
    
    
    
    NSUInteger row = indexPath.section;//row;
    
    MST_EventMO *eventDataMO=(MST_EventMO *)resultsEvent[indexPath.section];

    //[NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    if (row != NSNotFound)
    {
        
        SurveyViewController *surveyViewController = [[SurveyViewController alloc]initWithNibName:nil bundle:nil];
        surveyViewController.eventID=eventDataMO.code;
        surveyViewController.eventName=eventDataMO.desc;
        surveyViewController.instituteID=eventDataMO.instituteID;
        surveyViewController.instituteName=eventDataMO.instituteName;
        
        [self.navigationController pushViewController:surveyViewController animated:YES];

        
        
        //personalData = [personalArray objectAtIndex:indexPath.section];
        
        //NSLog(@"selected ref %@ %@",personalData.refNo,menuId);
        
        
        //-- Menu Name
        
//        if([personalData.accountType isEqualToString:@"SA"])
//        {
//            menuName=@"Savings Account";
//        }
//        else if([personalData.accountType isEqualToString:@"CA"])
//        {
//            menuName=@"Current Account";
//        }

        
        //--
        
//        if([menuId isEqualToString:@"IMAGEUPLOAD"])
//        {
//        
//            ImageUploadViewController *imageUploadViewController = [[ImageUploadViewController alloc]initWithNibName:nil bundle:nil];
//            imageUploadViewController.refNo=personalData.refNo;
//            imageUploadViewController.cifNumber=personalData.cifNumber;
//            imageUploadViewController.actionMode=@"UPDATE";
//            
//            imageUploadViewController.accountType=personalData.accountType;
//            
//            imageUploadViewController.menuName=menuName;
//           
//            [self.navigationController pushViewController:imageUploadViewController animated:YES];
//
//        
//        }
//        else if([menuId isEqualToString:@"IMAGEVIEW"])
//        {
//            
//            ImagePageViewController *imagePageViewController = [[ImagePageViewController alloc]initWithNibName:nil bundle:nil];
//            imagePageViewController.refNo=personalData.refNo;
//            imagePageViewController.cifNumber=personalData.cifNumber;
//            imagePageViewController.actionMode=@"UPDATE";
//            imagePageViewController.menuName=menuName;
//            [self.navigationController pushViewController:imagePageViewController animated:YES];
//            
//            
//        }


    }
    
    
    //[NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}
- (void) doValidate {
    
    // ------validation starts---------

    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    [self buildJSON];
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}

- (void) buildJSON {
    
    
    //NSDictionary *jsonDictionary;
    //NSData *newData;
    
    @try{
        
        
//            NSManagedObjectContext *managedObjectContext = ((CoreDataController *) [UIApplication sharedApplication].delegate).managedObjectContext;
//     
//            MST_Event *event = [NSEntityDescription insertNewObjectForEntityForName:@"MST_Event" inManagedObjectContext:managedObjectContext];
//            
//
//            NSError *error = nil;
//            if ([managedObjectContext save:&error] == NO) {
//                NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
//            }
//
//            NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MST_Event"];
//             
//            NSError *error = nil;
//            NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
//            if (!results) {
//                NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
//                
//            }


            
//            jsonDictionary= @{
//                              @"recordStatus":emptyStringIfNil(self.recordStatus)
//                              };
        
            
      
        
        
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
        
        
        
        
 
            
            //newData=[CommonUtils connectHost :@"fetchOnBoardQueue" :jsonDictionary :self];
            //[self parseResponse:newData :@"fetchOnBoardQueue":@"personalDetailsWrapper"];
        
        
        
            //                NSLog(@"Before Fetch");



//            //---To Fetch----
//            NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MST_Event"];
//            [request setReturnsObjectsAsFaults:NO];
//            NSError *error = nil;
//            results = [managedObjectContext executeFetchRequest:request error:&error];
//            if (!results) {
//                NSLog(@"Error fetching Event objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
//            }
//    
//            MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
//    
//            NSLog(@"Return values from MO %@",eventDataMO.desc);
        
        
//            NSLog(@"Before Fetch");
//            //---To Fetch----
//            NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MST_Event"];
//            [request setReturnsObjectsAsFaults:NO];
//            NSError *error = nil;
//            results = [managedObjectContext executeFetchRequest:request error:&error];
//            if (!results) {
//                NSLog(@"Error fetching Event objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
//            }
//            
//            //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
//            
//            NSLog(@"Return values from Event MO  results %@",results);
//            MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
//            
//            NSLog(@"Return values from MO desc value %@",eventDataMO.desc);
        
        
        
//        NSLog(@"Before Fetch EventTemplate");
//        //---To Fetch----
//        NSFetchRequest *requestEventTemplate= [NSFetchRequest fetchRequestWithEntityName:@"EventTemplate"];
//        NSArray *resultsEventTemplate = [managedObjectContext executeFetchRequest:requestEventTemplate error:&error];
//        if (!resultsEventTemplate) {
//            NSLog(@"Error fetching EventTemplate objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
//        }
//        
//        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
//        
//        NSLog(@"Return values from Queue EventTemplate MO  results %@",resultsEventTemplate);
//        EventTemplateMO *eventTemplateDataMO=(EventTemplateMO *)resultsEventTemplate[0];
//        
//        NSLog(@"Return values from MO desc value %@",eventTemplateDataMO.component);
//
//            eventDataArray = [[NSMutableArray alloc] init];
//            MST_EventMO *eventDataMO=nil;
//            
//            for(NSArray *array in results) {
//                
//                [eventDataArray addObject:eventDataMO];
//                
//            }
        
                
            //NSLog(@"data count %lu",(unsigned long)eventDataArray.count);
        

        
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
//- (void) parseResponse:(NSData *) data :(NSString *)methodAction :(NSString *) dataFile{
//    
//    
//    @try {
//        
//        
//        
//        NSLog(@"get customer info enterest %@",userid);
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
//            sessionid = [jsonObject objectForKey:@"sessionid"];
//            
//            NSLog(@"userid print :%@",userid);
//            NSLog(@"sessionid print :%@",sessionid);
//            
//            
//            NSNumber *success = [jsonObject objectForKey:@"success"];
//            if([success boolValue] == YES){
//                
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
//                personalArray = [[NSMutableArray alloc] init];
//                
//                // Get an array of dictionaries with the key "locations"
//                NSArray *array = [dataDictionary objectForKey:dataFile];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    personalData = [[PersonalData alloc] initWithJSONDictionary:dict];
//                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
//                    
//                    // Add the Location object to the array
//                    [personalArray addObject:personalData];
//                }
//                
//                
//                NSLog(@"data count %lu",(unsigned long)personalArray.count);
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
//                 [CommonUtils showMessage:@"Records not found!":self];
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






- (void)initializeFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MST_Event"];
 
    NSSortDescriptor *lastNameSort = [NSSortDescriptor sortDescriptorWithKey:@"desc" ascending:YES];
 
    [request setSortDescriptors:@[lastNameSort]];
 
 
    [self setFetchedResultsController:[[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil]];
    [[self fetchedResultsController] setDelegate:self];
 
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}


#pragma mark - UITableViewDataSource
 
//- (void)configureCell:(id)cell atIndexPath:(NSIndexPath*)indexPath
//{
//    id object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
// 
//    // Populate cell from the NSManagedObject instance
//}
// 
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellReuseIdentifier = @"CellReuseIdentifier";
//    id cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
//    // Set up the cell
//    [self configureCell:cell atIndexPath:indexPath];
//    return cell;
//}
// 
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return [[[self fetchedResultsController] sections] count];
//}
// 
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    id< NSFetchedResultsSectionInfo> sectionInfo = [[self fetchedResultsController] sections][section];
//    return [sectionInfo numberOfObjects];
//}

#pragma mark - NSFetchedResultsControllerDelegate
/*- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [[self tableView] beginUpdates];
}
- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [[self tableView] insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [[self tableView] deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeMove:
        case NSFetchedResultsChangeUpdate:
            break;
    }
}
- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [[self tableView] insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [[self tableView] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[[self tableView] cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        case NSFetchedResultsChangeMove:
            [[self tableView] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [[self tableView] insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [[self tableView] endUpdates];
}*/

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
//- (void)addItemViewController:(PopoverViewController *)controller didFinishEnteringItem:(NSString *)item  didFinishEnteringItem1:(NSString *)code didFinishEnteringItem2:(int)fieldTag
//{
//    //NSLog(@"This was returned from PopoverViewController %ld", (long)fieldTag);
//    // NSArray *components = [item componentsSeparatedByString:@"\n"];
//    //NSLog(@" popvalues %@", components[0]);
//    
//    
//    id viewObj = [self.view viewWithTag:(long)fieldTag];
//    
//    if([viewObj isKindOfClass:[UITextField class]])
//    {
//        UITextField *textField =(UITextField *)viewObj;
//        textField.text=item;
//        //[dataArray insertObject:code atIndex:fieldTag];
//    }
//    
//    
//    
//}

//
//
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
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"www"]];
//    [webView loadRequest:[NSURLRequest requestWithURL:url]];
//    webView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:webView];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.6 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
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
//        //NSLog(@"array count %ld",(unsigned long)projectsSummaryArray.count);
//        
//        
//        NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
//        
//        //    for (int i=0; i<=projectsSummaryArray.count-1; i++) {
//        //
//        //        projectsSummary = [projectsSummaryArray objectAtIndex:i];
//        //
//        //        NSLog(@"business unit1 %@",projectsSummary.overallStatus);
//        //
//        //        [jsonDictionary setObject:projectsSummary.projectsByOverallStatus forKey:projectsSummary.overallStatus];
//        //
//        //
//        //    }
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
//        //NSString *json = [NSString stringWithFormat:@"On Track:%@,Delayed:%@",projects.onTrackProjects,projects.delayedProjects];
//        
//        //NSLog(@"graph json %@",json);
//        
//        json = [NSString stringWithFormat:@ "loadDashboardChart(%@);",jsonString];
//        
//        NSLog(@"function json %@",json);
//        [self.webView stringByEvaluatingJavaScriptFromString: json];
//    
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in webview code %@ reason %@ " , [exception name], [exception reason]);
//        
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in webview  Code");
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
    
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"sessionid"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userGroup"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastLoginDate"];

    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    return;
}




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


- (void) doDownload {
    
    
    //------validation starts---------
    
    NSLog(@"download clicked");
    
    //[NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    //Download MST_Event data
    dispatch_async(dispatch_get_main_queue(), ^{
        [self buildJSONEvent];
        //[CommonUtils showMessage:@"buildJSONEvent" :self];
        [self buildJSONEventTemplate];
        //[CommonUtils showMessage:@"buildJSONEventTemplate" :self];
        [self buildJSONListMaster];
        //[CommonUtils showMessage:@"buildJSONListMaster" :self];
        [self buildJSONSaveSurveyData];
        //[CommonUtils showMessage:@"buildJSONSaveSurveyData" :self];
        [self buildJSONUsers];
        //[CommonUtils showMessage:@"buildJSONUsers" :self];
        [self buildJSONUserMenu];
        //[CommonUtils showMessage:@"buildJSONUserMenu" :self];
    });
    
    //[self buildJSONEventUser];
    // [self buildJSONInstitute];
    // [self buildJSONEventInstitute];
    
    //[NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
    
    
    
    
    
}
- (void) buildJSONEvent {
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"MST_Event"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchEventsDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONEvent");
                [self parseResponseEvent:dictionary:@"fetchEventsDownload":@"eventWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONEvent  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONEvent Code");
    }
    
    
}


- (void) parseResponseEvent:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *eventDataDownloadArray = [[NSMutableArray alloc] init];
        EventData *eventData=nil;
        

        if([dataDictionary count]>0)
        {
            NSArray *array = [dataDictionary objectForKey:dataFile];
            // Iterate through the array of dictionaries
            for(NSDictionary *dict in array) {
                
                eventData = [[EventData alloc] initWithJSONDictionary:dict];
                
                //NSLog(@" eventData Code %@",eventData.code);
                
                [eventDataDownloadArray addObject:eventData];
            }
            
            //NSLog(@"data count %lu",(unsigned long)eventDataDownloadArray.count);
        }
        NSLog(@"Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_Event"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert");
        
        //---To Insert----
        if([eventDataDownloadArray count]>0)
        {
        
            for (int i=0; i<=eventDataDownloadArray.count-1; i++) {
                
                MST_EventMO *eventMO = (MST_EventMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_Event" inManagedObjectContext:managedObjectContext];
                
                eventData = [eventDataDownloadArray objectAtIndex:i];
                
                eventMO.code=eventData.code;
                eventMO.desc=eventData.desc;
                eventMO.expiryDate1=eventData.expiryDate;
                //eventMO.makerDateTime=eventData.makerDateTime;
                eventMO.makerID=eventData.makerID;
                //eventMO.modifierDateTime=eventData.modifierDateTime;
                eventMO.modifierID=eventData.modifierID;
                eventMO.status=eventData.status;
                eventMO.tableName=eventData.tableName;
                eventMO.userid=eventData.userid;
                eventMO.instituteID=eventData.instituteID;
                eventMO.instituteName=eventData.instituteName;
                eventMO.startDate=eventData.startDate;
                 NSLog(@"Queue eventData.expiryDate  %@",eventData.expiryDate);
                //eventMO.expiryDate=eventData.expiryDate;
                
                
                
                
                NSLog(@"Results in EventMO Save %@",eventMO.desc);
                
            }
        }
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        NSLog(@"Before Fetch Event");
        //---To Fetch----
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MST_Event"];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching Event objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from Event MO  results %@",results);
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        //NSLog(@"Return values from MO desc value %@",eventDataMO.desc);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseEvent code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseEvent Code");
    }
    
}

- (void) buildJSONEventTemplate {
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"EventTemplate"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchEventTemplateDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONEventTemplate");
                [self parseResponseEventTemplate:dictionary:@"fetchEventTemplateDownload":@"eventTemplateWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONEventTemplate  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONEventTemplate Code");
    }
    
    
}


- (void) parseResponseEventTemplate:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *eventTemplateDataArray = [[NSMutableArray alloc] init];
        EventTemplateData *eventTemplateData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            eventTemplateData = [[EventTemplateData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [eventTemplateDataArray addObject:eventTemplateData];
        }
        
        NSLog(@"data count %lu",(unsigned long)eventTemplateDataArray.count);
        
        NSLog(@"Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_EventTemplate"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert");
        
        //---To Insert----
        
        for (int i=0; i<=eventTemplateDataArray.count-1; i++) {
            
            EventTemplateMO *eventTemplateMO = (EventTemplateMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_EventTemplate" inManagedObjectContext:managedObjectContext];
            
            eventTemplateData = [eventTemplateDataArray objectAtIndex:i];
            
            eventTemplateMO.seqNo=eventTemplateData.seqNo;
            eventTemplateMO.eventRefNo=eventTemplateData.eventRefNo;
            eventTemplateMO.eventID=eventTemplateData.eventID;
            eventTemplateMO.labelName=eventTemplateData.labelName;
            eventTemplateMO.component=eventTemplateData.component;
            eventTemplateMO.viewOrder=eventTemplateData.viewOrder;
            eventTemplateMO.mandatory=eventTemplateData.mandatory;
            eventTemplateMO.fieldName=eventTemplateData.fieldName;
            eventTemplateMO.status= eventTemplateData.status;
            eventTemplateMO.listTableName=eventTemplateData.listTableName;
            eventTemplateMO.makerID=eventTemplateData.makerID;
            //eventTemplateMO.makerDateTime=eventTemplateData.makerDateTime;
            eventTemplateMO.modifierID=eventTemplateData.modifierID;
            //eventTemplateMO.modifierDateTime=eventTemplateData.modifierDateTime;
            
            
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseEventTemplate: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch EventTemplate");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"MST_EventTemplate"];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching EventTemplate objects parseResponseEventTemplate: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from EventTemplate MO  results %@",results);
        //EventTemplateMO *eventTemplateDataMO=(EventTemplateMO *)results[0];
        
        //NSLog(@"Return values from MO desc value %@",eventTemplateDataMO.component);
        //NSLog(@"Return values from MO SeqNo value %@",eventTemplateDataMO.seqNo);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseEventTemplate code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseEventTemplate Code");
    }
    
}

- (void) buildJSONListMaster {
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"ListMasterValues"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchListMasterValuesDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONListMaster");
                [self parseResponseListMaster:dictionary:@"fetchListMasterValuesDownload":@"listMasterValuesWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONListMaster  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONListMaster Code");
    }
    
    
}


- (void) parseResponseListMaster:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *listMasterDataArray = [[NSMutableArray alloc] init];
        ListMasterData *listMasterData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            listMasterData = [[ListMasterData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [listMasterDataArray addObject:listMasterData];
        }
        
        NSLog(@"ListMaster data count %lu",(unsigned long)listMasterDataArray.count);
        
        NSLog(@"ListMaster Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_ListMaster"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert List Master");
        
        //---To Insert----
        
        for (int i=0; i<=listMasterDataArray.count-1; i++) {
            
            MST_ListMasterMO *listMasterMO = (MST_ListMasterMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_ListMaster" inManagedObjectContext:managedObjectContext];
            
            listMasterData = [listMasterDataArray objectAtIndex:i];
            
            listMasterMO.code=listMasterData.code;
            listMasterMO.desc=listMasterData.desc;
            listMasterMO.tableName=listMasterData.tableName;
            listMasterMO.sync=listMasterData.sync;
            
            
            
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseEventTemplate: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch ListMaster");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"MST_ListMaster"];
        [request setReturnsObjectsAsFaults:NO];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching ListMaster objects parseResponseListMaster: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from ListMaster MO  results %@",results);
        //MST_ListMasterMO *listMasterDataMO=(MST_ListMasterMO *)results[0];
        
        //NSLog(@"Return values from MO ListMaster desc value %@",listMasterDataMO.tableName);
        //NSLog(@"Return values from MO ListMaster SeqNo value %@",listMasterDataMO.desc);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseListMaster code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseListMaster Code");
    }
    
}


- (void) buildJSONUsers{
    
    
    NSLog(@"Queue buildJSONUsers");
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":@"Users"
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchUsersDownload" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONUsers");
                [self parseResponseUsers:dictionary:@"fetchUsersDownload":@"usersWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONUsers  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONUsers Code");
    }
    
    
}


- (void) parseResponseUsers:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *usersDataArray = [[NSMutableArray alloc] init];
        UsersData *usersData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            usersData = [[UsersData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [usersDataArray addObject:usersData];
        }
        
        NSLog(@"Users data count %lu",(unsigned long)usersDataArray.count);
        
        NSLog(@"Users Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Users"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert Users");
        
        //---To Insert----
        
        for (int i=0; i<=usersDataArray.count-1; i++) {
            
            UsersMO *usersMO = (UsersMO *)[NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:managedObjectContext];
            
            usersData = [usersDataArray objectAtIndex:i];
            
            usersMO.userid=usersData.userid;
            usersMO.password=usersData.password;
            usersMO.name=usersData.name;
            usersMO.status=usersData.status;
            usersMO.lastLoginDate=usersData.lastLoginDate;
            usersMO.userGroup=usersData.userGroup;
            usersMO.sessionid=usersData.sessionid;
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseUsers: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch Users");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"Users"];
        [request setReturnsObjectsAsFaults:NO];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching Users objects parseResponseUsers: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from Users MO  results %@",results);
        //UsersMO *usersMO=(UsersMO *)results[0];
        
        //NSLog(@"Return values from MO UsersMO desc value %@\n%@",usersMO.userid, usersMO.userGroup);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseUsersMO code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseUsersMO Code");
    }
    
}

- (void) buildJSONUserMenu{
    
    
    NSLog(@"Queue buildJSONUserMenu");
    
    
    @try{
        
        //-------
        NSDictionary *jsonDictionary= @{
                                        @"userid":emptyStringIfNil([[NSUserDefaults standardUserDefaults] stringForKey:@"userid"])
                                        
                                        };
        
        //Connect Host Start
        [CommonUtils connectHost :@"fetchUserMenu" :jsonDictionary:self:@"N":nil:@"": ^(NSDictionary *dictionary){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"buildJSONUserMenu");
                [self parseResponseUserMenu:dictionary:@"fetchUserMenu":@"userMenuWrapper"];
                
            });//dispatch end
        }]; //ConnectHost End
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSONUserMenu  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSONUserMenu Code");
    }
    
    
}


- (void) parseResponseUserMenu:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *userMenuDataArray = [[NSMutableArray alloc] init];
        UserMenuData *userMenuData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            userMenuData = [[UserMenuData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [userMenuDataArray addObject:userMenuData];
        }
        
        NSLog(@"UserMenu data count %lu",(unsigned long)userMenuDataArray.count);
        
        NSLog(@"UserMenu Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_UserMenu"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert UserMenu");
        
        //---To Insert----
        
        for (int i=0; i<=userMenuDataArray.count-1; i++) {
            
            MST_UserMenuMO *userMenuMO = (MST_UserMenuMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_UserMenu" inManagedObjectContext:managedObjectContext];
            
            userMenuData = [userMenuDataArray objectAtIndex:i];
            
            userMenuMO.userid=userMenuData.userid;
            userMenuMO.desc=userMenuData.desc;
            userMenuMO.menuID=userMenuData.menuID;
            userMenuMO.assignFlag=userMenuData.assignFlag;
            userMenuMO.menuIDValue=userMenuData.menuIDValue;
           
            
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseUserMenu: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch UserMenu");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"MST_UserMenu"];
        [request setReturnsObjectsAsFaults:NO];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching UserMenu objects parseResponseUserMenu: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from UserMenu MO  results %@",results);
        //MST_UserMenuMO *userMenuMO=(MST_UserMenuMO *)results[0];
        
       // NSLog(@"Return values from MO UserMenuMO desc value %@\n%@",userMenuMO.menuID, userMenuMO.desc);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseUserMenuMO code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseUserMenuMO Code");
    }
    
}



- (void) buildJSONSaveUserAudit {
    
    
    NSDictionary *jsonDictionary;
    
    
    
    
    @try{
        
        
        NSLog(@"Before Fetch buildJSONSaveUserAudit");
        
        //---To Fetch----
        NSLog(@"Login Before Fetch UserAudit");
        //---To Fetch----
        NSFetchRequest *requestUserAudit= [NSFetchRequest fetchRequestWithEntityName:@"UserAudit"];
        [requestUserAudit setReturnsObjectsAsFaults:NO];
        NSError *error = nil;
        NSArray *resultsUserAuditData = [managedObjectContext executeFetchRequest:requestUserAudit error:&error];
        if (!resultsUserAuditData) {
            NSLog(@"Error fetching UserAudit objects parseResponseUserAudit: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        NSLog(@"Return values from UserAudit MO  results %@",resultsUserAuditData);
        
        //UserAuditMO *userAuditMO;
        
        for (int i=0; i<=[resultsUserAuditData count]-1; i++)
        {
            
            //userAuditMO=(SurveyMO *)resultsUserAuditData[i];
            //NSLog(@" userAuditMO   %@\n%@\n%@",surveyMO.eventID,surveyMO.surveyData,surveyMO.sync);
            
            
            //-------
            jsonDictionary= @{
                             // @"userid":surveyMO.eventID,
                             // @"loginDateTime":surveyMO.instituteID,//@"INS002",
                              
                              };
            
           
            
            NSMutableArray *jsonMutableArray=nil;
            
            
            
            //Connect Host Start
            [CommonUtils connectHost :@"insertUserAudit" :jsonDictionary:self:@"N":jsonMutableArray:nil: ^(NSDictionary *dictionary){
                
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    //[self parseResponse:dictionary:@"insertSurveyData":@"surveyWrapper"];
                    
                    //NSLog(@"valid user :%@",users.validUser);
                    
                    
                    
                    
                    
                });//dispatch end
                
                
            }]; //ConnectHost End
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in validate userAudit  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in validate userAudit Code");
    }
    
    
}



- (void) buildJSONSaveSurveyData {
    
    
    NSDictionary *jsonDictionary;
    
    
    
    
    @try{
        
        
        NSLog(@"Before Fetch buildJSONSaveSurveyData");
        
        //---To Fetch----
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Survey"];
        [request setReturnsObjectsAsFaults:NO];
        NSError *error=nil;
        [request setPredicate:[NSPredicate predicateWithFormat:@"sync == %@", @"N"]];
        
        NSArray *resultsSurveyData = [managedObjectContext executeFetchRequest:request error:&error];
        if (!resultsSurveyData) {
            NSLog(@"Error fetching buildJSONSaveSurveyData objects parseResponseEvent: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        NSLog(@"buildJSONSaveSurveyData results %@",resultsSurveyData);
        
        SurveyMO *surveyMO;
        
        if([resultsSurveyData count]>0)
        {
            for (int i=0; i<=[resultsSurveyData count]-1; i++)
            {
                
                surveyMO=(SurveyMO *)resultsSurveyData[i];
                NSLog(@" SaveSurveyData surveyMO   %@\n%@\n%@",surveyMO.eventID,surveyMO.surveyData,surveyMO.sync);
                
                
                
                //NSLog(@"Return values from buildJSONSaveSurveyData desc value %@",surveyMOResults.surveyData);
                
                // NSMutableDictionary *surveyDataDictionary=[[NSMutableDictionary alloc] init];
                //        surveyDataDictionary=[[NSMutableDictionary alloc] init];
                
                //
                //         NSLog(@"Return values from SaveSurveyData surveyDataDictionary  results %@",surveyDataDictionary);
                //-------
                jsonDictionary= @{
                                  @"eventID":surveyMO.eventID,
                                  @"instituteID":surveyMO.instituteID,//@"INS002",
                                  @"surveyData": surveyMO.surveyData, //@"Lee|West Godavari|29/06/2016|MultiText|Ram|Male",
                                  @"sync":surveyMO.sync, //@"N"
                                  @"surveyorID":surveyMO.surveyorID,
                                  @"surveyDateTime":surveyMO.surveyDateTime,
                                  @"eventName":surveyMO.eventName,
                                  @"surveyorName":surveyMO.surveyorName,
                                  @"instituteName":surveyMO.instituteName,
                                
                                  };
                
                
                
                
                //jsonDictionary=[NSDictionary dictionaryWithObject:resultsSurveyData forKey:resultsSurveyData];
                
                //NSString *jsonString = [container JSONRepresentation];
                
                NSMutableArray *jsonMutableArray=nil;
                
                
                
                //Connect Host Start
                [CommonUtils connectHost :@"insertSurveyData" :jsonDictionary:self:@"N":jsonMutableArray:nil: ^(NSDictionary *dictionary){
                    
                    
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //[self parseResponseSurveyData:dictionary:@"insertSurveyData":@"surveyWrapper"];
                        
                        //NSLog(@"valid user :%@",users.validUser);
                        
                        
                        
                        
                        
                    });//dispatch end
                    
                    
                }]; //ConnectHost End
                
            }
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Surveydata  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in validate user Code");
    }
    
    
}

- (void) parseResponseSurveyData:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        // Create a new array to hold the locations
        NSMutableArray *userMenuDataArray = [[NSMutableArray alloc] init];
        UserMenuData *userMenuData=nil;
        
        
        NSArray *array = [dataDictionary objectForKey:dataFile];
        // Iterate through the array of dictionaries
        for(NSDictionary *dict in array) {
            
            userMenuData = [[UserMenuData alloc] initWithJSONDictionary:dict];
            
            //NSLog(@" eventData Code %@",eventData.code);
            
            [userMenuDataArray addObject:userMenuData];
        }
        
        NSLog(@"UserMenu data count %lu",(unsigned long)userMenuDataArray.count);
        
        NSLog(@"UserMenu Before Delete");
        
        //---To Delete----
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MST_UserMenu"];
        NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
        
        NSError *deleteError = nil;
        [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
        
        NSLog(@"Before Insert UserMenu");
        
        //---To Insert----
        
        for (int i=0; i<=userMenuDataArray.count-1; i++) {
            
            MST_UserMenuMO *userMenuMO = (MST_UserMenuMO *)[NSEntityDescription insertNewObjectForEntityForName:@"MST_UserMenu" inManagedObjectContext:managedObjectContext];
            
            userMenuData = [userMenuDataArray objectAtIndex:i];
            
            userMenuMO.userid=userMenuData.userid;
            userMenuMO.desc=userMenuData.desc;
            userMenuMO.menuID=userMenuData.menuID;
            userMenuMO.assignFlag=userMenuData.assignFlag;
            userMenuMO.menuIDValue=userMenuData.menuIDValue;
            
            
            
            //NSLog(@"Results %@",eventMO.desc);
            
        }
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseUserMenu: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        
        NSLog(@"Before Fetch UserMenu");
        //---To Fetch----
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"MST_UserMenu"];
        [request setReturnsObjectsAsFaults:NO];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching UserMenu objects parseResponseUserMenu: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        NSLog(@"Return values from UserMenu MO  results %@",results);
        //MST_UserMenuMO *userMenuMO=(MST_UserMenuMO *)results[0];
        
        // NSLog(@"Return values from MO UserMenuMO desc value %@\n%@",userMenuMO.menuID, userMenuMO.desc);
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseUserMenuMO code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseUserMenuMO Code");
    }
    
}



- (void) deleteSurveyData{
    
    
    NSLog(@"Queue deleteSurveyData");
    
    
    //---To Delete----
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Survey"];
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:fetchRequest];
    
    NSError *deleteError = nil;
    [persistentStoreCoordinator executeRequest:delete withContext:managedObjectContext error:&deleteError];
    
    //----
    
    
}


@end
