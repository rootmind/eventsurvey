//
//  FDPortfolioViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 16/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FDPortfolioViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "DashboardData.h"
#import "AccountsData.h"
#import "CommonUtils.h"
#import "DepositsDtlViewController.h"
//#import "AccountTrnViewController.h"
//#import "CCPortfolioViewController.h"


@interface FDPortfolioViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red



@implementation FDPortfolioViewController


@synthesize userid;
@synthesize sessionid;
@synthesize activityIndicator;
@synthesize lastLoginDate;

@synthesize dataDictionary;
//@synthesize dashboardAssetArray;
//@synthesize dashboardAsset;
//@synthesize dashboardLiabilityArray;
//@synthesize dashboardLiability;

@synthesize dashboardArray;
@synthesize dashboardData;

@synthesize spendArray;
@synthesize spendData;



@synthesize dashboardWebView;
@synthesize expensesWebView;


@synthesize cifNumber;
@synthesize accountNumber;
@synthesize accountType;



@synthesize accountsArray;
@synthesize accountsData;


@synthesize  imageArray;
@synthesize  imageData;

@synthesize overlayView;
@synthesize photoButton;
@synthesize selectedImage;

//@synthesize accountName;
//@synthesize accountNumber;
//@synthesize accountCurrency;
//@synthesize accountAvlBalance;
//@synthesize accountCurrentBalance;
//@synthesize accountStatus;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
    self.navigationItem.title=@"Fixed Deposits Portfolio";
    
    
    //[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1];//[UIColor whiteColor];
    //
    //    [self.navigationItem setHidesBackButton:NO animated:YES];
    
    //    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    //    [self.splitViewController.displayModeButtonItem action];
    
    
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
    
    
    //    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    //
    //    self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,50,20)];
    //    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
    //    //companyLogo.contentMode=UIViewContentModeCenter;
    //    companyLogo.contentMode = UIViewContentModeScaleToFill;
    //    companyLogo.clipsToBounds = NO;
    //    companyLogo.layer.masksToBounds=NO;
    //    //[self.view addSubview:companyLogo];
    //    //self.navigationItem.titleView=companyLogo;
    
    
    
    [self doValidate];
    //[self fetchDashboard];
    [self displayHeader];
    [self displayGraph];
    
    
    
    UIView *screenView = [[UIView alloc] init];
    //screenView.layer.borderWidth=1.0;
    //screenView.layer.borderColor=[UIColor blueColor].CGColor;
    screenView.backgroundColor = [UIColor whiteColor];
    screenView.layer.shadowOffset = CGSizeMake(0, 3);
    screenView.layer.shadowRadius = 10.0;
    screenView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    screenView.layer.shadowOpacity = 0.8;
    screenView.layer.cornerRadius = 15.0;
    screenView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:screenView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.30 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.40 constant:0]];
    
    
    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.frame = CGRectMake(30,200,270,300);
    //tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    tableView.backgroundColor = [UIColor lightBlueColor];
    tableView.layer.borderWidth=1.0f;
    tableView.layer.borderColor=[UIColor whiteColor].CGColor;
    tableView.layer.cornerRadius=15.0f;
    //tableView.allowsSelection = NO;
    tableView.alwaysBounceVertical = NO;
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    tableView.sectionHeaderHeight = 0.0;
    tableView.sectionFooterHeight = 0.0;
    
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //    CGRect titleRect = CGRectMake(0, 0, 100, 20);
    //    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    //    tableTitle.textColor = [UIColor captionColor];
    //    tableTitle.backgroundColor = [tableView backgroundColor];
    //    tableTitle.opaque = YES;
    //    tableTitle.font = [UIFont boldSystemFontOfSize:14];
    //    tableTitle.textAlignment=NSTextAlignmentCenter;
    //    tableTitle.text = @"";
    //    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
    //tableView.tableHeaderView = tableTitle;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
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
    
    
    
    //    UIButton *btnCreditCard = [[UIButton alloc] init];
    //    [btnCreditCard setTitle:@"Credit Card" forState:UIControlStateNormal];
    //    [btnCreditCard setTitleColor:[UIColor lightBlueColor] forState:UIControlStateNormal];
    //    [btnCreditCard setImage:[[UIImage imageNamed:@"user.png" ] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    //    btnCreditCard.titleLabel.font = [UIFont systemFontOfSize:20];
    //    btnCreditCard.layer.borderWidth=1.0;
    //    btnCreditCard.layer.borderColor=[UIColor whiteColor].CGColor;
    //    btnCreditCard.backgroundColor = [UIColor whiteColor];
    //    btnCreditCard.layer.shadowOffset = CGSizeMake(0, 3);
    //    btnCreditCard.layer.shadowRadius = 10.0;
    //    btnCreditCard.layer.shadowColor = [UIColor blackColor].CGColor;
    //    btnCreditCard.layer.shadowOpacity = 0.8;
    //    btnCreditCard.layer.cornerRadius = 15.0;
    //    [btnCreditCard addTarget:self action:@selector(viewCreditCard) forControlEvents:UIControlEventTouchUpInside];
    //    btnCreditCard.translatesAutoresizingMaskIntoConstraints=NO;
    //    [self.view addSubview:btnCreditCard];
    //
    //    //---timer UIView
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.7 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.5 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.10 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    
    [CommonUtils loadActivityIndicator:self];
    
    self.capturedImages = [[NSMutableArray alloc] init];
    
    photoButton = [[UIButton alloc ] init];
    [photoButton setTitle:@"" forState:UIControlStateNormal];
    [photoButton setImage:[[UIImage imageNamed:@"empty_person.png" ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [photoButton setBackgroundColor:[UIColor whiteColor]];
    [photoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    photoButton.titleLabel.font = [UIFont systemFontOfSize:18];
    photoButton.layer.cornerRadius=5.0f;
    photoButton.layer.borderWidth=1.0;
    photoButton.layer.borderColor=[UIColor whiteColor].CGColor;
    photoButton.layer.shadowOffset = CGSizeMake(0, 3);
    photoButton.layer.shadowRadius = 10.0;
    photoButton.layer.shadowColor = [UIColor blackColor].CGColor;
    photoButton.layer.shadowOpacity = 0.8;
    photoButton.layer.cornerRadius = 15.0;
    [photoButton addTarget:self action:@selector(showImagePickerOptions:) forControlEvents:UIControlEventTouchUpInside];
    photoButton.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:photoButton];
    
    //-----photoLibraryButton
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:photoButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0]];
    
    
    
    
    NSDictionary *jsonDictionary = @{@"cifNumber":emptyStringIfNil(self.cifNumber),
                                     @"imageFileName":[NSString stringWithFormat:@"%@_person.jpg",self.cifNumber],
                                     @"imageFileFolder":[NSString stringWithFormat:@"/data/appdata/onboard/images/%@",self.cifNumber],
                                     @"imageId":emptyStringIfNil(@"person")
                                     };
    //@"C://onboard//images//%@"
    
    //NSString *jsonString = [container JSONRepresentation];
    NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
    
    //NSData *newData=
    
    [self connectHost :@"fetchImageDetails" :jsonDictionary:self];
    
    
    
    
    
    //    ccPortfolioViewController = [[CCPortfolioViewController alloc]initWithNibName:nil bundle:nil];
    //
    //    ccPortfolioViewController.tabBarItem =[[UITabBarItem alloc] initWithTitle:@"Credit Card"
    //                                                                              image:[UIImage imageNamed:@"user.png"]
    //                                                                                tag:10];
    //
    //
    //    NSMutableArray *tabbarViewControllers = [NSMutableArray arrayWithArray: [self.tabBarController viewControllers]];
    //    [tabbarViewControllers addObject:ccPortfolioViewController];
    //    [tabbarViewControllers addObjectsFromArray:tabbarViewControllers];
    //    [self.tabBarController setViewControllers: tabbarViewControllers ];
    
    
    //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
    
    //    ccPortfolioViewController.cifNumber=searchData.cifNumber;
    //    ccPortfolioViewController.creditCardNumber=searchData.creditCardNumber;
    //    ccPortfolioViewController.accountType=@"SAVINGS";
    
    //
    //    [self.navigationController pushViewController:ccPortfolioViewController animated:YES];
    
    
    
    
    //self.tabBarItem.image=[[UIImage imageNamed:@"user.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    //return [accountName count];
    //return [customerInfo.count count];
    
    return [accountsArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    //Region *region = [regions objectAtIndex:section];
    //return [region.timeZoneWrappers count];
    //    switch (section) {
    //        case 0:
    //            return [dashboardAssetArray count];
    //            break;
    //
    //        default:
    //            return [dashboardLiabilityArray count];
    //            break;
    //    }
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //GFloat result;
    //switch ([indexPath row])
    //{
    //    case 0: {
    //        result = kUIRowHeight;
    //        break; }
    //    case 1: {
    //        result = kUIRowLabelHeight;
    //        break; }
    //}
    return 50;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    //Region *region = [regions objectAtIndex:section];
    //return [region name];
    
    
    //    if(section == 0)
    //    {
    //
    //        return @"   I have";
    //
    //    }
    //    else
    //    {
    //
    //        return @"   I owe";
    //    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //    if(section ==0)
    //    {
    //        return 10.00f;
    //    }
    return 0.0f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    //    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,  tableView.bounds.size.width, 30)];
    //    CGRect titleRect = CGRectMake(0, 0, 100, 20);
    //    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    //    tableTitle.textColor = [UIColor captionColor];
    //    tableTitle.backgroundColor = [tableView backgroundColor];
    //    tableTitle.opaque = YES;
    //    tableTitle.font = [UIFont boldSystemFontOfSize:14];
    //    tableTitle.textAlignment=NSTextAlignmentCenter;
    //    tableTitle.text = @"";
    //    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
    //    //tableView.tableHeaderView = tableTitle;
    //
    //    [headerView addSubview:tableTitle];
    //
    //   if (section == 0)
    //   {
    //
    //        [headerView setBackgroundColor:[UIColor clearColor]];
    //        tableTitle.text = @"I Have";
    //    }
    //    else if (section == 1)
    //    {
    //        [headerView setBackgroundColor:[UIColor clearColor]];
    //        tableTitle.text = @"I Owe";
    //
    //    }
    //    return headerView;
    
    return nil;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor=[UIColor lightBlueColor];
    //    //cell.backgroundColor=[UIColor cellBGColor];
    //    cell.layer.borderWidth=0.1f;
    //    cell.layer.cornerRadius=15.0f;
    //    //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //    cell.layer.borderColor=[UIColor borderColor].CGColor;
    //    cell.layer.shadowRadius=3.0f;
    //    cell.layer.shadowOffset = CGSizeMake(0, 3);
    //    cell.layer.shadowColor = [UIColor whiteColor].CGColor;
    //    cell.layer.shadowOpacity = 0.8;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        //If you'd only like the "i" button, you'd use UITableViewCellAccessoryDetailButton and if you'd only like the "disclosure indicator, you'd use  UITableViewCellAccessoryDisclosureIndicator
        
        //cell.separatorInset=UIEdgeInsetsMake(0,0,0,cell.frame.size.width);
        
        
        //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DetailDisclosureRed.png"]];
        //cell.accessoryView = [UIImageView accessoryImage];
    }
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
    cell.textLabel.font  = myFont;
    //cell.textLabel.textColor=[UIColor blueColor];
    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:14.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
    cell.detailTextLabel.font  = mySecondFont;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.textColor=[UIColor whiteColor];
    
    
    //top shadow
    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
    //CAGradientLayer *topShadow = [CAGradientLayer layer];
    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
    
    //[cell.contentView addSubview:topShadowView];
    
    
    
    //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
    //imv.image=[UIImage imageNamed:@"money-wallet-icon.png"];
    
    
    
    
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
    
    accountsData = [accountsArray objectAtIndex:indexPath.section];
    
    
    NSLog(@"fetchaccounts AccountNo %@", accountsData.accountNumber);
    NSLog(@"fetchaccounts AccountType %@", accountsData.accountType);
    NSLog(@"fetchaccounts AvailableBalance %@", accountsData.availableBalance);
    
    //if(indexPath.section==0)
    //{
    //dashboardAsset = [dashboardAssetArray objectAtIndex:indexPath.row];
    
    //if(dashboardAsset.customerTotalAssets !=nil && dashboardAsset.customerTotalAssets !=(id)[NSNull null])
    //{
    
    // cell.imageView.image=[[UIImage imageNamed:@"assets-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@",accountsData.accountNumber,accountsData.accountType];
    cell.textLabel.numberOfLines=2;
    
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@\n%@",accountsData.availableBalance,accountsData.accountCurrency];
    cell.detailTextLabel.numberOfLines=2;
    
    //cell.textLabel.numberOfLines=3;
    //cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    //}
    //}
    
    //    if(indexPath.section==1)
    //    {
    //        dashboardLiability = [dashboardLiabilityArray objectAtIndex:indexPath.row];
    //
    //        if(dashboardLiability.customerTotalLiability !=nil && dashboardLiability.customerTotalLiability !=(id)[NSNull null])
    //        {
    //            if(indexPath.row==0)
    //            {
    //                cell.imageView.image=[[UIImage imageNamed:@"loan-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //            }
    //            else{
    //                cell.imageView.image=[[UIImage imageNamed:@"credit-cards-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //            }
    //
    //            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",dashboardLiability.customerTotalLiability,dashboardLiability.accountCurrency];
    //            //cell.textLabel.numberOfLines=3;
    //            //cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    //        }
    //    }
    
    
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
    
    //NSUInteger section = indexPath.section;//row;
    
    //    if(indexPath.section==0)
    //    {
    
    [self.activityIndicator startAnimating];
    
    accountsData = [accountsArray objectAtIndex:indexPath.section];
    
   
    DepositsDtlViewController *depositsDtlViewController = [[DepositsDtlViewController alloc]initWithNibName:nil bundle:nil];
    NSLog(@"fetchaccounts AccountNo %@", accountsData.accountNumber);
    
    depositsDtlViewController.cifNumber=accountsData.cifNumber;
    depositsDtlViewController.accountNumber=accountsData.accountNumber;
    
    
   
    
    
    [self.navigationController pushViewController:depositsDtlViewController animated:YES];
    
    [self.activityIndicator stopAnimating];
    
    
    
    
    //      }
    
    
    
    
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}


