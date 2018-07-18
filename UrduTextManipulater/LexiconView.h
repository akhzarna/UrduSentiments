//
//  LexiconView.h
//  UrduTextManipulater
//
//  Created by Commander on 1/26/13.
//  Copyright (c) 2013 BrainiacsTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LexiconView : UIViewController{
    
    NSMutableArray *lexemesArray;
    NSMutableArray *lexemesArray1;
    NSMutableArray *lexemesArray2;

    NSMutableArray *positiveArray;
    NSMutableArray *negativeArray;
    NSMutableArray *positiveLexemes;
    NSMutableArray *negativeLexemes;
//    UITextField

}
@property (retain, nonatomic) NSMutableArray *positiveLexemes;
@property (retain, nonatomic) NSMutableArray *negativeLexemes;

@property (retain, nonatomic) IBOutlet UITextView *txtViewLexemes;
@property (retain, nonatomic) IBOutlet UITextView *txtViewPositive;
@property (retain, nonatomic) IBOutlet UITextView *txtViewNegative;
@property (retain, nonatomic) IBOutlet UIToolbar *toolbar;
@property (retain, nonatomic) IBOutlet UILabel *lblpositive;
@property (retain, nonatomic) IBOutlet UILabel *lblNegative;

-(IBAction)textViewToolbarDoneButton:(id)sender;
-(IBAction)Positive:(id)sender;
-(IBAction)Negative:(id)sender;
-(IBAction)CompareEntries:(id)sender;
-(IBAction)back:(id)sender;

@end
