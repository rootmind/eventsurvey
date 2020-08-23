//
//  ViewController.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/1/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
//#import "DashboardViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "CommonUtils.h"
#import "UsersData.h"
//#import "SearchViewController.h"
//#import "KeychainItemWrapper.h"
//#import "PersonalViewController.h"
#import "QueueViewController.h"
//#import "ImageUploadViewController.h"
//#import "KYCViewController.h"
//#import "ImagePageViewController.h"
//#import "EnquiryViewController.h"
//#import "AutoLoansViewController.h"
//#import "PersonalLoanViewController.h"
//#import "RoDViewController.h"
//#import "CreditCardViewController.h"
//#import "SignatureViewController.h"

//#import "PasswordViewController.h"

//#import "NSData+AES.h"
#import "NSData+AESCrypt.h"
#import "NSString+AESCrypt.h"





@interface LoginViewController ()

//@property (strong, nonatomic) KeychainItemWrapper *keychainItem;
//@property (strong, nonatomic) NSString *keychainUserid;
//@property (strong, nonatomic) NSString *keychainPassword;

@end

#pragma mark -

#define IMAGE_WIDTH 320

#define IMAGE_HEIGHT 360



@implementation LoginViewController

@synthesize lblUserid;
@synthesize lblPassword;
@synthesize txtUserid;
@synthesize txtPassword;
@synthesize btnLogin;
//@synthesize lblMessage;

@synthesize scrollView;
@synthesize pageControl;
@synthesize indexNumber;
//@synthesize lblScroll;
//@synthesize  pageControlBeingUsed;
@synthesize pageImage;
//@synthesize returnFlag;

@synthesize userid;
@synthesize userName;
@synthesize sessionid;
@synthesize userGroup;

@synthesize menuId;

//@synthesize dataDictionary;
@synthesize lastLoginDate;
@synthesize deviceToken;
@synthesize newsArray;
@synthesize newsDateArray;
//@synthesize activityIndicator;
//@synthesize lblLoading;
@synthesize usersArray;
@synthesize users;
//@synthesize keychainItem;
//@synthesize keychainUserid;
//@synthesize keychainPassword;

@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;

@synthesize eventDataArray;
@synthesize resultsEvent;


NSUInteger numberOfImages=3;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor controllerBGColor];
    
    NSLog(@"hostServerURL %@",[self ReadSingleTonInstanceVariable:@"hostServerURL"]);
    

    //[self.navigationItem setHidesBackButton:NO animated:YES];
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    [self.splitViewController.displayModeButtonItem action];
    
    
    
    CoreDataController *coreDataController=[CoreDataController sharedCoreDataController];
    
    managedObjectContext = coreDataController.managedObjectContext;
    managedObjectModel=coreDataController.managedObjectModel;
    persistentStoreCoordinator = coreDataController.persistentStoreCoordinator;
    
    