- (void) doValidate {
    
    
    
    //------validation starts---------
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    
    [self buildJSON];
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
}


- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    
    
    
    NSLog(@"in buildJSON cif number %@",self.cifNumber);
    
    @try{
        
        
        
        
        
        jsonDictionary= @{
                          @"cifNumber":emptyStringIfNil(self.cifNumber),
                          @"accountType":emptyStringIfNil(self.accountType)
                          };
        
                             //@"accountNumber":self.accountNumber,
        
        
        
        
        
        //NSString *jsonString = [container JSONRepresentation];
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
        
        newData=[CommonUtils connectHost :@"fetchDashboard" :jsonDictionary:self];
        [self parseResponse:newData:@"fetchDashboard":@"dashboardWrapper"];
        
        
        //        newData=[CommonUtils connectHost :@"fetchSpendData" :jsonDictionary:self];
        //        [self parseResponseSpendData:newData:@"fetchSpendData":@"spendDataWrapper"];
        
        
        newData=[CommonUtils connectHost :@"fetchDeposits" :jsonDictionary:self];
        [self parseResponseFetchAccounts:newData:@"fetchDeposits":@"accountsWrapper"];
        
        
        
        
        
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    @finally {
        
        NSLog(@"finally in buildJSON Code");
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
//
//         [CommonUtils showMessage:[exception reason] :self];
//
//    }
//    @finally {
//
//        NSLog(@"finally in connectHost onBoardData Code");
//    }
//
//
//
//}









- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            sessionid = [jsonObject objectForKey:@"sessionid"];
            
            NSLog(@"userid print :%@",userid);
            NSLog(@"sessionid print :%@",sessionid);
            
            
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
                
                dashboardArray = [[NSMutableArray alloc] init];
                
                
                
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    
                    
                    dashboardData = [[DashboardData alloc] initWithJSONDictionary:dict];
                    
                    
                    
                    //NSLog(@" searchData %@",searchData.customerName);
                    
                    // Add the Location object to the array
                    
                    [dashboardArray addObject:dashboardData];
                    
                    
                    
                    
                    
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)dashboardArray.count);
                
                
                
                
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
                
                [CommonUtils showMessage:@"Record not found!":self];
                
                
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

