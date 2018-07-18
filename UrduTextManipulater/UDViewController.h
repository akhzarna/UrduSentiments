//
//  UDViewController.h
//  UrduTextManipulater
//
//  Created by Syed Rajeel Amjad on 1/11/13.
//  Copyright (c) 2013 BrainiacsTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UDViewController : UIViewController<UITextViewDelegate, UITextFieldDelegate> {
    
    UITextView *urduFileTextView;
    UITextView *adjectivesTextView;
    UITextView *remarksTextView;
    UIToolbar *toolbar;
    
    NSString *urduText;
    NSString *adjectives;
    NSString *remarks;
    
    NSMutableArray *arrayTagSet;
    
}

@property (retain, nonatomic) IBOutlet UIPickerView *pickerTagSet;
@property (retain, nonatomic) IBOutlet UIView *viewTagSet;
@property (retain, nonatomic) IBOutlet UIButton *btnLexemes;
@property (retain, nonatomic) IBOutlet UIButton *btnTagSet;
@property(nonatomic, retain)IBOutlet UITextView *urduFileTextView;
@property(nonatomic, retain)IBOutlet UITextView *adjectivesTextView;
@property(nonatomic, retain)IBOutlet UITextView *remarksTextView;
@property(nonatomic, retain)IBOutlet UIToolbar *toolbar;

-(IBAction)readUrduFile:(id)sender;
-(IBAction)textViewToolbarDoneButton:(id)sender;
-(IBAction)adjectivesButtonAction:(id)sender;
-(IBAction)Lexicon:(id)sender;
-(IBAction)WriteToFile:(id)sender;
-(IBAction)TagSetAction:(id)sender;
-(IBAction)PickerDoneAction:(id)sender;

@end
