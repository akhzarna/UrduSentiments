//
//  SharedManager.h
//  Educator
//
//  Created by Adeel Rehman on 11/24/11.
//  Copyright (c) 2011 VeriTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedManager : NSObject {
    
    NSString * lexemes;
    
}

@property (nonatomic, retain) NSString * lexemes;
@property (nonatomic, retain) NSString * selectedTagSet;
@property (nonatomic,retain) NSString *positiveLexeme;
@property (nonatomic,retain) NSString *negativeLexeme;

@property (nonatomic,retain) NSMutableArray *positiveLexemeArray;
@property (nonatomic,retain) NSMutableArray *negativeLexemeArray;
@property (nonatomic,retain) NSMutableArray *lexemeArray;
@property (nonatomic,retain) NSMutableArray *dontMatchArray;
@property (nonatomic,retain) NSMutableArray *dontMatchFinalArray;

+ (SharedManager*)getInstance;

+ (BOOL)isNetworkAvailable;

+ (void)showActivity:(UIView *)view;
+ (void)hideActivity:(UIView *)view;

+ (NSDate *)dateFromString:(NSString *)str withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;

@end