- (void) parseResponseSpendData:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            sessionid = [jsonObject objectForKey:@"sessionid"];
            
            NSLog(@"userid print :%@",userid);
            NSLog(@"sessionid print :%@",sessionid);
            
            
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
                
                spendArray = [[NSMutableArray alloc] init];
                
                
                
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    
                    
                    spendData = [[SpendData alloc] initWithJSONDictionary:dict];
                    
                    
                    
                    NSLog(@" spend Data %@",spendData.category);
                    NSLog(@" spend Data %@",spendData.trnAmount);
                    
                    // Add the Location object to the array
                    
                    [spendArray addObject:spendData];
                    
                    
                    
                    
                    
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)spendArray.count);
                
                
                
                
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
                
                [CommonUtils showMessage:@"Record not found!":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponseSpendData"];
            
            
            
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

- (void) parseResponseFetchAccounts:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            sessionid = [jsonObject objectForKey:@"sessionid"];
            
            NSLog(@"userid print :%@",userid);
            NSLog(@"sessionid print :%@",sessionid);
            
            
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
                
                accountsArray = [[NSMutableArray alloc] init];
                
                
                
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    
                    
                    accountsData = [[AccountsData alloc] initWithJSONDictionary:dict];
                    
                    
                    
                    //NSLog(@" searchData %@",searchData.customerName);
                    
                    // Add the Location object to the array
                    
                    [accountsArray addObject:accountsData];
                    
                    
                    
                    
                    
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)accountsArray.count);
                
                
                
                
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
                
                [CommonUtils showMessage:@"Record not found!":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponseFetchAccounts"];
            
            
            
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


//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"BackACSumSegue"])
//    {
//        DashboardViewController *dashboardViewController = [segue destinationViewController];
//        dashboardViewController.sessionid=self.sessionid;
//        dashboardViewController.userid=self.userid;
//    }
//}


//- (void) fetchDashboard  {
//
//
//    @try {
//
//
//
//        NSLog(@"fetch Accounts %@",userid);
//
//
//
//        //        //main thread
//        //        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        //        [self.view addSubview:spinner];
//        //
//        //        //switch to background thread
//        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        //
//        //            //back to the main thread for the UI call
//        //            dispatch_async(dispatch_get_main_queue(), ^{
//        //                [spinner startAnimating];
//        //            });
//
//
//
//        //string for the URL request
//        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/AccountsServlet";
//        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://92.97.103.252:8081";
//        //create string for parameters that we need to send in the HTTP POST body
//        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=fetchDashboard",userid,sessionid];
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
//            [self parseResponse:newData];
//
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//
//            [self displayMessage:error];
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
//        NSLog(@"Exception in fetch Accounts code %@ reason %@ " , [exception name], [exception reason]);
//    }
//    @finally {
//
//        NSLog(@"finally in fetch Accounts Code");
//    }
//
//
//}
//

//- (void) parseResponse:(NSData *) data {
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
//                dataDictionary =[jsonObject objectForKey:@"fetchDashboard"];
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
//                dashboardAssetArray = [[NSMutableArray alloc] init];
//                dashboardLiabilityArray = [[NSMutableArray alloc] init];
//
//                // Get an array of dictionaries with the key "locations"
//                NSArray *array = [dataDictionary objectForKey:@"dashboardWrapper"];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//
//                     dashboardData = [[DashboardData alloc] initWithJSONDictionary:dict];
//
////                    dashboardAsset = [[DashboardData alloc] initWithJSONDictionary:dict];
////                    dashboardLiability = [[DashboardData alloc] initWithJSONDictionary:dict];
//
//                    NSLog(@" accounts %@",dashboardData.customerTotalAssets);
//
//
//                    [dashboardArray addObject:dashboardData];
//
//                }
//
//                 NSLog(@"data count %lu",(unsigned long)dashboardArray.count);
//
////                NSLog(@"data count %lu",(unsigned long)dashboardAssetArray.count);
////                NSLog(@"data count %lu",(unsigned long)dashboardLiabilityArray.count);
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
//                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"accountsWrapper"];
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
//                //                accountStatus= [customerDetailData objectForKey:@"accountStatus"];
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
//                //                accountsKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
//                //                accountsValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
//
//
//                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//
//                //                for (NSString *string in accountsKeyData) {
//                //                    NSLog(@" array key data:%@", string);
//                //                }
//                //
//                //                for (NSString *string in accountsValueData) {
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
//                NSLog(@"Customer Code is Invalid...");
//            }
//
//        }
//
//
//    }
//    @catch (NSException *exception) {
//
//        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
//    }
//    @finally {
//
//        NSLog(@"finally in parseResponse Code");
//    }
//
//}


-(void)loadView {
    [super loadView];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    //[self.activityIndicator setHidesWhenStopped:YES];
}


- (void) parseResponseImage:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"get validate user %@",userid);
        
        
        
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
            
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
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


