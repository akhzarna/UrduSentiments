//
//  SharedManager.m
//  Educator
//
//  Created by Adeel Rehman on 11/24/11.
//  Copyright (c) 2011 VeriTech. All rights reserved.
//

#import "SharedManager.h"

@implementation SharedManager

@synthesize lexemes,selectedTagSet,positiveLexeme,negativeLexeme,positiveLexemeArray,negativeLexemeArray,dontMatchArray,dontMatchFinalArray,lexemeArray;


static SharedManager *sharedInstance;

- (id) init
{
    //	self = [super init];
	if (self = [super init]) {
        
        selectedTagSet = @"";
        lexemes = @"";
        positiveLexeme = @"";
        negativeLexeme = @"";
        positiveLexemeArray = [[NSMutableArray alloc]init];
        negativeLexemeArray = [[NSMutableArray alloc]init];
        dontMatchArray = [[NSMutableArray alloc]init];
        dontMatchFinalArray = [[NSMutableArray alloc]init];
        lexemeArray = [[NSMutableArray alloc]init];

    }
    
	return self;

}

+ (SharedManager*)getInstance{
    
	@synchronized(self){
		if(sharedInstance ==  nil){			
			sharedInstance = [[SharedManager alloc] init];
            
		}
	}
	return sharedInstance;
}

+ (BOOL)isNetworkAvailable {
    
//    if (sharedInstance.isHostReachable || sharedInstance.isWiFiAvailable) {
//        return YES;
//    }
//    else {
//        return NO;
//    }

}

+ (void)showActivity:(UIView *)view {
    
    NSString *nibName;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        nibName = @"LoadingView_iPad";
    }
    else {
        nibName = @"LoadingView";
    }
    
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    
//    LoadingView *loadingView = (LoadingView *)[nibs objectAtIndex:0];
//    [loadingView setTag:007];
//    [view addSubview:loadingView];

}

+ (void)hideActivity:(UIView *)view {
    
    [[view viewWithTag:007] removeFromSuperview];
    
}

#pragma mark - NSDate Functions

+ (NSDate *)dateFromString:(NSString *)str withFormat:(NSString *)format {
    
    NSString *dateString = str;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];
    [dateFormatter release];
    
    return dateFromString;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:date];
    [dateFormatter release];
    
    return strDate;
}

@end