//    UITabBarController *tabBarController=(UITabBarController *)self.splitViewController.viewControllers[0];
//    
//    UIViewController *masterViewController=(UIViewController *)  tabBarController.selectedViewController;
//
//    [masterViewController dismissViewControllerAnimated:YES completion:nil ];
    
    
    NSString *version=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    self.navigationItem.title=[NSString stringWithFormat:@"Login v%@.%@",version,buildVersion];
    
    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
    //    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];//@"Mashreq_logo.png"];
    //    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
    //    companyLogo.clipsToBounds = NO;
    //    companyLogo.layer.masksToBounds=NO;
    //[self.view addSubview:companyLogo];
    
    //self.navigationItem.titleView=companyLogo;
    
    
    
    
    
    [CommonUtils loadActivityIndicator:self];
    
    
    //    keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:@"TechElite" accessGroup:nil];
    //
    //    keychainUserid = [keychainItem objectForKey:(__bridge id)(kSecAttrAccount)];
    //    keychainPassword = [keychainItem objectForKey:(__bridge id)(kSecValueData)];
    
    
    
    lblUserid = [[UILabel alloc] init];
    lblUserid.font = [UIFont systemFontOfSize:23];
    lblUserid.text=@"User id";
    lblUserid.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblUserid.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblUserid];
    
    
    
    lblPassword = [[UILabel alloc] init];
    lblPassword.font = [UIFont systemFontOfSize:23];
    lblPassword.text=@"Password";
    lblPassword.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblPassword];
    
    
    
    
    txtUserid = [[UITextField alloc] init];
    txtUserid.borderStyle = UITextBorderStyleRoundedRect;
    txtUserid.layer.borderWidth=0.5;
    txtUserid.layer.borderColor=[UIColor blackColor].CGColor;
    txtUserid.layer.cornerRadius=5.0;
    txtUserid.font = [UIFont systemFontOfSize:23];
    txtUserid.placeholder = @"Enter userid";
    txtUserid.autocorrectionType = UITextAutocorrectionTypeNo;
    txtUserid.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txtUserid.keyboardType = UIKeyboardTypeDefault;
    txtUserid.returnKeyType = UIReturnKeyDone;
    txtUserid.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtUserid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtUserid.delegate = self;
    txtUserid.text= @"";  //@"";
    
    //    if(keychainUserid!=nil)
    //   {
    //        txtUserid.text=keychainUserid;
    //    }
    txtUserid.delegate=self;
    txtUserid.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtUserid];
    
    txtPassword = [[UITextField alloc] init];
    txtPassword.borderStyle = UITextBorderStyleRoundedRect;
    txtPassword.layer.borderWidth=0.5;
    txtPassword.layer.borderColor=[UIColor blackColor].CGColor;
    txtPassword.layer.cornerRadius=5.0;
    txtPassword.font = [UIFont systemFontOfSize:23];
    txtPassword.placeholder = @"Enter Password";
    txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    txtUserid.autocapitalizationType = UITextAutocapitalizationTypeNone;
    txtPassword.keyboardType = UIKeyboardTypeDefault;
    txtPassword.returnKeyType = UIReturnKeyDone;
    txtPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //txtPassword.delegate = self;
    //    if(keychainUserid!=nil)
    //    {
    //        txtPassword.text=keychainUserid;
    //    }
    [txtPassword setSecureTextEntry:YES];
    txtPassword.delegate=self;
    txtPassword.text=@"";
    txtPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtPassword];
    
    
    
    
    
    btnLogin = [[UIButton alloc ] init];//WithFrame:CGRectMake(120, 200, 60, 30) ];
    [btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    //btnLogin.titleLabel.text=@"Login";
    //[btnLogin setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    //btnLogin.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btnLogin.layer.borderColor=[UIColor grayColor].CGColor;
    btnLogin.layer.borderWidth=0.5f;
    [btnLogin setBackgroundColor:[UIColor strongAzureColor]];
    [btnLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //btnLogin.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    btnLogin.titleLabel.font = [UIFont systemFontOfSize:18];
    btnLogin.layer.cornerRadius=5.0f;
    //btnLogin.layer.masksToBounds=YES;
    //btnLogin.clipsToBounds=YES;
    [btnLogin addTarget:self action:@selector(doValidate) forControlEvents:UIControlEventTouchUpInside];
    btnLogin.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnLogin];
    
    //
    //    lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(40, 240, 300, 20)];
    //    lblMessage.font = [UIFont systemFontOfSize:14];
    //    lblMessage.contentMode=UIControlContentHorizontalAlignmentLeft;
    //    [self.view addSubview:lblMessage];
    
    
    
    //Full screen width
    //20-Jun-2016
    UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/1.5, self.view.frame.size.width/2, self.view.frame.size.width/3.5)];
    //UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/8, self.view.frame.size.height/2, self.view.frame.size.width/1.35, self.view.frame.size.width/2)];
    scr.tag = 1;
    scr.autoresizingMask=UIViewAutoresizingNone;
    //scr.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:scr];
    [self setupScrollView:scr];
    UIPageControl *pgCtr = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 264, self.view.frame.size.width, self.view.frame.size.width/1.5)];
    [pgCtr setTag:12];
    pgCtr.numberOfPages=3;
    pgCtr.autoresizingMask=UIViewAutoresizingNone;
    pgCtr.pageIndicatorTintColor=[UIColor grayColor];
    pgCtr.currentPageIndicatorTintColor=[UIColor strongCeruleanColor]; //20-Jun-2016
    pgCtr.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:pgCtr];
    
    
    
    //------userid
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblUserid attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblUserid attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-200]];
    
    //----
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.50 constant:0]];
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];
    
    //-------password
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.60 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-200]];

    //-------
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];

    
    //-----login button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLogin attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLogin attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.90 constant:0]];
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLogin attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLogin attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLogin attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0]];

    
    //    //-------scroll
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0]];
    //    //------page control
    //
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
    
    
    
    
//    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
//    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    //tableView.frame = CGRectMake(30,200,270,300);
//    tableView.backgroundColor = [UIColor whiteColor];//[UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
//    tableView.layer.borderWidth=1.0f;
//    tableView.layer.borderColor=[UIColor borderBlueColor].CGColor;
//    tableView.layer.cornerRadius=15.0f;
//    //tableView.allowsSelection = NO;
//    tableView.alwaysBounceVertical = NO;
//    tableView.contentInset = UIEdgeInsetsMake(-40, 0, 0, 0);
//    
//    tableView.sectionHeaderHeight = 0.0;
//    tableView.sectionFooterHeight = 0.0;
//    
//    //self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    //    CGRect titleRect = CGRectMake(0, 0, 100, 20);
//    //    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
//    //    tableTitle.textColor = [UIColor captionColor];
//    //    tableTitle.backgroundColor = [tableView backgroundColor];
//    //    tableTitle.opaque = YES;
//    //    tableTitle.font = [UIFont boldSystemFontOfSize:14];
//    //    tableTitle.textAlignment=NSTextAlignmentCenter;
//    //    tableTitle.text = @"";
//    //    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
//    //    tableView.tableHeaderView = tableTitle;
//    
//    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    //[tableView setSeparatorColor:[UIColor whiteColor]];
//    tableView.separatorInset=UIEdgeInsetsZero;
//    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    
//    
//    // add to canvas
//    tableView.translatesAutoresizingMaskIntoConstraints=NO;
//    //[self.view addSubview:tableView];
//    
    
    //    //---header UIView
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.62 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    //
    //    newsDateArray = [[NSMutableArray alloc] init];
    //    newsArray = [[NSMutableArray alloc] init];
    //
    //    [newsDateArray addObject:@"01-Mar-2015"];
    //    [newsDateArray addObject:@"25-Feb-2015"];
    //    [newsDateArray addObject:@"20-Feb-2015"];
    //    [newsDateArray addObject:@"28-Jan-2015"];
    //    [newsDateArray addObject:@"10-Jan-2015"];
    //
    //    [newsArray addObject:@"New product launched"];
    //    [newsArray addObject:@"New Branch opened in Quasis"];
    //    [newsArray addObject:@"New credit card launched"];
    //    [newsArray addObject:@"New branch opened in Burdubai"];
    //    [newsArray addObject:@"New loan product launched"];
    
    
    
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    //
    //    [self loadScrollViewWithPage:0];
    //    [self loadScrollViewWithPage:1];
    
    
    
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0]];
    //------page control
    
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.7 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
    
    
    //20-Jun-2016
     UIImageView *logoImage =[[UIImageView alloc] init];// initWithFrame:CGRectMake(50,50,80,80)];
     logoImage.image=[UIImage imageNamed:@"loginlogo-icon.png"];
     logoImage.contentMode = UIViewContentModeScaleAspectFit;
     logoImage.layer.masksToBounds=YES;
     //[logoImage.layer setBorderColor:[UIColor grayColor].CGColor];
     //[logoImage.layer setBorderWidth:2.0f];
     //[logoImage.layer setCornerRadius:15.0f];
     //[logoImage.layer setShadowColor:[UIColor grayColor].CGColor];
     logoImage.translatesAutoresizingMaskIntoConstraints=NO;
     [self.view addSubview:logoImage];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logoImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.25 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logoImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logoImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:logoImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
    
    
