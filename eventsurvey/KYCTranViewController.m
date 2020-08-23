//
//  KYCTranViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 23/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "KYCTranViewController.h"
//#import "OnBoardData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "KycData.h"
#import "KYCTran2ViewController.h"
#import "QueueViewController.h"





@interface KYCTranViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblconstraintKycTranX2=0.52f;
CGFloat lblconstraintKycTranY2=1.0f;
CGFloat lblconstraintKycTranWidth2=0.5f;
CGFloat lblconstraintKycTranHeight2=0.8f;

CGFloat constraintKycTranX2=1.19f;
CGFloat constraintKycTranY2=1.0f;
CGFloat constraintKycTranWidth2=0.80f;
CGFloat constraintKycTranHeight2=0.8f;

CGFloat constraintKycTran1X2=0.69f;
CGFloat constraintKycTran1Y2=1.0f;
CGFloat constraintKycTran1Width2=0.3f;
CGFloat constraintKycTran1Height2=0.8f;

//CGFloat lblconstraintKycTran2X2=1.52f;
CGFloat lblconstraintKycTran2X2=1.13f;
CGFloat lblconstraintKycTran2Y2=1.0f;
//CGFloat lblconstraintKycTran2Width2=0.5f;
CGFloat lblconstraintKycTran2Width2=0.22f;
CGFloat lblconstraintKycTran2Height2=0.8f;

CGFloat constraintKycTran2X2=1.69f;
CGFloat constraintKycTran2Y2=1.0f;
CGFloat constraintKycTran2Width2=0.3f;
CGFloat constraintKycTran2Height2=0.8f;




@implementation KYCTranViewController




@synthesize menuName;
//@synthesize sessionid;
@synthesize actionMode;

@synthesize dataDictionary;

//@synthesize popoverCodeValue;


@synthesize popoverData;
@synthesize popoverArray;
@synthesize refNo;

@synthesize kycData;
@synthesize kycArray;


@synthesize dateToolBar;
@synthesize datePicker;


@synthesize webView;
//@synthesize activityIndicator;
//@synthesize lblLoading;

@synthesize timerView;


int hours, minutes, seconds,secondsLeft;


@synthesize recordStatus;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;
@synthesize txtsourceFunAccReg;
@synthesize txtApproxAnnulturnFunExpt;
@synthesize txtTotIncomMonthly;

@synthesize txtNoOfTransInaMonthCash;
@synthesize txtNoOfTransInaMonthCheq;
@synthesize txtTotAmntOfTransAEDCash;
@synthesize txtTotAmntOfTransAEDCheq;
@synthesize txtPurpsOfTransCash;
@synthesize txtPurpsOfTransCheq;

@synthesize txtDepNoOfTransInaMonthCash;
@synthesize txtDepNoOfTransInaMonthCheq;
@synthesize txtDepTotAmntOfTransAEDCash;
@synthesize txtDepTotAmntOfTransAEDCheq;
@synthesize txtDepPurpsOfTransCash;
@synthesize txtDepPurpsOfTransCheq;

@synthesize txtMaxDepositsCash;
@synthesize txtMaxDepositsCheq;
@synthesize txtMaxWithdrawalsCash;
@synthesize txtMaxWithdrawalsCheq;

//@synthesize txtOutNoOfTransInaMonthInternat;
//@synthesize txtOutNoOfTransInaMonthLocal;
//@synthesize txtOutTotAmntOfTransAEDInternat;
//@synthesize txtOutTotAmntOfTransAEDLocal;
//@synthesize txtOutPurpsOfTransInternat;
//@synthesize txtOutPurpsOfTransLocal;
//@synthesize txtInNoOfTransInaMonthInternat;
//@synthesize txtInNoOfTransInaMonthLocal;
//@synthesize txtInTotAmntOfTransAEDInternat;
//@synthesize txtInTotAmntOfTransAEDLocal;
//@synthesize txtInPurpsOfTransInternat;
//@synthesize txtInPurpsOfTransLocal;
//
//@synthesize txtInMaxsingAmtInwardremetns;
//@synthesize txtInMaxsingAmtOutwardremetns;
//@synthesize txtInIntrnlRemitInwardremetns;
//@synthesize txtInIntrnlRemiOutwardremetns;
//
//@synthesize txtEDDDetalsBusines;
//@synthesize txtEDDHowwasProspts;
//@synthesize txtEDDDescrbClntSrc;
//@synthesize txtEDDNonresdnt;
//@synthesize txtEDDPrdtUsgTrnsPrf;
//@synthesize txtEDDDetlsNonresdnt;
//@synthesize txtEDDAruAwreAsptsreltd;
//
//@synthesize txtIConfmmCheckBox;
//@synthesize txtPreparedBy;
//@synthesize txtPreDate;
//@synthesize txtReviewdBy;
//@synthesize txtRevByDate;
//@synthesize txtApprovedBy;
//@synthesize txtAppByDate;


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
    
    //[self.navigationItem setHidesBackButton:NO animated:YES];
    
    