- (void) parseResponseImageLoad:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"in parseResponseImageLoad");
        
        
        
        //NSString *myData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"JSON data = %@", myData);
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
                
                if([imageData.imageFoundStatus boolValue] == YES)
                {
                    NSString *base64String=[jsonObject objectForKey:@"image"];
                    
                    //NSLog(@"base64String %@", base64String);
                    
                    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
                    //NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
                    //NSLog(@"decodedString %@", decodedString); // foo
                    
                    [self.photoButton setImage:[[UIImage imageWithData:decodedData] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)imageArray.count);
                
                
                if([imageData.imageFoundStatus boolValue] == NO)
                {
                    [CommonUtils showMessage:@"Image couldn't find, please retry again":self];
                    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                }
                
                
                
                
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
        
        NSLog(@"Exception in parseResponseImageLoad code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseImageLoad Code");
    }
    
}


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
//}


//UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
//card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
//card.contentMode=UIViewContentModeCenter;
//[self.view addSubview:card];



//    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
//    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    tableView.frame = CGRectMake(40,300,240,300);
//    tableView.backgroundColor = [UIColor whiteColor];//[UIColor lightGrayColor];
//    tableView.allowsSelection = NO;
//    tableView.alwaysBounceVertical = NO;
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//
//    tableView.sectionHeaderHeight = 0.0;
//    tableView.sectionFooterHeight = 0.0;
//    //
//
//    //
//    //CGRect titleRect = CGRectMake(0, 0, 300, 40);
//    //UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
//    //tableTitle.textColor = [UIColor blackColor];
//    //tableTitle.backgroundColor = [tableView backgroundColor];
//    //tableTitle.opaque = YES;
//    //tableTitle.font = [UIFont boldSystemFontOfSize:12];
//    //tableTitle.textAlignment=NSTextAlignmentCenter;
//    //tableTitle.text = @"Customer Information";
//    //tableView.tableHeaderView = tableTitle;
//    //[self drawRect:titleRect];
//    //
//
//    // important! without this line it does not work!
//    [tableView setBackgroundView:[[UIView alloc] init]];
//    // set plain background color
//    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
//    // remove seperator color
//    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    //[tableView setSeparatorColor:[UIColor blackColor]];
//
//    // add to canvas
//    [self.view addSubview:tableView];
//
//
//
//    accountName=[NSArray arrayWithObjects:@"Current Account",@"Savings Account",@"eSaver Account",nil];
//    accountNumber=[NSArray arrayWithObjects:@"123456789",@"757575757575",@"9947474747",nil];
//    accountCurrency=[NSArray arrayWithObjects:@"AED",@"USD",@"INR",nil];
//    accountAvlBalance=[NSArray arrayWithObjects:@"100,273.56",@"46,576.12",@"5,466.88",nil];
//    accountCurrentBalance=[NSArray arrayWithObjects:@"46,474.67",@"477,575.34",@"585,464.57",nil];
//    accountStatus=[NSArray arrayWithObjects:@"Active",@"Dormant",@"Active",nil];
//







/*- (void)loadView
 {
 UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10.0f, 100.0f, 250.0f, 30.0f) style:UITableViewStylePlain];
 //tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
 tableView.delegate = self;
 tableView.dataSource = self;
 [tableView reloadData];
 //self.view = tableView;
 [self.view addSubview:tableView];
 }*/

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return [accountName count];
//    //return [customerInfo.count count];
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Number of rows is the number of time zones in the region for the specified section.
//    //Region *region = [regions objectAtIndex:section];
//    //return [region.timeZoneWrappers count];
//
//    return [accountName count];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //GFloat result;
//    //switch ([indexPath row])
//    //{
//    //    case 0: {
//    //        result = kUIRowHeight;
//    //        break; }
//    //    case 1: {
//    //        result = kUIRowLabelHeight;
//    //        break; }
//    //}
//    return 50;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    // The header for the section is the region name -- get this from the region at the section index.
//    //Region *region = [regions objectAtIndex:section];
//    //return [region name];
//
//
//    if(section == 0)
//
//        return @"Accounts";
//
//    else
//
//        return @"Credit Card";
//
//    //return nil;
//}
//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    /*if ((indexPath.row % 2) == 1) {
//        cell.backgroundColor = [UIColor grayColor];
//        //cell.textLabel.backgroundColor = [UIColor blackColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//    }
//    else
//    {
//        cell.backgroundColor = [UIColor whiteColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//    }*/
//
//    cell.backgroundColor=[UIColor whiteColor];
//    cell.layer.cornerRadius=10.0f;
//    cell.layer.borderWidth=2.0f;
//    cell.layer.shadowRadius=3.0f;
//
//
//    //UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
//    //CALayer *sublayerHeader = [CALayer layer];
//    //sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
//    //sublayerHeader.shadowOffset = CGSizeMake(0, 3);
//    //sublayerHeader.shadowRadius = 10.0;
//    //sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
//    //sublayerHeader.shadowOpacity = 0.8;
//    //sublayerHeader.cornerRadius = 10.0;
//    //sublayerHeader.frame = CGRectMake(0, 0, tableView.bounds.size
//                                    //  .width, tableView.bounds.size.height);
//    //[shadowView.layer addSublayer:sublayerHeader];
//    //[self.view.layer addSublayer:sublayerHeader];
//    //[cell.contentView addSubview:shadowView];
//
//    //[cell.layer addSublayer:sublayerHeader];
//
//
//
//    /*cell.contentView.layer.cornerRadius = 15.0f;
//    cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
//    cell.contentView.layer.borderWidth = 1.0f;*/
//
//}
//
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 3;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *MyIdentifier = @"MyReuseIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
//        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle=UITableViewCellSelectionStyleNone;
//
//        //If you'd only like the "i" button, you'd use UITableViewCellAccessoryDetailButton and if you'd only like the "disclosure indicator, you'd use  UITableViewCellAccessoryDisclosureIndicator
//    }
//
//
//    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
//
//    UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 14.0 ];
//    cell.textLabel.font  = myFont;
//    UIFont *mySecondFont = [ UIFont fontWithName: @"Arial" size: 10.0 ];
//    cell.detailTextLabel.font  = mySecondFont;
//
//
//    //top shadow
//    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
//    //CAGradientLayer *topShadow = [CAGradientLayer layer];
//    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
//    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
//    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
//
//    //[cell.contentView addSubview:topShadowView];
//
//
//
//
//    NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
//
//
//    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@  %@",[self.accountCurrency objectAtIndex:indexPath.row],[self.accountNumber objectAtIndex:indexPath.row]];
//
//
//
//
//
//    return cell;
//}


