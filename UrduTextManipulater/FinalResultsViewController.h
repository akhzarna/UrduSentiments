//
//  FinalResultsViewController.h
//  UrduTextManipulater
//
//  Created by Commander on 2/26/13.
//  Copyright (c) 2013 BrainiacsTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FinalResultsViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *txtViewDontMatch;
@property (retain, nonatomic) IBOutlet UIPickerView *pickerLexemes;
@property (retain, nonatomic) IBOutlet UILabel *accuracyLabel;

@property (retain, nonatomic) IBOutlet UILabel *commentsLabel;
@property (retain, nonatomic) IBOutlet UITextView *txtPositiveMatchLexem;
@property (retain, nonatomic) IBOutlet UILabel *lblPositiveLexeme;
@property (retain, nonatomic) IBOutlet UILabel *lblNegativeLexeme;
@property (retain, nonatomic) IBOutlet UITextView *txtNegativeMatchLeme;
@property (retain, nonatomic) IBOutlet UIView *viewLexemes;
@property (retain, nonatomic) NSString *SelectedLexeme;
@property (assign) NSInteger pickerIndex;

-(IBAction)back:(id)sender;
-(IBAction)PickerAction:(id)sender;
-(IBAction)PositiveDoneAction:(id)sender;
-(IBAction)NegativeDoneAction:(id)sender;
-(IBAction)CancelDoneAction:(id)sender;

@end