//    //20-Jun-2016
//    UIImageView *rclogoImage =[[UIImageView alloc] init];// initWithFrame:CGRectMake(50,50,80,80)];
//    rclogoImage.image=[UIImage imageNamed:@"khalifa-logo.png"];
//    rclogoImage.contentMode = UIViewContentModeScaleAspectFit;
//    rclogoImage.layer.masksToBounds=YES;
//    //[logoImage.layer setBorderColor:[UIColor grayColor].CGColor];
//    //[logoImage.layer setBorderWidth:2.0f];
//    //[logoImage.layer setCornerRadius:15.0f];
//    //[logoImage.layer setShadowColor:[UIColor grayColor].CGColor];
//    rclogoImage.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:rclogoImage];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rclogoImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.25 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rclogoImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rclogoImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:rclogoImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
//    
    
    
    //20-Jun-2016
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qib-background.png"]];
//    
//    [self.view addSubview:backgroundImage];
  //  [self.view sendSubviewToBack:backgroundImage];
    
    
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.txtUserid) {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == self.txtPassword) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [newsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 25;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    //Region *region = [regions objectAtIndex:section];
    //return [region name];
    
    
    if(section == 0)
    {
        
        
        return nil;
        
    }
    else
        
        //    return @"Credit Card";
        
        return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 0.00f;
    }
    return 10.0f;
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
    
    //    cell.backgroundColor=[UIColor cellBGColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor lightGrayColor];
    //    cell.layer.borderWidth=1.0f;
    //    cell.layer.cornerRadius=15.0f;
    //    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //    cell.layer.borderColor=[UIColor borderColor].CGColor;
    //    cell.layer.shadowRadius=3.0f;
    //    cell.layer.shadowOffset = CGSizeMake(0, 3);
    //    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    //    cell.layer.shadowOpacity = 0.8;
    
    
    
    
    
    //[cell.layer setBorderColor:[UIColor grayColor].CGColor];
    //[cell setTintColor:[UIColor redColor]];
    
    //cell.separatorInset = UIEdgeInsetsMake(0.f, 0.f, 0.f, cell.bounds.size.width);
    
    
    //if (indexPath.row != 0)
    //{
    //        cell.contentView.backgroundColor = [UIColor clearColor];
    //        UIView *whiteRoundedCornerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,cell.frame.size.width,cell.frame.size.height)];
    //        whiteRoundedCornerView.backgroundColor = [UIColor whiteColor];
    //        whiteRoundedCornerView.layer.masksToBounds = NO;
    //        whiteRoundedCornerView.layer.cornerRadius = 3.0;
    //        whiteRoundedCornerView.layer.shadowOffset = CGSizeMake(-1, 1);
    //        whiteRoundedCornerView.layer.shadowOpacity = 0.5;
    //        [cell.contentView addSubview:whiteRoundedCornerView];
    //        [cell.contentView sendSubviewToBack:whiteRoundedCornerView];
    
    //}
    
    
    //    [cell.layer setShadowColor:[UIColor grayColor].CGColor];
    //    [cell.layer setShadowOpacity:0.8f];
    //    [cell.layer setShadowRadius:12.0f];
    //    cell.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
    
    
    //UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    //CALayer *sublayerHeader = [CALayer layer];
    //sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
    //sublayerHeader.shadowOffset = CGSizeMake(0, 3);
    //sublayerHeader.shadowRadius = 10.0;
    //sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
    //sublayerHeader.shadowOpacity = 0.8;
    //sublayerHeader.cornerRadius = 10.0;
    //sublayerHeader.frame = CGRectMake(0, 0, tableView.bounds.size
    //  .width, tableView.bounds.size.height);
    //[shadowView.layer addSublayer:sublayerHeader];
    //[self.view.layer addSublayer:sublayerHeader];
    //[cell.contentView addSubview:shadowView];
    
    //[cell.layer addSublayer:sublayerHeader];
    
    
    
    /*cell.contentView.layer.cornerRadius = 15.0f;
     cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
     cell.contentView.layer.borderWidth = 1.0f;*/
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        //If you'd only like the "i" button, you'd use UITableViewCellAccessoryDetailButton and if you'd only like the "disclosure indicator, you'd use  UITableViewCellAccessoryDisclosureIndicator
        
        //cell.separatorInset=UIEdgeInsetsMake(0,0,0,cell.frame.size.width);
        
        
        //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DetailDisclosureRed.png"]];
        //cell.accessoryView = [UIImageView accessoryImage];
    }
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:10.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
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
    //cell.imageView.image=[[UIImage imageNamed:@"account-sum-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
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
    
    //accounts = [accountsArray objectAtIndex:indexPath.row];
    //accounts = [accountsArray objectAtIndex:indexPath.section];
    
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@  %@",[newsDateArray objectAtIndex:indexPath.row],[newsArray objectAtIndex:indexPath.row]];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[newsArray objectAtIndex:indexPath.row]];
    cell.textLabel.numberOfLines=2;
    cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
    //    NSString *CRDRflag = [[NSString alloc] init];
    //
    //    if([accounts.CRDRflag isEqual:@"CR"])
    //    {
    //        CRDRflag=@"+";
    //    }
    //    else
    //    {
    //        CRDRflag=@"-";
    //    }
    
    //cell.detailTextLabel.text=[NSString stringWithFormat:@"\n%@  %@",accounts.availableBalance,accounts.accountCurrency];
    //cell.detailTextLabel.numberOfLines=0;
    //cell.detailTextLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
    //    cell.textLabel.text =[NSString stringWithFormat:@"%@",accounts.accountDesc];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",accounts.accountNumber,accounts.availableBalance,accounts.accountCurrency];
    
    
    
    
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
    //        accounts = [accountsArray objectAtIndex:indexPath.section];
    //
    //        NSLog(@"selected account %@",accounts.accountNumber);
    //
    //        if([actionMode isEqualToString:@"TRNHISTORY"])
    //        {
    //
    //
    //            AccountTrnViewController *accountTrnViewController = [[AccountTrnViewController alloc]initWithNibName:nil bundle:nil];
    //
    //            //NSLog(@"selected account %@",[self.accountsValueData objectAtIndex:indexPath.row]);
    //
    //            accountTrnViewController.cifNumber=accounts.cifNumber;
    //            accountTrnViewController.accountNumber=accounts.accountNumber;
    //            accountTrnViewController.sessionid=self.sessionid;
    //            accountTrnViewController.userid=self.userid;
    //
    //            [self.navigationController pushViewController:accountTrnViewController animated:YES];
    //
    //        }
    //        else
    //        {
    //
    //            TransferViewController *transferViewController = [[TransferViewController alloc]initWithNibName:nil bundle:nil];
    //            transferViewController.cifNumber=accounts.cifNumber;
    //            transferViewController.accountNumber=accounts.accountNumber;
    //            transferViewController.userid=self.userid;
    //            transferViewController.sessionid=self.sessionid;
    //            [self.navigationController pushViewController:transferViewController animated:YES];
    //        }
    //
    //
    //
    //    }
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}