- (void) displayHeader{
    
    
    //    if(dashboardArray.count >0)
    //    {
    //
    //        dashboardData = [dashboardArray objectAtIndex:0];
    //
    //
    //    }
    
    
    if(accountsArray.count >0)
    {
        
        accountsData = [accountsArray objectAtIndex:0];
        
        
    }
    
    UIView *headerView = [[UIView alloc] init];
    //headerView.layer.borderWidth=1.0;
    //    headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    //    headerView.layer.shadowRadius=10.0;
    headerView.backgroundColor = [UIColor lightPinkColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor whiteColor];
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
    
    NSLog(@" frame width %lf",headerView.bounds.size.width);
    NSLog(@" frame height %lf",headerView.bounds.size.height);
    
    
    //move the frame position
    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
    //headerView.bounds.origin.y +=  15.0f;
    UILabel *lblAvalBalance = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblAvalBalance = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblAvalBalance.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:50];//[UIFont systemFontOfSize:64.0f];
    lblAvalBalance.textAlignment =  NSTextAlignmentLeft;
    lblAvalBalance.textColor = [UIColor whiteColor];
    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerNumber.layer.borderWidth = 1.0;
    //lblAvalBalance.text=[NSString stringWithFormat:@"%@",dashboardData.totalCASABalance];
    lblAvalBalance.text=[NSString stringWithFormat:@"%@",accountsData.availableBalance];
    lblAvalBalance.translatesAutoresizingMaskIntoConstraints=NO;
    [headerView addSubview:lblAvalBalance];
    
    UILabel *lblCurrency = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCurrency = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCurrency.font = [UIFont fontWithName:@"HelveticaNeue" size:12];//[UIFont systemFontOfSize:64.0f];
    lblCurrency.textAlignment =  NSTextAlignmentLeft;
    lblCurrency.textColor = [UIColor whiteColor];
    //lblCurrency.text=dashboardData.accountCurrency;
    lblCurrency.text=accountsData.accountCurrency;
    lblCurrency.translatesAutoresizingMaskIntoConstraints=NO;
    [headerView addSubview:lblCurrency];
    
    
    UILabel *lblAvalBal = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblAvalBal = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblAvalBal.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    lblAvalBal.textAlignment =  NSTextAlignmentLeft;
    lblAvalBal.textColor = [UIColor whiteColor];
    lblAvalBal.text= @"AVAILABLE BALANCE";
    lblAvalBal.translatesAutoresizingMaskIntoConstraints=NO;
    [headerView addSubview:lblAvalBal];
    
    UIView *lineView = [[UIView alloc] init];//WithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    lineView.translatesAutoresizingMaskIntoConstraints=NO;
    [headerView addSubview:lineView];
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.4 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    
    
    
    //---lblCIFNumber
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblAvalBalance attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblAvalBalance attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    //------currency
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCurrency attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCurrency attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    
    //---------available balance label
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblAvalBal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblAvalBal attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    
    //------line view----//
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.6 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeHeight multiplier:0.02 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.6 constant:0]];
    
}

-(void)displayGraph
{
    
    //-----------assest & liability----//
    dashboardWebView = [[UIWebView alloc] init];//]WithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    dashboardWebView.tag=55;
    dashboardWebView.delegate = self;
    
    
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"board" ofType:@"html" inDirectory:@"www"]];
    [dashboardWebView loadRequest:[NSURLRequest requestWithURL:url]];
    dashboardWebView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:dashboardWebView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0]];
    
    
    
    //    //------------Expenses ----//
    //    expensesWebView = [[UIWebView alloc] init];
    //    expensesWebView.tag=65;
    //    expensesWebView.delegate = self;
    //    url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"expense" ofType:@"html" inDirectory:@"www"]];
    //    [expensesWebView loadRequest:[NSURLRequest requestWithURL:url]];
    //    expensesWebView.translatesAutoresizingMaskIntoConstraints=NO;
    //    [self.view addSubview:expensesWebView];
    //
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:expensesWebView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.6 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:expensesWebView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.5 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:expensesWebView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:expensesWebView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.45 constant:0]];
    
    
    
}




- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    @try{
        
        //    NSUInteger contentHeight = [[dashboardWebView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.body.scrollHeight;"]] intValue];
        //
        //    CGRect frame = dashboardWebView.frame;
        //    frame.size.height = contentHeight;
        //    dashboardWebView.frame = frame;
        //    [self.dashboardWebView setOpaque:FALSE];
        //    [self.dashboardWebView setUserInteractionEnabled:TRUE];
        //    self.dashboardWebView.scrollView.scrollEnabled = NO;
        //    self.dashboardWebView.scrollView.bounces = NO;
        //    self.dashboardWebView.scalesPageToFit=YES;
        //    self.dashboardWebView.contentMode = UIViewContentModeRedraw;
        //    [dashboardWebView sizeToFit];
        
        
        
        
        
        
        
        //---------------assets & liabilities-----//
        //dashboardData = [dashboardArray objectAtIndex:0];
        
        
        
        //        NSString *assets = [[NSString stringWithFormat:@"%@",([dashboardData.customerTotalAssets length]==0?0:dashboardData.customerTotalAssets)] stringByReplacingOccurrencesOfString:@"," withString:@""];
        //
        //
        //
        //        NSString *liabilities = [[NSString stringWithFormat:@"%@",  ([dashboardData.customerTotalLiability length]==0?0:dashboardData.customerTotalLiability)] stringByReplacingOccurrencesOfString:@"," withString:@""];
        //
        //
        //         NSLog(@"customerTotalAssets %@",dashboardData.customerTotalAssets);
        //         NSLog(@"customerTotalLiability %@",dashboardData.customerTotalLiability);
        //
        //        if(assets==nil || assets==(id)[NSNull null])
        //        {
        //            assets=@"0";
        //        }
        
        
        
        //NSDictionary *jsonDictionary;
        
        NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
        
        for (int i=0; i<=accountsArray.count-1; i++) {
            
            accountsData = [accountsArray objectAtIndex:i];
            
            NSLog(@"category %@",accountsData.accountNumber);
            
            [jsonDictionary setObject:[NSString stringWithFormat:@"%@",accountsData.availableBalance] forKey:accountsData.accountNumber];
            
            
        }
        
        //
        //        jsonDictionary= @{[NSString stringWithFormat:@"Assets %@",dashboardData.accountCurrency] :([assets length]==0?0:assets),
        //                          [NSString stringWithFormat:@"Liabilities %@",dashboardData.accountCurrency] :  ([liabilities length]==0?0:liabilities)
        //                          };
        
        
        
        
        
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
        
        
        
        NSString* json = [NSString stringWithFormat:@ "loadSummaryChart(%@);",jsonString];
        
        NSLog(@"function json %@",json);
        
        [dashboardWebView stringByEvaluatingJavaScriptFromString: json];
        
        
        //-------------Expenses---------//
        
        
        
        
        //
        //        NSMutableDictionary *jsonMultiDictionary = [[NSMutableDictionary alloc]init];
        //
        //        for (int i=0; i<=spendArray.count-1; i++) {
        //
        //            spendData = [spendArray objectAtIndex:i];
        //
        //            NSLog(@"Expenses category  %@",spendData.category);
        //
        //            [jsonMultiDictionary setObject:spendData.trnAmount forKey:spendData.category];
        //
        //
        //        }
        //
        
        
        
        //        jsonData = [NSJSONSerialization dataWithJSONObject:jsonMultiDictionary
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
        //        json = [NSString stringWithFormat:@ "loadExpensesChart(%@);",jsonString];
        //
        //        NSLog(@"function json %@",json);
        //        [expensesWebView stringByEvaluatingJavaScriptFromString: json];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in webViewDidFinishLoad code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
        
    }
    @finally {
        
        NSLog(@"finally in webViewDidFinishLoad Code");
    }
    
    
    
}



//-(void)displayGraph
//{
//    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
////    WKUserContentController *controller = [[WKUserContentController alloc]
////                                           init];
////
////    [controller addScriptMessageHandler:self name:@"observe"];
////    configuration.userContentController = controller;
//
//    dashboardWebView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
//    //dashboardWebView.tag=55;
//    dashboardWebView.navigationDelegate = self;
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"board" ofType:@"html" inDirectory:@"www"]];
//    [dashboardWebView loadRequest:[NSURLRequest requestWithURL:url]];
//    dashboardWebView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:dashboardWebView];
//
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.60 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.40 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0]];
//
//
//    dashboardAsset = [dashboardAssetArray objectAtIndex:0];
//
//    dashboardLiability = [dashboardLiabilityArray objectAtIndex:0];
//
//
//
//    //    NSString *assets = [dashboardAsset.customerTotalAssets stringByReplacingOccurrencesOfString:@"," withString:@""];
//    //    NSString *liabilities = [dashboardLiability.customerTotalLiability stringByReplacingOccurrencesOfString:@"," withString:@""];
//
//    NSString *assets = [@"100000" stringByReplacingOccurrencesOfString:@"," withString:@""];
//    NSString *liabilities = [@"348484" stringByReplacingOccurrencesOfString:@"," withString:@""];
//
//
//
//    NSDictionary *jsonDictionary;
//
//    //    jsonDictionary= @{[NSString stringWithFormat:@"Assets %@",dashboardAsset.accountCurrency] : assets,
//    //                      [NSString stringWithFormat:@"Liabilities %@",dashboardLiability.accountCurrency] : liabilities
//    //                      };
//
//    jsonDictionary= @{[NSString stringWithFormat:@"Assets %@",@"AED"] : assets,
//                      [NSString stringWithFormat:@"Liabilities %@",@"USD"] : liabilities
//                      };
//
//
//    NSError *errorOut;
//    NSString *jsonString;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&errorOut];
//
//    if (! jsonData) {
//        NSLog(@"Got an error in json creation chart: %@", errorOut);
//    } else {
//        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//
//    NSLog(@"jsondata %@",jsonString);
//
//    //NSString *json = [NSString stringWithFormat:@"On Track:%@,Delayed:%@",projects.onTrackProjects,projects.delayedProjects];
//
//    //NSLog(@"graph json %@",json);
//
//    NSString* json = [NSString stringWithFormat:@ "loadSummaryChart(%@);",jsonString];
//
//    NSLog(@"function json %@",json);
//
//
//    [dashboardWebView evaluateJavaScript:json completionHandler:nil];
//
//
//
//}


//- (void)userContentController:(WKUserContentController *)userContentController
//      didReceiveScriptMessage:(WKScriptMessage *)message{
//
//    NSDictionary *sentData = (NSDictionary*)message.body;
//
//    // Log out the message received
//    NSLog(@"Received event %@", message.body);
//
//    long aCount = [sentData[@"count"] integerValue];
//    aCount++;
//
//    dashboardAsset = [dashboardAssetArray objectAtIndex:0];
//
//    dashboardLiability = [dashboardLiabilityArray objectAtIndex:0];
//
//
//
//    //    NSString *assets = [dashboardAsset.customerTotalAssets stringByReplacingOccurrencesOfString:@"," withString:@""];
//    //    NSString *liabilities = [dashboardLiability.customerTotalLiability stringByReplacingOccurrencesOfString:@"," withString:@""];
//
//    NSString *assets = [@"100000" stringByReplacingOccurrencesOfString:@"," withString:@""];
//    NSString *liabilities = [@"348484" stringByReplacingOccurrencesOfString:@"," withString:@""];
//
//
//
//    NSDictionary *jsonDictionary;
//
//    //    jsonDictionary= @{[NSString stringWithFormat:@"Assets %@",dashboardAsset.accountCurrency] : assets,
//    //                      [NSString stringWithFormat:@"Liabilities %@",dashboardLiability.accountCurrency] : liabilities
//    //                      };
//
//    jsonDictionary= @{[NSString stringWithFormat:@"Assets %@",@"AED"] : assets,
//                      [NSString stringWithFormat:@"Liabilities %@",@"USD"] : liabilities
//                      };
//
//
//    NSError *errorOut;
//    NSString *jsonString;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&errorOut];
//
//    if (! jsonData) {
//        NSLog(@"Got an error in json creation chart: %@", errorOut);
//    } else {
//        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//
//    NSLog(@"jsondata %@",jsonString);
//
//    //NSString *json = [NSString stringWithFormat:@"On Track:%@,Delayed:%@",projects.onTrackProjects,projects.delayedProjects];
//
//    //NSLog(@"graph json %@",json);
//
//    NSString* json = [NSString stringWithFormat:@ "loadSummaryChart(%@);",jsonString];
//
//    NSLog(@"function json %@",json);
//
//
//    [dashboardWebView evaluateJavaScript:json completionHandler:nil];
//}

