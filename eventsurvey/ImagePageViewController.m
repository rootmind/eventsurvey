//
//  ImagePageViewController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 10/28/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "ImagePageViewController.h"
#import "ImagePageChildViewController.h"




@interface ImagePageViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red







@implementation ImagePageViewController



@synthesize actionMode;

@synthesize menuName;

@synthesize dataDictionary;

@synthesize dataArray;


@synthesize refNo;
@synthesize cifNumber;
//@synthesize btnUpload;

@synthesize  imageArray;
@synthesize  imageData;


//@synthesize docID;
@synthesize popoverCodeValue;
@synthesize imageView;



@synthesize recordStatus;

@synthesize pageControl;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
    //self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    [self.splitViewController.displayModeButtonItem action];
    
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Image Page"];
    
    self.navigationItem.title=@"Image Page";
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
    
    
    
    
    
    
    
//    imageView = [[UIImageView alloc]init];
//    imageView.layer.borderWidth=1.0;
//    imageView.layer.borderColor=[UIColor borderBlueColor].CGColor;
//    imageView.layer.shadowRadius=10.0;
//    imageView.backgroundColor = [UIColor whiteColor];
//    imageView.layer.shadowOffset = CGSizeMake(0, 3);
//    imageView.layer.shadowRadius = 10.0;
//    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
//    imageView.layer.shadowOpacity = 0.8;
//    imageView.layer.cornerRadius = 15.0;
//    imageView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:imageView];
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    [self doValidate];
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    
    ImagePageChildViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
    
    NSLog(@"page view did %lu",(unsigned long)[imageArray count]);
    
    pageControl = [[UIPageControl alloc] init] ;//]WithFrame:CGRectMake(0, 264, self.view.frame.size.width, self.view.frame.size.width/1.5)];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    [pageControl setNumberOfPages:[imageArray count]];
    pageControl.backgroundColor=[UIColor whiteColor];
    pageControl.autoresizingMask=UIViewAutoresizingNone;
    pageControl.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:pageControl];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];

   
    
    
    
  
    
//    
//    docID= [[UITextField alloc] init];
//    docID.tag=1;
//    //docID.enabled=false;
//    docID.delegate=self;
//    //docID.placeholder=@"Select Document";
//    docID.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:docID];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.24 constant:0]];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.04 constant:0]];
//    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];

    
//    // kick things off by making the first page
//    PhotoViewController *pageZero = [PhotoViewController photoViewControllerForPageIndex:0];
//    if (pageZero != nil)
//    {
//        // assign the first page to the pageViewController (our rootViewController)
//        UIPageViewController *pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
//        
//        pageViewController.dataSource = self;
//        
//        [pageViewController setViewControllers:@[pageZero]
//                                     direction:UIPageViewControllerNavigationDirectionForward
//                                      animated:NO
//                                    completion:NULL];
//    }
//    
    

    
}



- (void) doValidate {
    
    
    
    //------validation starts---------
    
    [CommonUtils loadActivityIndicator:self];
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    
    [self buildJSON];
    
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}


- (void) buildJSON {
    
    
    
    
    
    
    @try{
        
        
        NSLog(@"RefNo %@",self.refNo);
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        
        
        
        
        //---------------
        
        
        
        //-------
        
        
        NSDictionary *jsonDictionary = @{@"refNo": emptyStringIfNil(self.refNo),
                                         @"imageStatus":emptyStringIfNil(@"ACTIVE")
                                        };
        
        
        //NSString *jsonString = [container JSONRepresentation];
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
        
        
        
        //NSData *newData=[CommonUtils connectHost :@"fetchImageFileNames" :jsonDictionary:self];
        //[self parseResponse:newData:@"fetchImageFileNames":@"imageDetailsWrapper"];
        
    
        if([imageData.imageFoundStatus boolValue] == NO)
        {
            [CommonUtils showMessage:@"No image available, please upload from Image Upload":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            [self.navigationController popViewControllerAnimated:YES];
        }
        
        
       
        
        
        
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




- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"get validate user ");
        
        
        
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
    
    
//    @try {
//        
//        
//        
//        NSLog(@"get validate user %@",userid);
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
    
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(ImagePageChildViewController *)viewController index];
    
    [self.pageControl setCurrentPage:index];
    
    if (index == 0) {
        
        return nil;
    }
    
    index--;
    
//    imageData=[imageArray objectAtIndex:index];
//    
//    NSLog(@"imageData.docIDValue %@",emptyStringIfNil(imageData.docIDValue));
//    self.docID.text=emptyStringIfNil(imageData.docIDValue);
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(ImagePageChildViewController *)viewController index];
    
    
    
    [self.pageControl setCurrentPage:index];
    
    index++;



    
    if (index == [imageArray count]) {
        
        return nil;
    }
    
   
//    imageData=[imageArray objectAtIndex:index];
//    
//    NSLog(@"imageData.docIDValue %@",emptyStringIfNil(imageData.docIDValue));
//    self.docID.text=emptyStringIfNil(imageData.docIDValue);
    
    return [self viewControllerAtIndex:index];
    
}

- (ImagePageChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    //[CommonUtils loadActivityIndicator:self];
    
    //[NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    
    
    
    ImagePageChildViewController *imagePageChildViewController = [[ImagePageChildViewController alloc] init];
    imagePageChildViewController.index = index;
    imagePageChildViewController.refNo=self.refNo;
    imagePageChildViewController.pageCount=[NSNumber numberWithInteger:[imageArray count]];
    
    imageData=[imageArray objectAtIndex:index];
    imagePageChildViewController.imageFileName=imageData.imageFileName;
    imagePageChildViewController.imageFileFolder=imageData.imageFileFolder;
    imagePageChildViewController.imageId=imageData.imageId;
    
   


    //[NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
    return imagePageChildViewController;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return [imageArray count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    
    
    return [(ImagePageChildViewController *)[pageViewController.viewControllers firstObject] index];
    
    //return 0;
}


//- (UIViewController *)pageViewController:(UIPageViewController *)pvc viewControllerBeforeViewController:(PhotoViewController *)vc
//{
//    NSUInteger index = vc.pageIndex;
//    return [PhotoViewController photoViewControllerForPageIndex:(index - 1)];
//}
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pvc viewControllerAfterViewController:(PhotoViewController *)vc
//{
//    NSUInteger index = vc.pageIndex;
//    return [PhotoViewController photoViewControllerForPageIndex:(index + 1)];
//}


@end

