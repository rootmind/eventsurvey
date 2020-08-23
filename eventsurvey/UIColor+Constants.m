//
//  Constants.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 2/7/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+Constants.h"

//@interface UIColor(Constants)
//
//
//@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

@implementation UIColor (Constants)


+(UIColor *) borderColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
        color = [UIColor grayColor];
    //});
    
    return color;
}

+(UIColor *) controllerBGColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
    color = [UIColor whiteColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];
    //color = [UIColor colorWithRed:63/255.0 green:219/255.0 blue:243/255.0 alpha:0.55];
        //color = [UIColor colorWithHue:188/255 saturation:0.88 brightness:0.6 alpha:0.55];
    
    //});
    
    return color;
    
}

+(UIColor *) captionColor {
    
    static UIColor *color;
    

        color = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0];

    
    return color;
}

+(UIColor *) dataColor {
    
    static UIColor *color;
    

        color = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];

    
    return color;
}

+(UIColor *) borderBlueColor {
    
    static UIColor *color;
    
 
    color = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0];
    
    
  
    
    return color;
}


+(UIColor *) navigatorColor {
    
    static UIColor *color;
    
   
    color = [UIColor colorWithRed:0/255.0 green:56/255.0 blue:103/255.0 alpha:1];//[UIColor colorWithRed:204/255.0 green:153/255.0 blue:25/255.0 alpha:1.0];//
    
    
    
    
    return color;
}

+(UIColor *) cellBGColor {
    
    static UIColor *color;
    
 
    color = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];

    
    return color;
}


+(UIColor *) cellColor {
    
    static UIColor *color;
    

    color = [UIColor whiteColor];

    
    return color;
}

+(UIColor *) amberColor {
    
    static UIColor *color;
    
 
    color = [UIColor colorWithRed:255/255.0 green:191/255.0 blue:0/255.0 alpha:1.0];
;
    
    return color;
}

+(UIColor *) titleColor {
    
    static UIColor *color;

    color = [UIColor colorWithRed:255/255.0 green:152/255.0 blue:51/255.0 alpha:1.0];
 
    
    return color;
}

+(UIColor *) lightPinkColor {
    
    static UIColor *color;
 
    color = [UIColor colorWithRed:229/255.0 green:0/255.0 blue:147/255.0 alpha:1.0];

    
    return color;
}

+(UIColor *) lightBlueColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:0/255.0 green:126/255.0 blue:229/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) lightGreenColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:97/255.0 green:229/255.0 blue:0/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) arcticBlueColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:0/255.0 green:208/255.0 blue:229/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) gambogeColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:229/255.0 green:134/255.0 blue:0/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) darklimegreenColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:67/255.0 green:83/255.0 blue:14/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) vividredColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:229/255.0 green:21/255.0 blue:0/255.0 alpha:1.0];
    
    
    return color;
}
+(UIColor *) moderategambogeColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:149/255.0 green:88/255.0 blue:9/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) vividpurpleColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:141/255.0 green:0/255.0 blue:229/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) persianblueColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:24/255.0 green:0/255.0 blue:229/255.0 alpha:1.0];
    
    
    return color;
}


+(UIColor *) orchidColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:229/255.0 green:0/255.0 blue:207/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) moderateroseColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:149/255.0 green:9/255.0 blue:79/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) deeparcticblueColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:0/255.0 green:78/255.0 blue:89/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) deepseagreenColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:0/255.0 green:89/255.0 blue:33/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) deepvermilionColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:89/255.0 green:22/255.0 blue:0/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) luminousvividtangeloColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:255/255.0 green:94/255.0 blue:0/255.0 alpha:1.0];
    
    
    return color;
}

+(UIColor *) lightBluishColor {
    
    static UIColor *color;
    
  
    color = [UIColor colorWithRed:(76.0/255.0) green:(161.0/255.0) blue:(255.0/255.0) alpha:1.0];
    
    
    return color;
}

+(UIColor *) navyBlueColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(0/255.0) green:(51/255.0) blue:(127/255.0) alpha:1.0];
    
    
    return color;
}


+(UIColor *) vividAmberColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(255/255.0) green:(216/255.0) blue:(102/255.0) alpha:1.0];
    
    
    return color;
}

+(UIColor *) lightOrangeColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(229/255.0) green:(179/255.0) blue:(127/255.0) alpha:1.0];
    
    
    return color;
}

+(UIColor *) lightCyanColor {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(121/255.0) green:(238/255.0) blue:(242/255.0) alpha:1.0];
    
    
    return color;
}

+(UIColor *) brilliantturquoise {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(82/255.0) green:(237/255.0) blue:(199/255.0) alpha:1.0];
    
    
    return color;
}
+(UIColor *) lightCornFlowerBluishGray {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(209/255.0) green:(238/255.0) blue:(252/255.0) alpha:1.0];
    
    
    return color;
}
+(UIColor *) lightLimeGreen {
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(224/255.0) green:(248/255.0) blue:(216/255.0) alpha:1.0];
    
    
    return color;
}
+(UIColor *) veryPaleCrimson{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(255/255.0) green:(211/255.0) blue:(224/255.0) alpha:1.0];
    
    
    return color;
}
+(UIColor *) lightAmberishGray{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(228/255.0) green:(221/255.0) blue:(202/255.0) alpha:1.0];
    
    
    return color;
}
+(UIColor *) razzmatazz{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(219/255.0) green:(10/255.0) blue:(91/255.0) alpha:1.0];
    
    
    return color;
}
+(UIColor *) tahihiGold{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(232/255.0) green:(126/255.0) blue:(4/255.0) alpha:1.0];
    
    
    return color;
}

+(UIColor *) pumice{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:(210/255.0) green:(215/255.0) blue:(211/255.0) alpha:1.0];
    
    
    return color;
}

+(UIColor *) redHSBCColor{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:219/255.0 green:0/255.0 blue:17/255.0 alpha:1];

    
    return color;
}

+(UIColor *) vividOrangeColor{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:229/255.0 green:110/255.0 blue:0/255.0 alpha:1];
    
    
    return color;
}

//QIB
+(UIColor *) strongCeruleanColor{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:0/255.0 green:126/255.0 blue:178/255.0 alpha:1];
    
    
    return color;
}

//FH
+(UIColor *) strongAzureColor{
    
    static UIColor *color;
    
    color = [UIColor colorWithRed:0/255.0 green:90/255.0 blue:178/255.0 alpha:1];
    
    
    return color;
}

@end