//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//
//
//    dashboardAsset = [dashboardAssetArray objectAtIndex:0];
//
//    dashboardLiability = [dashboardLiabilityArray objectAtIndex:0];
//
//
//
//    //    NSString *assets = [dashboardAsset.customerTotalAssets stringByReplacingOccurrencesOfString:@"," withString:@""];
//    //    NSString *liabilities = [dashboardLiability.customerTotalLiability stringByReplacingOccurrencesOfString:@"," withString:@""];
//
//    NSString *assets = [@"100000" stringByReplacingOccurrencesOfString:@"," withString:@""];
//    NSString *liabilities = [@"348484" stringByReplacingOccurrencesOfString:@"," withString:@""];
//
//
//
//    NSDictionary *jsonDictionary;
//
//    //    jsonDictionary= @{[NSString stringWithFormat:@"Assets %@",dashboardAsset.accountCurrency] : assets,
//    //                      [NSString stringWithFormat:@"Liabilities %@",dashboardLiability.accountCurrency] : liabilities
//    //                      };
//
//    jsonDictionary= @{[NSString stringWithFormat:@"Assets %@",@"AED"] : assets,
//                      [NSString stringWithFormat:@"Liabilities %@",@"USD"] : liabilities
//                      };
//
//
//    NSError *errorOut;
//    NSString *jsonString;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&errorOut];
//
//    if (! jsonData) {
//        NSLog(@"Got an error in json creation chart: %@", errorOut);
//    } else {
//        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//
//    NSLog(@"jsondata %@",jsonString);
//
//    //NSString *json = [NSString stringWithFormat:@"On Track:%@,Delayed:%@",projects.onTrackProjects,projects.delayedProjects];
//
//    //NSLog(@"graph json %@",json);
//
//    NSString* json = [NSString stringWithFormat:@ "loadSummaryChart(%@);",jsonString];
//
//    NSLog(@"function json %@",json);
//    [dashboardWebView stringByEvaluatingJavaScriptFromString: json];
//}





-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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

//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//
//    ccPortfolioViewController.cifNumber=spendData.cifNumber;
//    ccPortfolioViewController.creditCardNumber=spendData.creditCardNumber;
//    ccPortfolioViewController.accountType=@"SAVINGS";
//
//}
//
//-(void) viewWillDisappear:(BOOL)animated {
//
//    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
//        // Navigation button was pressed. Do some stuff
//
//        NSMutableArray *tabbarViewControllers = [NSMutableArray arrayWithArray: [self.tabBarController viewControllers]];
//        [tabbarViewControllers removeObjectAtIndex:1];
//        [self.tabBarController setViewControllers: tabbarViewControllers ];
//
//        //[self.navigationController popViewControllerAnimated:NO];
//    }
//    [super viewWillDisappear:animated];
//}


//-(void)viewCreditCard
//{
//    
//    CCPortfolioViewController *ccPortfolioViewController = [[CCPortfolioViewController alloc]initWithNibName:nil bundle:nil];
//    
//    //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
//    
//    ccPortfolioViewController.cifNumber=self.cifNumber;
//    ccPortfolioViewController.accountNumber=self.accountNumber;
//    //ccPortfolioViewController.creditCardNumber=self.creditCardNumber;
//    
//    [self.navigationController pushViewController:ccPortfolioViewController animated:YES];
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

- (void)showImagePickerForCamera
{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])  {
        
        [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else{
        
        [CommonUtils showMessage:@"Camera is not supported" :self];
        
    }
}


- (void)showImagePickerForPhotoPicker
{
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
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
    
    //    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    //    {
    //        self.imagePickerController.hidesBottomBarWhenPushed=YES;
    //    }
    
    UIImagePickerController *imagePickerController1 = [[UIImagePickerController alloc] init];
    imagePickerController1.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController1.sourceType = sourceType;
    imagePickerController1.delegate = self;
    
    
    
    if (sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        imagePickerController1.showsCameraControls=YES;
    }
    //        /*
    //         The user wants to use the camera interface. Set up our custom overlay view for the camera.
    //         */
    //        imagePickerController1.showsCameraControls = YES;
    //
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
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:overlayView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:overlayView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    //
    //        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:overlayView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    //
    //
    //        //self.overlayView.frame = imagePickerController1.cameraOverlayView.frame;
    //        //imagePickerController1.cameraOverlayView = self.overlayView;
    //        //self.overlayView = nil;
    ////
    ////
    ////    }
    ////
    self.imagePickerController = imagePickerController1;
    self.imagePickerController.hidesBottomBarWhenPushed=YES;
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController.tabBarController presentViewController:self.imagePickerController animated:YES completion:nil];
    
    
}


//#pragma mark - Toolbar actions
//
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