//    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
//    [self.splitViewController.displayModeButtonItem action];
    
    
//      self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"KYC Transaction"];
    self.navigationItem.title=@"KYC Transaction";
    
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
    
    
    
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    
    

    
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
    
    //[self displayGraph];
    
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] ||[actionMode isEqualToString:@"ENQUIRY"] || ([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]))// && [viewMode isEqualToString:@"Y"])
    {
        
        [self viewData];
        
        //viewMode=@"N";
        
        
    }
    
    
    
    
    
    //[self displayHeader];
    
    
     [self displayGraph];
    
    
    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
    
    
    
    
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




- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //    if (textField == self.txtCustomerName) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //
    //    if (textField == self.txtShortName) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //    if (textField == self.txtJointOwn) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //    if (textField == self.txtNationality) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //    if (textField == self.txtDOB) {
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
    
    if (textField.tag == 1) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }

    //--App Annual Funds or Total Income AED
    if (textField.tag == 2 || textField.tag == 3) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //        return newLength <= 20;
        
        
        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
        
        // allow backspace
        if (range.length > 0 && [string length] == 0) {
            return YES;
        }
        // do not allow . at the beggining
        if (range.location == 0 && [string isEqualToString:@"."]) {
            return NO;
        }
        // set the text field value manually
        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
        
        if(newLength > 10)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }
 
    //--Withdrawls Cash and Cheque
    if (textField.tag == 4 || textField.tag == 5 || textField.tag == 6 || textField.tag == 7 || textField.tag == 8 || textField.tag == 9 || textField.tag == 10 || textField.tag == 11 || textField.tag == 12 || textField.tag == 13 || textField.tag == 14 || textField.tag == 15 || textField.tag == 16 || textField.tag == 17 || textField.tag == 18 || textField.tag == 19) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //        return newLength <= 20;
        
        
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
        
        if(newLength > 4)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }
    
    return YES;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }

  
       return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
    
    
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
    
    
    return  14;   //56;//[componentsArray count];
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
    
    
    
    
    if (section == 0) {
        
        
        return @" Transaction Profile";
    }
    
    if (section == 3) {
        
        
        return @" Estimated Activity - Average monthly Basis";
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
    
    popoverData = [popoverArray objectAtIndex:indexPath.section];
    
    
    
    
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
        
        
       if(indexPath.section==0){
            
            CommonLabel *lblsourceFunAccReg  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblsourceFunAccReg.text=@"Source Of Account On A Regular Basis";
            lblsourceFunAccReg.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblsourceFunAccReg];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblsourceFunAccReg attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblsourceFunAccReg attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblsourceFunAccReg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblsourceFunAccReg attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            txtsourceFunAccReg = [[CommonTextField alloc] init];
            txtsourceFunAccReg.tag=1;
            txtsourceFunAccReg.delegate=self;
            txtsourceFunAccReg.placeholder=@"Source Of Account On A Regular Basis";
            txtsourceFunAccReg.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtsourceFunAccReg];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtsourceFunAccReg attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtsourceFunAccReg attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtsourceFunAccReg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtsourceFunAccReg attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        
        else if(indexPath.section==1){
            
            CommonLabel *lblApproxAnnulturnFunExpt  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblApproxAnnulturnFunExpt.text=@"Approx. Annual Turnover i.e. Funds Expected To Be Credited In Next 12 Months In AED";
            lblApproxAnnulturnFunExpt.numberOfLines=2;
            lblApproxAnnulturnFunExpt.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblApproxAnnulturnFunExpt];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblApproxAnnulturnFunExpt attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblApproxAnnulturnFunExpt attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblApproxAnnulturnFunExpt attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblApproxAnnulturnFunExpt attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            txtApproxAnnulturnFunExpt = [[CommonTextField alloc] init];
            txtApproxAnnulturnFunExpt.tag=2;
            txtApproxAnnulturnFunExpt.delegate=self;
            txtApproxAnnulturnFunExpt.placeholder=@"Approx. Annual Turnover i.e. Funds Expected To Be Credited In Next 12 Months In AED";
            txtApproxAnnulturnFunExpt.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtApproxAnnulturnFunExpt];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtApproxAnnulturnFunExpt attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtApproxAnnulturnFunExpt attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtApproxAnnulturnFunExpt attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtApproxAnnulturnFunExpt attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        
        else if(indexPath.section==2){
            
            CommonLabel *lblTotIncomMonthly  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTotIncomMonthly.text=@"Total Income(Monthly) In AED";
            lblTotIncomMonthly.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTotIncomMonthly];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotIncomMonthly attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotIncomMonthly attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotIncomMonthly attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotIncomMonthly attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            txtTotIncomMonthly = [[CommonTextField alloc] init];
            txtTotIncomMonthly.tag=3;
            txtTotIncomMonthly.delegate=self;
            txtTotIncomMonthly.placeholder=@"Total Income(Monthly) In AED";
            txtTotIncomMonthly.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTotIncomMonthly];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotIncomMonthly attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotIncomMonthly attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotIncomMonthly attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotIncomMonthly attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        
        
        else if(indexPath.section==3){
            
            CommonLabel *lblWithdrawls  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblWithdrawls.text=@"Withdrawals";
            lblWithdrawls.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblWithdrawls];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWithdrawls attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWithdrawls attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWithdrawls attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWithdrawls attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            CommonLabel *lblICash   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblICash.text=@"Cash";
            lblICash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblICash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblICash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblICash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblICash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblICash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTran2Height2 constant:0]];
            
            
            
            
            CommonLabel *lblCheque   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCheque.text=@"Cheque";
            lblCheque.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCheque];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCheque attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCheque attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCheque attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCheque attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
            
        }
        
        
        
        
        else if(indexPath.section==4){
            
            CommonLabel *lblNoOfTransInaMonth  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNoOfTransInaMonth.text=@"No. Of Transactions In A Month";
            lblNoOfTransInaMonth.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNoOfTransInaMonth];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfTransInaMonth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfTransInaMonth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfTransInaMonth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfTransInaMonth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            txtNoOfTransInaMonthCash = [[CommonTextField alloc] init];
            txtNoOfTransInaMonthCash.tag=4;
            txtNoOfTransInaMonthCash.delegate=self;
            txtNoOfTransInaMonthCash.placeholder=@"   Cash      ";
            txtNoOfTransInaMonthCash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNoOfTransInaMonthCash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfTransInaMonthCash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:1.13 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfTransInaMonthCash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfTransInaMonthCash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:0.22 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfTransInaMonthCash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
            

            
            
            txtNoOfTransInaMonthCheq = [[CommonTextField alloc] init];
            txtNoOfTransInaMonthCheq.tag=5;
            txtNoOfTransInaMonthCheq.delegate=self;
            txtNoOfTransInaMonthCheq.placeholder=@"  Cheque       ";
            txtNoOfTransInaMonthCheq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNoOfTransInaMonthCheq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfTransInaMonthCheq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfTransInaMonthCheq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfTransInaMonthCheq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfTransInaMonthCheq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==5){
            
            CommonLabel *lblTotAmntOfTransAED  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTotAmntOfTransAED.text=@"Total Amount Of Transactions In AED";
            lblTotAmntOfTransAED.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTotAmntOfTransAED];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotAmntOfTransAED attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotAmntOfTransAED attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotAmntOfTransAED attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotAmntOfTransAED attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            txtTotAmntOfTransAEDCash = [[CommonTextField alloc] init];
            txtTotAmntOfTransAEDCash.tag=6;
            txtTotAmntOfTransAEDCash.delegate=self;
            txtTotAmntOfTransAEDCash.placeholder=@"    Cash     ";
            txtTotAmntOfTransAEDCash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTotAmntOfTransAEDCash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotAmntOfTransAEDCash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotAmntOfTransAEDCash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotAmntOfTransAEDCash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotAmntOfTransAEDCash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTran2Height2 constant:0]];
            
            
            
            
            txtTotAmntOfTransAEDCheq = [[CommonTextField alloc] init];
            txtTotAmntOfTransAEDCheq.tag=7;
            txtTotAmntOfTransAEDCheq.delegate=self;
            txtTotAmntOfTransAEDCheq.placeholder=@"  Cheque      ";
            txtTotAmntOfTransAEDCheq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTotAmntOfTransAEDCheq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotAmntOfTransAEDCheq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotAmntOfTransAEDCheq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotAmntOfTransAEDCheq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotAmntOfTransAEDCheq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==6){
            
            CommonLabel *lblPurpsOfTrans  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPurpsOfTrans.text=@"Purpose Of Transactions";
            lblPurpsOfTrans.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPurpsOfTrans];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurpsOfTrans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurpsOfTrans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurpsOfTrans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurpsOfTrans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            
            txtPurpsOfTransCash = [[CommonTextField alloc] init];
            txtPurpsOfTransCash.tag=8;
            txtPurpsOfTransCash.delegate=self;
            txtPurpsOfTransCash.placeholder=@"  Cash       ";
            txtPurpsOfTransCash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPurpsOfTransCash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurpsOfTransCash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurpsOfTransCash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurpsOfTransCash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurpsOfTransCash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTran2Height2 constant:0]];
            
            
            
            
            txtPurpsOfTransCheq = [[CommonTextField alloc] init];
            txtPurpsOfTransCheq.tag=9;
            txtPurpsOfTransCheq.delegate=self;
            txtPurpsOfTransCheq.placeholder=@"  Cheque       ";
            txtPurpsOfTransCheq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPurpsOfTransCheq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurpsOfTransCheq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurpsOfTransCheq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurpsOfTransCheq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurpsOfTransCheq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==7){
            
            CommonLabel *lblDeposit  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDeposit.text=@"Deposits (Excluding Salary Transfer)";
            lblDeposit.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDeposit];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDeposit attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDeposit attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDeposit attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDeposit attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
        }
        
        
        else if(indexPath.section==8){
            
            CommonLabel *lblDepNoOfTransInaMonth  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDepNoOfTransInaMonth.text=@"No. Of Transactions In A Month";
            lblDepNoOfTransInaMonth.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDepNoOfTransInaMonth];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepNoOfTransInaMonth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepNoOfTransInaMonth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepNoOfTransInaMonth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepNoOfTransInaMonth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            
            
            txtDepNoOfTransInaMonthCash = [[CommonTextField alloc] init];
            txtDepNoOfTransInaMonthCash.tag=10;
            txtDepNoOfTransInaMonthCash.delegate=self;
            txtDepNoOfTransInaMonthCash.placeholder=@"  Cash       ";
            txtDepNoOfTransInaMonthCash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDepNoOfTransInaMonthCash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepNoOfTransInaMonthCash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepNoOfTransInaMonthCash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepNoOfTransInaMonthCash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepNoOfTransInaMonthCash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTran2Height2 constant:0]];
            
            
            
            
            
            txtDepNoOfTransInaMonthCheq = [[CommonTextField alloc] init];
            txtDepNoOfTransInaMonthCheq.tag=11;
            txtDepNoOfTransInaMonthCheq.delegate=self;
            txtDepNoOfTransInaMonthCheq.placeholder=@"  Cheque         ";
            txtDepNoOfTransInaMonthCheq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDepNoOfTransInaMonthCheq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepNoOfTransInaMonthCheq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepNoOfTransInaMonthCheq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepNoOfTransInaMonthCheq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepNoOfTransInaMonthCheq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        
        else if(indexPath.section==9){
            
            CommonLabel *lblDepTotAmntOfTransAED  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDepTotAmntOfTransAED.text=@"Total Amount Of Transaction In AED";
            lblDepTotAmntOfTransAED.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDepTotAmntOfTransAED];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepTotAmntOfTransAED attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepTotAmntOfTransAED attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepTotAmntOfTransAED attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepTotAmntOfTransAED attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            
            
            
            
            txtDepTotAmntOfTransAEDCash = [[CommonTextField alloc] init];
            txtDepTotAmntOfTransAEDCash.tag=12;
            txtDepTotAmntOfTransAEDCash.delegate=self;
            txtDepTotAmntOfTransAEDCash.placeholder=@" Cash        ";
            txtDepTotAmntOfTransAEDCash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDepTotAmntOfTransAEDCash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepTotAmntOfTransAEDCash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepTotAmntOfTransAEDCash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepTotAmntOfTransAEDCash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepTotAmntOfTransAEDCash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTran2Height2 constant:0]];
            
            
            
            
            txtDepTotAmntOfTransAEDCheq = [[CommonTextField alloc] init];
            txtDepTotAmntOfTransAEDCheq.tag=13;
            txtDepTotAmntOfTransAEDCheq.delegate=self;
            txtDepTotAmntOfTransAEDCheq.placeholder=@"  Cheque";
            txtDepTotAmntOfTransAEDCheq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDepTotAmntOfTransAEDCheq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepTotAmntOfTransAEDCheq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepTotAmntOfTransAEDCheq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepTotAmntOfTransAEDCheq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepTotAmntOfTransAEDCheq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        
        else if(indexPath.section==10){
            
            CommonLabel *lblDepPurpsOfTrans  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDepPurpsOfTrans.text=@"Purpose Of Transactions";
            lblDepPurpsOfTrans.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDepPurpsOfTrans];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepPurpsOfTrans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepPurpsOfTrans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepPurpsOfTrans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepPurpsOfTrans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            txtDepPurpsOfTransCash = [[CommonTextField alloc] init];
            txtDepPurpsOfTransCash.tag=14;
            txtDepPurpsOfTransCash.delegate=self;
            txtDepPurpsOfTransCash.placeholder=@"   Cash        ";
            txtDepPurpsOfTransCash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDepPurpsOfTransCash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepPurpsOfTransCash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepPurpsOfTransCash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepPurpsOfTransCash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepPurpsOfTransCash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTran2Height2 constant:0]];
            
            
            txtDepPurpsOfTransCheq = [[CommonTextField alloc] init];
            txtDepPurpsOfTransCheq.tag=15;
            txtDepPurpsOfTransCheq.delegate=self;
            txtDepPurpsOfTransCheq.placeholder=@"    Cheque    ";
            txtDepPurpsOfTransCheq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDepPurpsOfTransCheq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepPurpsOfTransCheq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepPurpsOfTransCheq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepPurpsOfTransCheq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepPurpsOfTransCheq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        
        else if(indexPath.section==11){
            
            CommonLabel *lblMaxSingleAmt  =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMaxSingleAmt.text=@"Maximum Single Amount Of Deposit/Withdrawal";
            lblMaxSingleAmt.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMaxSingleAmt];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxSingleAmt attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxSingleAmt attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxSingleAmt attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxSingleAmt attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
        }
        
        
        else if(indexPath.section==12){
            
            CommonLabel *lblMaxDeposits   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMaxDeposits.text=@"Deposits";
            lblMaxDeposits.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMaxDeposits];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxDeposits attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxDeposits attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxDeposits attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxDeposits attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            txtMaxDepositsCash = [[CommonTextField alloc] init];
            txtMaxDepositsCash.tag=16;
            txtMaxDepositsCash.delegate=self;
            txtMaxDepositsCash.placeholder=@"   Cash        ";
            txtMaxDepositsCash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMaxDepositsCash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxDepositsCash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxDepositsCash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxDepositsCash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxDepositsCash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTran2Height2 constant:0]];
            
            
            txtMaxDepositsCheq = [[CommonTextField alloc] init];
            txtMaxDepositsCheq.tag=17;
            txtMaxDepositsCheq.delegate=self;
            txtMaxDepositsCheq.placeholder=@"  Cheque  ";
            txtMaxDepositsCheq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMaxDepositsCheq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxDepositsCheq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxDepositsCheq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxDepositsCheq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxDepositsCheq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
        
        
        
        else if(indexPath.section==13){
            
            CommonLabel *lblMaxWithdrawals   =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMaxWithdrawals.text=@"Withdrawals";
            lblMaxWithdrawals.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMaxWithdrawals];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxWithdrawals attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTranX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxWithdrawals attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTranY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxWithdrawals attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTranWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaxWithdrawals attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTranHeight2 constant:0]];
            
            
            
            
            txtMaxWithdrawalsCash = [[CommonTextField alloc] init];
            txtMaxWithdrawalsCash.tag=18;
            txtMaxWithdrawalsCash.delegate=self;
            txtMaxWithdrawalsCash.placeholder=@"   Cash        ";
            txtMaxWithdrawalsCash.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMaxWithdrawalsCash];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxWithdrawalsCash attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxWithdrawalsCash attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintKycTran2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxWithdrawalsCash attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxWithdrawalsCash attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintKycTran2Height2 constant:0]];
            
            
            txtMaxWithdrawalsCheq = [[CommonTextField alloc] init];
            txtMaxWithdrawalsCheq.tag=19;
            txtMaxWithdrawalsCheq.delegate=self;
            txtMaxWithdrawalsCheq.placeholder=@"  Cheque  ";
            txtMaxWithdrawalsCheq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMaxWithdrawalsCheq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxWithdrawalsCheq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKycTran2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxWithdrawalsCheq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKycTran2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxWithdrawalsCheq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKycTran2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaxWithdrawalsCheq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKycTran2Height2 constant:0]];
            
            
        }
   
        
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"]) && [kycArray count]>0) //
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
    