- (void)setupScrollView:(UIScrollView*)scrMain {
    // we have 10 images here.
    // we will add all images into a scrollView &amp; set the appropriate size.
    
    for (int i=1; i<=3; i++) {
        // create image
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"ipad-banner%d.png",i]];//[NSString stringWithFormat:@"mashreq_banner%d.png",i]];
        // create imageView
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height)];
        // set scale to fill
        imgV.contentMode=UIViewContentModeScaleToFill;
        // set image
        [imgV setImage:image];
        // apply tag to access in future
        imgV.tag=i+1;
        // add to scrollView
        [scrMain addSubview:imgV];
    }
    // set the content size to 10 image width
    [scrMain setContentSize:CGSizeMake(scrMain.frame.size.width*3, scrMain.frame.size.height)];
    // enable timer after each 2 seconds for scrolling.
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
}

- (void)scrollingTimer {
    // access the scroll view with the tag
    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];
    // same way, access pagecontroll access
    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];
    // get the current offset ( which page is being displayed )
    CGFloat contentOffset = scrMain.contentOffset.x;
    // calculate next page to display
    int nextPage = (int)(contentOffset/scrMain.frame.size.width) + 1 ;
    // if page is not 10, display it
    if( nextPage!=3 )  {
        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;
        // else start sliding form 1 :)
    } else {
        [scrMain scrollRectToVisible:CGRectMake(0, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=0;
    }
}




- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

- (void) doValidate {
    
    
    //------validation starts---------
 
    NSLog(@"button clicked");
    
    [self.txtUserid resignFirstResponder];
    [self.txtPassword resignFirstResponder];
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    self.userid=txtUserid.text;
    NSString *password=txtPassword.text;
    self.sessionid=@"";
    
    
    
    //trim spaces
    //userid = [userid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    userid = [CommonUtils removeSpaces:userid];
    password=[CommonUtils removeSpaces:password];
    
    //if ([userid length] <= 0 || userid == nil || [userid  isEqual:@""] == TRUE)
    if([CommonUtils checkEmptyString:userid]==YES)
    {
        
        [CommonUtils showMessage:@"Invalid userid or password":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    else if([CommonUtils checkEmptyString:password]==YES)
    {
        
        [CommonUtils showMessage:@"Invalid userid or password":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    else{
        
        
       
        
        [self buildJSON];
        
       
        
        
    }
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    

    
    
    
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSError *error = nil;

    
    
    //UsersMO *usersMO=(UsersMO *)results[0];
    
    //NSLog(@"Return values from MO UsersMO desc value %@\n%@",usersMO.userid, usersMO.userGroup);
    
    
   
    
    
     //txtPassword.text=@"password";
//     deviceToken=@"deviceToken";
    
    [[NSUserDefaults standardUserDefaults] setObject:self.userid forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] setObject:self.deviceToken forKey:@"deviceToken"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    @try{
        
        
            NSString *password=txtPassword.text;
            password=[CommonUtils removeSpaces:password];
        
        
            //--to encrypt password
           NSString *encryptedPassword= [self passwordEncrypt:password];
        
        

        userid=[self.txtUserid.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSLog(@"Login Before Fetch Users %@",userid);
        //---To Fetch----
        NSFetchRequest *requestUsers= [NSFetchRequest fetchRequestWithEntityName:@"Users"];
        //[requestUsers setReturnsObjectsAsFaults:NO];
        [requestUsers setPredicate:[NSPredicate predicateWithFormat:@"userid == %@ && status == %@", self.userid,@"ACTIVE"]];
        NSArray *resultsUsers = [managedObjectContext executeFetchRequest:requestUsers error:&error];
        if (!resultsUsers) {
            NSLog(@"Error fetching Users objects parseResponseUsers: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        //NSLog(@"Return values from Users MO  results %@",resultsUsers);
        
        if([resultsUsers count]<=0)
        {
        
                //-------
                    jsonDictionary= @{
                                      @"userid":self.txtUserid.text,
                                      @"password":([encryptedPassword length]==0?@"":encryptedPassword),
                                      @"deviceToken":([self.deviceToken length]==0?@"":self.deviceToken),
                                      @"userGroup":@"STAFF"
                                      
                                      };
           
            
                //NSString *jsonString = [container JSONRepresentation];
                
                NSMutableArray *jsonMutableArray=nil;

                //Connect Host Start
                [CommonUtils connectHost :@"validateUser" :jsonDictionary:self:@"N":jsonMutableArray:encryptedPassword: ^(NSDictionary *dictionary){
                    
                    
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self parseResponse:dictionary:@"validateUser":@"usersWrapper"];
                        
                        NSLog(@"valid user :%@",users.validUser);
                        
                        if([users.validUser boolValue] == NO)
                        {
                            [CommonUtils showMessage:@"Invalid userid or password":self];
                            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                            return;
                        }
                
                        NSLog(@"userid userName server %@,%@",users.userid,users.name);
                        
                        userid=users.userid;
                        userName=users.name;
                        lastLoginDate=users.lastLoginDate;
                        sessionid=users.sessionid;
                        userGroup=users.userGroup;
                        

                        [self assignUserMenu];
               
                    });//dispatch end
            
            
                }]; //ConnectHost End
        }
        else{
        
            UsersMO *usersMO=(UsersMO *)resultsUsers[0];
        
        
            if([encryptedPassword isEqualToString:usersMO.password])
            {
            
                userid=usersMO.userid;
                NSLog(@"userid userName %@,%@",usersMO.userid,usersMO.name);
                userName=usersMO.name;
                lastLoginDate=usersMO.lastLoginDate;
                sessionid=usersMO.sessionid;
                userGroup=usersMO.userGroup;

            
                [self assignUserMenu];
            }
            else{
            
                [CommonUtils showMessage:@"Invalid userid or password":self];
            
            }
        
        
        }
        
     
        
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in validate user  code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in validate user Code");
    }
    
    
}

-(void)assignUserMenu{
        
    
        [[NSUserDefaults standardUserDefaults] setObject:userid forKey:@"userid"];
        [[NSUserDefaults standardUserDefaults] setObject:sessionid forKey:@"sessionid"];
        [[NSUserDefaults standardUserDefaults] setObject:userGroup forKey:@"userGroup"];
        [[NSUserDefaults standardUserDefaults] setObject:lastLoginDate forKey:@"lastLoginDate"];
        [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        NSLog(@"userid print :%@",userid);
        NSLog(@"userName print :%@",userName);
        NSLog(@"sessionid print :%@",sessionid);
        NSLog(@"userGroup print :%@",userGroup);
        
        NSLog(@"last login date %@",lastLoginDate);
        
        
        NSLog(@"To invoke search screen %@",menuId);
        
        
        //--save login details in UserAuditMO
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
        
        NSString *currentDateTime = [formatter stringFromDate:[NSDate date]];
        
        UserAuditMO *userAuditMO = (UserAuditMO *)[NSEntityDescription insertNewObjectForEntityForName:@"UserAudit" inManagedObjectContext:managedObjectContext];
        
        userAuditMO.userid=[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"];
        userAuditMO.loginDateTime=currentDateTime;
        
        NSError *error = nil;
        if ([managedObjectContext save:&error] == NO) {
            NSAssert(NO, @"Error saving context parseResponseUserAuditMO: %@\n%@", [error localizedDescription], [error userInfo]);
        }
//
//        
//        NSLog(@"Login Before Fetch UserAudit");
//        //---To Fetch----
//        NSFetchRequest *requestUserAudit= [NSFetchRequest fetchRequestWithEntityName:@"UserAudit"];
//        //[requestUserAudit setReturnsObjectsAsFaults:NO];
//        //NSError *error = nil;
//        NSArray *resultsUserAudit = [managedObjectContext executeFetchRequest:requestUserAudit error:&error];
//        if (!resultsUserAudit) {
//            NSLog(@"Error fetching UserAudit objects parseResponseUserAudit: %@\n%@", [error localizedDescription], [error userInfo]);
//        }
//        
//        NSLog(@"Return values from UserAudit MO  results %@",resultsUserAudit);
    
        
        //-------userMenu------
        
//        NSLog(@"Login Before Fetch UserMenu");
//        //---To Fetch----
//        NSFetchRequest *requestUserMenu= [NSFetchRequest fetchRequestWithEntityName:@"MST_UserMenu"];
//        //NSError *error=nil;
//        //[requestUserMenu setReturnsObjectsAsFaults:NO];
//        [requestUserMenu setPredicate:[NSPredicate predicateWithFormat:@"userid == %@ && menuID == %@", self.userid,@"SURVEY"]];
//        NSArray *resultsUserMenu = [managedObjectContext executeFetchRequest:requestUserMenu error:&error];
//        if (!resultsUserMenu) {
//            NSLog(@"Error fetching UserMenu objects parseResponseUserMenu: %@\n%@", [error localizedDescription], [error userInfo]);
//        }
//        
//        //MST_EventMO *eventDataMO=(MST_EventMO *)resultsUserMenu[0];
//        
//        //NSLog(@"Return values from UserMenu MO  results %@",resultsUserMenu);
//        //MST_UserMenuMO *userMenuMO=(MST_UserMenuMO *)results[0];
//        
//        // NSLog(@"Return values from MO UserMenuMO desc value %@\n%@",userMenuMO.menuID, userMenuMO.desc);
//    
//        if([resultsUserMenu count] >0)
//        {
            QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:queueViewController animated:YES];
//        }
//        else
//        {
//            [CommonUtils showMessage:@"You don't have access rights on Survey" :self];
//        
//        }

        
    }
    
//- (BOOL) validateUser  {
//
//
//    @try {
//
//
//
//        NSLog(@"validate user %@",userid);
//
//
//
//
//        //string for the URL request
//        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/AccountsServlet";
//        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];
//        NSLog(@"Host Server URL %@", myUrlString);
//        //create string for parameters that we need to send in the HTTP POST body
//        //        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&deviceToken=%@&methodAction=validateUser",userid,sessionid,deviceToken];
//        NSString *body =  [NSString stringWithFormat:@"userid=%@&deviceToken=%@&methodAction=validateUser",userid,deviceToken];
//        
//        
//        //create a NSURL object from the string data
//        NSURL *myUrl = [NSURL URLWithString:myUrlString];
//        
//        //create a mutable HTTP request
//        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
//        [urlRequest setHTTPShouldHandleCookies:YES];
//        
//        NSString *bodyLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
//        [urlRequest setValue:bodyLength forHTTPHeaderField:@"Content-Length"];
//        
//        //sets the receiver’s timeout interval, in seconds
//        [urlRequest setTimeoutInterval:30.0f];
//        //sets the receiver’s HTTP request method
//        [urlRequest setHTTPMethod:@"POST"];
//        //sets the request body of the receiver to the specified data.
//        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        
//        //        NSString *post = [NSString stringWithFormat:@"test=Message&this=isNotReal"];
//        //        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        //        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
//        //        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        //        [request setHTTPBody:postData];
//        
//        
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
//        
//        
//        if ([response respondsToSelector:@selector(allHeaderFields)]) {
//            NSDictionary *dictionary = [(NSHTTPURLResponse*)response allHeaderFields];
//            NSLog(@"Cookie Dictionary: %@", [dictionary description]);
//            
//            //            for(NSString *key in [dictionary allKeys]) {
//            //                NSLog(@"Cookie key code: %@",key);
//            //                NSLog(@"Cookie key: %@",[dictionary objectForKey:key]);
//            //
//            //
//            //            }
//            
//            NSString *cookie = [dictionary valueForKey:@"Set-Cookie"];
//            
//            NSLog(@"Cookie : %@",cookie);
//            
//            [[NSUserDefaults standardUserDefaults] setObject:cookie forKey:@"Cookie"];
//            
//        }
//        
//        if ([newData length] >0 && error == nil){
//            //process the JSON response
//            //use the main queue so that we can interact with the screen
//            
//            if([self parseResponse:newData]==YES)
//            {
//                return YES;
//            }
//            else{
//                return NO;
//            }
//            
//            
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//            [CommonUtils showMessage:@"No response from host system":self];
//            return NO;
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//            
//            [CommonUtils showError:error:self:@"validateUser"];
//            return NO;
//            
//        }
//        
//        
//        
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in validate user code %@ reason %@ " , [exception name], [exception reason]);
//        
//         [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in fetch validate user");
//    }
//    
//    
//}


- (void) parseResponse:(NSDictionary *)dataDictionary :(NSString *)methodAction :(NSString *) dataFile {
    
    
    @try {
        
        
        
//        NSLog(@"get validate user %@",userid);
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
                usersArray = [[NSMutableArray alloc] init];
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    
                    
                    
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    
                    
                    users = [[UsersData alloc] initWithJSONDictionary:dict];
                    
                    NSLog(@" users validuser %@",users.validUser);
                    
                    // Add the Location object to the array
                    [usersArray addObject:users];
                    
                    
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)usersArray.count);
                
                
                
                
                
                
//                
//            }
//            else {
//                NSLog(@"Success is invalid...");
//                
//                [CommonUtils showMessage:@"Invalid userid or password":self];
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



-(void)loadView {
    [super loadView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}





//- (void)btnLogin:(id)sender {
//    
//    NSLog(@"button clicked");
//    
//    [self.txtUserid resignFirstResponder];
//    [self.txtPassword resignFirstResponder];
//    
//    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
//    
//    
//    self.userid=txtUserid.text;
//    self.sessionid=@"";
//    
//    //trim spaces
//    //userid = [userid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    
//    userid = [CommonUtils removeSpaces:userid];
//    
//    //if ([userid length] <= 0 || userid == nil || [userid  isEqual:@""] == TRUE)
//    if([CommonUtils checkEmptyString:userid]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Invalid userid or password":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    else{
//        
//        
//        deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
//        
//        NSLog(@"Device Token in login %@",deviceToken);
//        
//        
//        if([self validateUser]==YES)
//        {
//            NSLog(@"validateuser success");
//            
//            
////            DashboardViewController *dashboardViewController = [[DashboardViewController alloc]initWithNibName:nil bundle:nil];
////            dashboardViewController.userid=self.userid;
////            dashboardViewController.sessionid=self.sessionid;
////            dashboardViewController.lastLoginDate=lastLoginDate;
////            [self.navigationController pushViewController:dashboardViewController animated:YES];
//            
//            
//            SearchViewController *searchViewController = [[SearchViewController alloc]initWithNibName:nil bundle:nil];
//            searchViewController.userid=self.userid;
//            searchViewController.sessionid=self.sessionid;
//            searchViewController.lastLoginDate=lastLoginDate;
//            [self.navigationController pushViewController:searchViewController animated:YES];
//            
//            
//            //MainViewController *mainViewController = [[MainViewController alloc]initWithNibName:nil bundle:nil];
//            //mainViewController.lastLoginDate=lastLoginDate;
//            //[self.navigationController pushViewController:mainViewController animated:YES];
//            
//            
//            
//            
//            
//        }
//        //else{
//        
//        //[self showMessage:@"Invalid userid or password"];
//        //[NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        //}
//        
//    }
//    
//    
//    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    
//    
//    
//    
//}


// to deal with self-signed certificates
- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod
            isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod
         isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        //        // we only trust our own domain
        //        if ([challenge.protectionSpace.host isEqualToString:@"192.168.2.8"])
        //        {
        //            NSURLCredential *credential =
        //            [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        //            [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        //        }
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}



//
//-(void) showMessage:(NSString *) msg{
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"message"
//                                            message:msg
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   //[self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//    
//}
//
//-(void) showError:(NSError *) error{
//    
//    //[NSString stringWithFormat:@"%ld,%@",(long)error.code,error.description]
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"error"
//                                            message:error.debugDescription
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   //[self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//    
//    
//}


//-(void) loadActivityIndicator
//{
//    //----activity indicator
//    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    
//    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
//    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
//    activityIndicator.hidden=NO;
//    activityIndicator.color=[UIColor grayColor];
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
//    lblLoading.textColor = [UIColor grayColor];
//    
//    
//    [self.view addSubview:lblLoading];
//    [lblLoading bringSubviewToFront:activityIndicator];
//    [lblLoading addSubview:activityIndicator];
//    
//}


- (NSString *)passwordEncrypt:(NSString *)passwordString
{
    NSLog(@"decryptedString : %@",passwordString);
    
//    NSData *data = [self dataFromHexString:hexString];
//    NSLog(@"Encrypted data : %@",data);
//    NSData *encryptedData =  [NSData dataWithBytes:[data bytes] length:[data length]];
//     NSLog(@"Encrypted encryptedData : %@",encryptedData);
//    
//    NSData *decryptedData = [encryptedData AES128Decrypt];
//    NSLog(@"Encrypted decryptedData : %@",decryptedData);
//
//    
//    NSString *decryptedString = [NSString stringWithUTF8String:[decryptedData bytes]];
//     NSLog(@"Decrypted String : %@",decryptedString);
    
    //NSString *decryptedString = @"saikiran";
    
    //NSString *plainString = @"saikiran";
    NSString *key = @"Sri534260$#%&@^$";//@"AbcDefGhILmnoPQr"; // should be provided by a user
    NSLog( @"Original: %@\n", passwordString );
    NSString *encryptedString = [passwordString AES128EncryptWithKey:key];
    NSLog( @"Encrypted: %@\n", encryptedString );
    NSString *decryptedString = [encryptedString AES128DecryptWithKey:key];
    NSLog( @"Decrypted : %@\n", decryptedString);
    
//    decryptedString = [self addPaddingToString:decryptedString];
//    NSData *decryptedData = [NSData dataWithBytes:[decryptedString UTF8String] length:[[decryptedString dataUsingEncoding:NSUTF8StringEncoding] length]];
//    NSData *encryptedData = [decryptedData AES128Encrypt];
//    NSString *encryptedHexString ;
//    if (encryptedData!=nil)
//    {
//        encryptedHexString = [self hexStringFromData:encryptedData];
//        NSLog(@"Encrypted HexString : %@",encryptedHexString);
//        
//        //        NSData *data1 = [self dataFromHexString:encryptedHexString];
//        //        NSData *encryptedData1 =  [NSData dataWithBytes:[data1 bytes] length:[data1 length]];
//        //        NSData *decryptedData1 = [encryptedData1 AES128Decrypt];
//        //        NSString *decryptedString1 = [NSString stringWithUTF8String:[decryptedData1 bytes]];
//        //        NSLog(@"Decrypted String Testing 123: %@",[decryptedString1 stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]]);
//    }
    //return encryptedHexString;
    
   return encryptedString;
}


// For Converting incoming HexString into NSData
- (NSData *)dataFromHexString:(NSString *)string
{
    //NSMutableData *stringData = [[[NSMutableData alloc] init] autorelease];
    NSMutableData *stringData = [[NSMutableData alloc] init];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [string length] / 2; i++) {
        byte_chars[0] = [string characterAtIndex:i*2];
        byte_chars[1] = [string characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [stringData appendBytes:&whole_byte length:1];
        NSLog(@"dataFromHexString 2 : %@",stringData);
    }
    return stringData;
    
}


// For converting Encrypted Data into NSString after the encryption
- (NSString*)hexStringFromData:(NSData *)data
{
    unichar* hexChars = (unichar*)malloc(sizeof(unichar) * (data.length*2));
    unsigned char* bytes = (unsigned char*)data.bytes;
    for (NSUInteger i = 0; i < data.length; i++) {
        unichar c = bytes[i] / 16;
        if (c < 10) c += '0';
        else c += 'a' - 10;
        hexChars[i*2] = c;
        c = bytes[i] % 16;
        if (c < 10) c += '0';
        else c += 'a' - 10;
        hexChars[i*2+1] = c;
    }
    NSString* retVal = [[NSString alloc] initWithCharactersNoCopy:hexChars
                                                           length:data.length*2
                                                     freeWhenDone:YES];
    //return [retVal autorelease];
    return retVal;
}
// For padding into a string for required string length
-(NSString *)addPaddingToString:(NSString *)string
{
    NSInteger size = 16;
    NSInteger x = [string length]%size;
    NSInteger padLength = size - x;
    for (int i=0; i<padLength; i++)
    {
        string = [string stringByAppendingString:@" "];
    }
    return string;
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



@end