//- (IBAction)delayedTakePhoto:(id)sender
//{
//    // These controls can't be used until the photo has been taken
////    self.photoButton.enabled = NO;
////    self.takePictureButton.enabled = NO;
////    self.delayedPhotoButton.enabled = NO;
////    self.startStopButton.enabled = NO;
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
////    [startStopButton addTarget:self action:@selector(stopTakingPicturesAtIntervals:) forControlEvents:UIControlEventTouchUpInside];
////
////    self.doneButton.enabled = NO;
////    self.delayedPhotoButton.enabled = NO;
////    self.takePictureButton.enabled = NO;
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
            
            
            
            
            //----check image is selected or not
            CGImageRef cgref = [self.selectedImage CGImage];
            CIImage *cim = [self.selectedImage CIImage];
            
            if (cim == nil && cgref == NULL)
            {
                [CommonUtils showMessage:@"Please select image to upload" :self];
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
                                           
                                           //---------------
                                           NSString *targetFileName=[NSString stringWithFormat:@"%@_%@",self.cifNumber,@"person"];
                                           
                                           NSDictionary *jsonDictionary = @{@"refNo":emptyStringIfNil(self.cifNumber),
                                                                            @"cifNumber":emptyStringIfNil(self.cifNumber)
                                                                            };
                                           
                                           
                                           //NSString *jsonString = [container JSONRepresentation];
                                           NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
                                           
                                           
                                           
                                           NSData *newData=[CommonUtils connectHostImage :@"uploadImageDetails" :jsonDictionary:self:selectedImage:targetFileName:self.cifNumber];
                                           [self parseResponseImage:newData:@"uploadImageDetails":@"imageDetailsWrapper"];
                                           
                                           if([imageData.imageUploadStatus boolValue] == NO)
                                           {
                                               [CommonUtils showMessage:@"Image couldn't upload, please retry again":self];
                                               [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                               //return;
                                           }
                                           else
                                           {
                                               
                                               [CommonUtils showMessage:@"Image uploaded successfully":self];
                                               [self.photoButton setImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
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
            
            
            NSLog(@"button image update");
            
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
    
    
}


#pragma mark - Timer

// Called by the timer to take a picture.
- (void)timedPhotoFire:(NSTimer *)timer
{
    [self.imagePickerController takePicture];
}


#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.capturedImages addObject:image];
    
    if ([self.cameraTimer isValid])
    {
        return;
    }
    
    [self finishAndUpdate];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)showImagePickerOptions:(UIButton *)sender
{
    
    UIAlertController * alertController=   [UIAlertController
                                            alertControllerWithTitle:@""
                                            message:@""
                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cameraAction = [UIAlertAction
                                   actionWithTitle:@"Take Photo"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       [self showImagePickerForCamera];
                                       
                                   }];
    
    UIAlertAction* photoLibraryAction = [UIAlertAction
                                         actionWithTitle:@"Choose Photo"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * action)
                                         {
                                             [self showImagePickerForPhotoPicker];
                                         }];
    
    UIAlertAction* cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
                                   }];
    
    [alertController addAction:cameraAction];
    [alertController addAction:photoLibraryAction];
    [alertController addAction:cancelAction];
    
    
    // Present the view controller using the popover style.
    alertController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:alertController animated: YES completion: nil];
    
    
    // Get the popover presentation controller and configure it.
    UIPopoverPresentationController *presentationController =[alertController popoverPresentationController];
    presentationController.permittedArrowDirections =UIPopoverArrowDirectionAny;
    presentationController.sourceView = self.view;
    presentationController.sourceRect =  CGRectMake(sender.frame.origin.x, sender.frame.origin.y, 1.0, 1.0);
    
    
    
    
    //alertController.popoverPresentationController.sourceView=self.view;
    //alertController.popoverPresentationController.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0);
    //[self presentViewController:alertController animated:YES completion:nil];
    
}


- (void) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller
{
    
    
    
    @try {
        
        NSDictionary *jsonDictionaryProfile;
        
        
        NSLog(@"connectHost userid %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"]);
        NSLog(@"sessionid %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"]);
        NSLog(@"deviceToken %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"]);
        
        
        jsonDictionaryProfile= @{@"userid":[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"],
                                 @"sessionid":([[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"] length]==0?@"":[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"]),
                                 @"deviceToken":([[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"] length]==0?@"":[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"])
                                 };
        
        
        
        
        
        NSError *errorOut;
        NSString *jsonString;
        NSString *jsonStringProfile;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&errorOut];
        NSData *jsonDataProfile = [NSJSONSerialization dataWithJSONObject:jsonDictionaryProfile
                                                                  options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                                    error:&errorOut];
        
        
        
        if (! jsonData) {
            NSLog(@"Got an error in json creation: %@", errorOut);
        } else {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            jsonStringProfile = [[NSString alloc] initWithData:jsonDataProfile encoding:NSUTF8StringEncoding];
        }
        
        NSLog(@"methodAction %@",methodAction);
        NSLog(@"jsondata %@",jsonString);
        NSLog(@"jsondata profile %@",jsonStringProfile);
        
        //string for the URL request
        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/onBoardDataServlet";
        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://192.168.1.37:8083";
        //create string for parameters that we need to send in the HTTP POST body
        //NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=%@&message=%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"],[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"],methodAction,jsonString];
        NSString *body =  [NSString stringWithFormat:@"userProfile=%@&methodAction=%@&message=%@",jsonStringProfile,methodAction,jsonString];
        
        
        //create a NSURL object from the string data
        NSURL *myUrl = [NSURL URLWithString:myUrlString];
        
        //create a mutable HTTP request
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
        //sets the receiver’s timeout interval, in seconds
        [urlRequest setTimeoutInterval:120.0f];
        //sets the receiver’s HTTP request method
        [urlRequest setHTTPMethod:@"POST"];
        //sets the request body of the receiver to the specified data.
        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        
        // set Content-Type in HTTP header
        NSString *contentType = [NSString stringWithFormat:@"application/x-www-form-urlencoded"];
        [urlRequest setValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        //allocate a new operation queue
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //Loads the data for a URL request and executes a handler block on an
        //operation queue when the request completes or fails.
        
        //if([methodAction isEqualToString:@"fetchImageDetails"])
        //{
        //__block NSData *returnData;
        
        [NSURLConnection
         sendAsynchronousRequest:urlRequest
         queue:queue
         completionHandler:^(NSURLResponse *response,
                             NSData *data,
                             NSError *error) {
             if ([data length] >0 && error == nil){
                 //process the JSON response
                 //use the main queue so that we can interact with the screen
                 dispatch_async(dispatch_get_main_queue(), ^{
                     
                     [self parseResponseImageLoad:data:@"fetchImageDetails":@"imageDetailsWrapper"];
                     
                 });
             }
             else if ([data length] == 0 && error == nil){
                 NSLog(@"Empty Response, not sure why?");
                 [CommonUtils showMessage:@"No response from host system":self];
                 return;
             }
             else if (error != nil){
                 NSLog(@"Not again, what is the error = %@", error);
                 [CommonUtils showError:error:self:@"connectHost"];
                 return;
             }
         }];
        
        
        
        //}
        //        else
        //        {
        //
        //            NSURLResponse *response = nil;
        //            NSError *error = nil;
        //            //getting the data
        //            NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
        //            if ([newData length] >0 && error == nil){
        //                //process the JSON response
        //                //use the main queue so that we can interact with the screen
        //
        //
        //                return newData;
        //
        //
        //            }
        //            else if ([newData length] == 0 && error == nil){
        //                NSLog(@"Empty Response, not sure why?");
        //                [self showMessage:@"No response from host system":viewcontroller];
        //            }
        //            else if (error != nil){
        //                NSLog(@"Not again, what is the error = %@", error);
        //
        //                [self showError:error:viewcontroller:@"connectHost"];
        //
        //            }
        //        }
        
        
        
        
        
        
        
        //
        //            //back to the main thread for the UI call
        //            dispatch_async(dispatch_get_main_queue(), ^{
        //                [spinner stopAnimating];
        //            });
        //            });
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in connectHost code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
    }
    @finally {
        
        NSLog(@"finally in connectHost Code");
    }
    
    
    
    return ;
    
    
}


static inline NSString* emptyStringIfNil(NSString *value) {
    return value? value : @"";
}

@end