//    NSUInteger row = indexPath.section;//row;
//    
//    
//    
//    if (row != NSNotFound)
//    {
//        //onBoardData = [onBoardArray objectAtIndex:indexPath.section];
//        popoverData =[popoverArray objectAtIndex:indexPath.section];
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
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}

- (void) doValidate {
    
    
    
    //------validation starts---------
    
    
    if([CommonUtils checkEmptyString:txtsourceFunAccReg.text]==YES)
    {
        [CommonUtils showMessage:@"Source Of Account can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtApproxAnnulturnFunExpt.text]==YES)
    {
        [CommonUtils showMessage:@"Approx. Annual Turnoveri.e. Funds Expected To Be..... can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtTotIncomMonthly.text]==YES)
    {
        [CommonUtils showMessage:@"Total Income In AED can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNoOfTransInaMonthCash.text]==YES)
    {
        [CommonUtils showMessage:@"No. Of Transactions In A Month Cash can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNoOfTransInaMonthCheq.text]==YES)
    {
        [CommonUtils showMessage:@"No. Of Transactions In A Month Cheque can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtTotAmntOfTransAEDCash.text]==YES)
    {
        [CommonUtils showMessage:@"Total Amount Of Transactions In AED Cash can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtTotAmntOfTransAEDCheq.text]==YES)
    {
        [CommonUtils showMessage:@"Total Amount Of Transactions In AED Cheque can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtPurpsOfTransCash.text]==YES)
    {
        [CommonUtils showMessage:@"Purpose Of Transactions Cash can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPurpsOfTransCheq.text]==YES)
    {
        [CommonUtils showMessage:@"Purpose Of Transactions Cheque can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtDepNoOfTransInaMonthCash.text]==YES)
    {
        [CommonUtils showMessage:@"Deposits No. Of Transactions In A Month Cash can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtDepNoOfTransInaMonthCheq.text]==YES)
    {
        [CommonUtils showMessage:@"Deposits No. Of Transactions In A Month Cheque can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtDepTotAmntOfTransAEDCash.text]==YES)
    {
        [CommonUtils showMessage:@"Deposits Total Amount Of Transactions In AED Cash can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtTotAmntOfTransAEDCheq.text]==YES)
    {
        [CommonUtils showMessage:@"Deposits Total Amount Of Transactions In AED Cheque can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtDepPurpsOfTransCash.text]==YES)
    {
        [CommonUtils showMessage:@"Deposits Purpose Of Transactions Cash can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtDepPurpsOfTransCheq.text]==YES)
    {
        [CommonUtils showMessage:@"Deposits Purpose Of Transactions Cheque can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtMaxDepositsCash.text]==YES)
    {
        [CommonUtils showMessage:@"Maximum Single Amount Of Deposits Cash can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtMaxDepositsCheq.text]==YES)
    {
        [CommonUtils showMessage:@"Maximum Single Amount Of Deposits Cheque can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
//    if([CommonUtils checkEmptyString:txtMaxWithdrawalsCash.text]==YES)
//    {
//        [CommonUtils showMessage:@"Maximum Single Amount Of Withdrawals Cash can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtMaxWithdrawalsCheq.text]==YES)
//    {
//        [CommonUtils showMessage:@"Maximum Single Amount Of Withdrawals Cheque can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//


    
    //actionMode=@"INSERT";
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    [self buildJSON];
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    
    
   
    
    
    NSLog(@"action mode in KYC Transaction %@",actionMode);
    
    
    @try{
        
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //                jsonDictionary= @{@"refNo":self.refNo};
        //            }
        //            else
        //            {
        
        
        NSLog(@"RefNo %@",self.refNo);
        
        
        
        //-------
        jsonDictionary= @{
                          @"refNo":emptyStringIfNil(self.refNo),
                          @"sourceFundAccntReg":emptyStringIfNil(self.txtsourceFunAccReg.text),
                          @"approxAnnualTurnOverExpt":emptyStringIfNil(self.txtApproxAnnulturnFunExpt.text),
                          @"totalIncomeAED":emptyStringIfNil(self.txtTotIncomMonthly.text),
                          @"noOfTransMonthCash":emptyStringIfNil(self.txtNoOfTransInaMonthCash.text),
                          @"noOfTransMonthCheq":emptyStringIfNil(self.txtNoOfTransInaMonthCheq.text),
                          @"totalAmtTransAEDCash":emptyStringIfNil(self.txtTotAmntOfTransAEDCash.text),
                          @"totalAmtTransAEDCheq":emptyStringIfNil(self.txtTotAmntOfTransAEDCheq.text),
                          @"purposeTransCash":emptyStringIfNil(self.txtPurpsOfTransCash.text),
                          @"purposeTransCheq":emptyStringIfNil(self.txtPurpsOfTransCheq.text),
                          @"depNoOfTransMonthCash":emptyStringIfNil(self.txtDepNoOfTransInaMonthCash.text),
                          @"depNoOfTransMonthCheq":emptyStringIfNil(self.txtDepNoOfTransInaMonthCheq.text),
                          @"depTotalAmtTransAEDCash":emptyStringIfNil(self.txtDepTotAmntOfTransAEDCash.text),
                          @"depTotalAmtTransAEDCheq":emptyStringIfNil(self.txtDepTotAmntOfTransAEDCheq.text),
                          @"depPurposeTransCash":emptyStringIfNil(self.txtDepPurpsOfTransCash.text),
                          @"depPurposeTransCheq":emptyStringIfNil(self.txtDepPurpsOfTransCheq.text),
                          @"maxDepositsCash":emptyStringIfNil(self.txtMaxDepositsCash.text),
                          @"maxDepositsCheq":emptyStringIfNil(self.txtMaxDepositsCheq.text),
                          @"maxWithdrawalsCash":emptyStringIfNil(self.txtMaxWithdrawalsCash.text),
                          @"maxWithdrawalsCheq":emptyStringIfNil(self.txtMaxWithdrawalsCheq.text),
                          @"recordStatus":emptyStringIfNil(self.recordStatus)
                          };
        
      
        
        
        
        
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
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //
        //                newData=[CommonUtils connectHost :@"fetchPersonalDetails" :jsonDictionary:self];
        //                [self parseResponse:newData:@"fetchPersonalDetails":@"personalDetailsWrapper"];
        //
        //            }

//        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
//        {
        
            newData=[CommonUtils connectHost :@"updateKYCTransaction" :jsonDictionary:self];
            [self parseResponse:newData:@"updateKYCTransaction":@"kycDetailsWrapper"];
            //viewMode=@"Y";
//        }
        
        self.refNo=kycData.refNo;
        
        NSLog(@"RefNo %@",self.refNo);
        
        //NSLog(@"ViewMode %@",self.viewMode);
        
        //---invoke next screen---
        //if([viewMode isEqualToString:@"N"])
        //{
        NSLog(@"To invoke next screen");
        
        //                   if([actionMode isEqualToString:@"NEW"])
        //                   {
        //                       viewMode=@"N";
        //                   }
        //                   if([actionMode isEqualToString:@"UPDATE"])
        //                   {
        //                       viewMode=@"Y";
        //                   }
        
        
                
        KYCTran2ViewController *kycTran2ViewController = [[KYCTran2ViewController alloc]initWithNibName:nil bundle:nil];
        //kycTran2ViewController.userid=self.userid;
        //kycTran2ViewController.sessionid=self.sessionid;
        kycTran2ViewController.actionMode=self.actionMode;
        kycTran2ViewController.recordStatus=self.recordStatus;
        //identificationViewController.viewMode=self.viewMode;
        kycTran2ViewController.refNo=self.refNo;
        kycTran2ViewController.existingCustomerFlag=self.existingCustomerFlag;
        kycTran2ViewController.menuName=self.menuName;
        
        [self.navigationController pushViewController:kycTran2ViewController animated:YES];
        
        //}
        
        
        
        //----------
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in buildJSON Code");
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}



- (void) viewData {
    
    @try{
        
        
           
            
            [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
            
            //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
            //{
             NSLog(@"RefNo KYC Tran Fetch %@" , self.refNo);
        
            NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
            //}
            
            //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
            //{
            
            NSData *newData=[CommonUtils connectHost :@"fetchKYCTransaction" :jsonDictionary:self];
            [self parseResponse:newData:@"fetchKYCTransaction":@"kycDetailsWrapper"];
        
        
            jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
            newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
            [self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];

            
            //}
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in KYC viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in KYC Transaction viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}

-(void) loadData {
    
    
    @try{
        
        
        kycData = [kycArray objectAtIndex:0];
        
        
        txtsourceFunAccReg.text=emptyStringIfNil(kycData.sourceFundAccntReg);
        txtApproxAnnulturnFunExpt.text=emptyStringIfNil(kycData.approxAnnualTurnOverExpt);
        txtTotIncomMonthly.text=emptyStringIfNil(kycData.totalIncomeAED);
        txtNoOfTransInaMonthCash.text=emptyStringIfNil(kycData.noOfTransMonthCash);
        txtNoOfTransInaMonthCheq.text=emptyStringIfNil(kycData.noOfTransMonthCheq);
        txtTotAmntOfTransAEDCash.text=emptyStringIfNil(kycData.totalAmtTransAEDCash);
        
        txtTotAmntOfTransAEDCheq.text=emptyStringIfNil(kycData.totalAmtTransAEDCheq);
        txtPurpsOfTransCash.text=emptyStringIfNil(kycData.purposeTransCash);
        txtPurpsOfTransCheq.text=emptyStringIfNil(kycData.purposeTransCheq);
        txtDepNoOfTransInaMonthCash.text=emptyStringIfNil(kycData.depNoOfTransMonthCash);
        txtDepNoOfTransInaMonthCheq.text=emptyStringIfNil(kycData.depNoOfTransMonthCheq);
        txtDepTotAmntOfTransAEDCash.text=emptyStringIfNil(kycData.depTotalAmtTransAEDCash);
        txtDepTotAmntOfTransAEDCheq.text=emptyStringIfNil(kycData.depTotalAmtTransAEDCheq);
        txtDepPurpsOfTransCash.text=emptyStringIfNil(kycData.depPurposeTransCash);
        txtDepPurpsOfTransCheq.text=emptyStringIfNil(kycData.depPurposeTransCheq);
        
        
        
        txtMaxDepositsCash.text=emptyStringIfNil(kycData.maxDepositsCash);
        txtMaxDepositsCheq.text=emptyStringIfNil(kycData.maxDepositsCheq);
        txtMaxWithdrawalsCash.text=emptyStringIfNil(kycData.maxWithdrawalsCash);
        txtMaxWithdrawalsCheq.text=emptyStringIfNil(kycData.maxWithdrawalsCheq);
        
        
        
        
        
        
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



- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
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
                kycArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    kycData = [[KycData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [kycArray addObject:kycData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)kycArray.count);
                
                
                
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
