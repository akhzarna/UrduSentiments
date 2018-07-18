//
//  FinalResultsViewController.m
//  UrduTextManipulater
//
//  Created by Commander on 2/26/13.
//  Copyright (c) 2013 BrainiacsTech. All rights reserved.
//

#import "FinalResultsViewController.h"
#import "SharedManager.h"

@interface FinalResultsViewController ()

@end

@implementation FinalResultsViewController
@synthesize pickerIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

-(IBAction)back:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
       
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self LoadFinalResults];
    
}

-(void)LoadFinalResults{
    
    _txtPositiveMatchLexem.text = @"";
    _txtNegativeMatchLeme.text = @"";
    _txtViewDontMatch.text = @"";
    
    NSLog(@"Positive Lexeme Array is = %@",[SharedManager getInstance].positiveLexemeArray);
    NSLog(@"Negative Lexeme Array is = %@",[SharedManager getInstance].negativeLexemeArray);
    NSLog(@"Dont Match Lexeme Array is = %@",[SharedManager getInstance].dontMatchFinalArray);
    
    [_lblPositiveLexeme setText:[SharedManager getInstance].positiveLexeme];
    [_lblNegativeLexeme setText:[SharedManager getInstance].negativeLexeme];
    
    NSLog(@"Positive is %@",[SharedManager getInstance].positiveLexemeArray);
    NSLog(@"Negative is %@",[SharedManager getInstance].negativeLexemeArray);
    
    float Accuracy = ([[SharedManager getInstance].positiveLexemeArray count]+ [[SharedManager getInstance].negativeLexemeArray count])*100/[[SharedManager getInstance].lexemeArray count];
    
    NSLog(@"Positive is %lu",(unsigned long)[[SharedManager getInstance].positiveLexemeArray count]);
    NSLog(@"Negative is %lu",(unsigned long)[[SharedManager getInstance].negativeLexemeArray count]);
    NSLog(@"Negative is %lu",(unsigned long)[[SharedManager getInstance].lexemeArray count]);
    
    NSLog(@"Accuracy is =%f",Accuracy);
    
    if ([[SharedManager getInstance].positiveLexemeArray count]>[[SharedManager getInstance].negativeLexemeArray count]) {
        
        _commentsLabel.text = @"Positive";
        
    }else if ([[SharedManager getInstance].positiveLexemeArray count]<[[SharedManager getInstance].negativeLexemeArray count]) {
        
        _commentsLabel.text = @"Negative";
        
    }else{
        
        _commentsLabel.text = @"Neutral";
        
    }
    
    _accuracyLabel.text = [NSString stringWithFormat:@"%f",Accuracy];
    
    NSMutableString *str = [NSMutableString string];
    
    for (NSObject *obj in [SharedManager getInstance].positiveLexemeArray) {
        
        [str appendString:[NSString stringWithFormat:@"%@\n",obj]];
        
    }
    
    _txtPositiveMatchLexem.text = str;
    
    NSMutableString *str1 = [NSMutableString string];
    
    for (NSObject *obj in [SharedManager getInstance].negativeLexemeArray) {
        
        [str1 appendString:[NSString stringWithFormat:@"%@\n",obj]];
        
    }
    
    _txtNegativeMatchLeme.text = str1;
    
    NSMutableString *str2 = [NSMutableString string];
    
    for (NSObject *obj in [SharedManager getInstance].dontMatchFinalArray) {
        
        [str2 appendString:[NSString stringWithFormat:@"%@\n",obj]];
        
    }
    
    _txtViewDontMatch.text = str2;

}

-(IBAction)PickerAction:(id)sender{
        
    _viewLexemes.center = CGPointMake(self.view.center.x, 350);
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:0.3];
    
    [self.view addSubview:_viewLexemes];
    
//    self.view.center = CGPointMake(txtView.center.x, 165);
    
    [UIView commitAnimations];

    
}

-(IBAction)PositiveDoneAction:(id)sender{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    //    self.view.center = CGPointMake(txtView.center.x, 230);
    [UIView commitAnimations];
    
    [_viewLexemes removeFromSuperview];
    
    NSLog(@"Selected String is = %@",_SelectedLexeme);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentTXTPath = [documentsDirectory stringByAppendingPathComponent:@"positive-words.txt"];
//    NSString *savedString = @"TES TEST TEST TEST TEST TEST TEST";
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;

    if(![fileManager fileExistsAtPath:documentTXTPath])
    {
        [_SelectedLexeme writeToFile:documentTXTPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
//        [_SelectedLexeme writeToFile:documentTXTPath atomically:YES];
    }
    else
    {
        NSFileHandle *myHandle = [NSFileHandle fileHandleForUpdatingAtPath:documentTXTPath];
        [myHandle seekToEndOfFile];
        [myHandle writeData:[[NSString stringWithFormat:@"\n%@",_SelectedLexeme] dataUsingEncoding:NSUTF8StringEncoding]];
        [myHandle closeFile];

    }
    
//    NSArray *pathsPositive = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectoryPositive = [pathsPositive objectAtIndex:0];
//    NSString *myPathDocsPositive =  [documentsDirectoryPositive stringByAppendingPathComponent:@"positive-words.txt"];
//    
//    
//    NSLog(@"My Positive Paths is = %@",myPathDocsPositive);
//    
////    [_SelectedLexeme writeToFile:myPathDocsPositive atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    [@"Test" writeToFile:myPathDocsPositive atomically:YES encoding:NSUTF8StringEncoding error:nil];

    
    [[SharedManager getInstance].dontMatchFinalArray removeObjectAtIndex:pickerIndex];

    [_pickerLexemes reloadAllComponents];
    
    [self LoadFinalResults];
}

-(IBAction)NegativeDoneAction:(id)sender{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    //    self.view.center = CGPointMake(txtView.center.x, 230);
    [UIView commitAnimations];
    
    [_viewLexemes removeFromSuperview];
    
    NSLog(@"Selected String is = %@",_SelectedLexeme);

    NSArray *pathsNegative = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryNegative = [pathsNegative objectAtIndex:0];
    NSString *myPathDocsNegative =  [documentsDirectoryNegative stringByAppendingPathComponent:@"negative-words.txt"];
    
    NSLog(@"My Positive Paths is = %@",myPathDocsNegative);
    
//    [_SelectedLexeme writeToFile:myPathDocsNegative atomically:YES encoding:NSUTF8StringEncoding error:nil];
    [@"Test" writeToFile:myPathDocsNegative atomically:YES encoding:NSUTF8StringEncoding error:nil];

    [[SharedManager getInstance].dontMatchFinalArray removeObjectAtIndex:pickerIndex];

    [_pickerLexemes reloadAllComponents];

    [self LoadFinalResults];
}

-(IBAction)CancelDoneAction:(id)sender{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    //    self.view.center = CGPointMake(txtView.center.x, 230);
    [UIView commitAnimations];
    
    [_viewLexemes removeFromSuperview];
    [_pickerLexemes reloadAllComponents];
    
}


#pragma mark - pickerView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [[SharedManager getInstance].dontMatchFinalArray count];
        
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [[SharedManager getInstance].dontMatchFinalArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    _SelectedLexeme = [[SharedManager getInstance].dontMatchFinalArray objectAtIndex:row];
    
    pickerIndex = row;
    
}


- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)dealloc {
    
    [_lblPositiveLexeme release];
    [_lblNegativeLexeme release];
    [_txtPositiveMatchLexem release];
    [_txtNegativeMatchLeme release];
    [_txtViewDontMatch release];
    [_viewLexemes release];
    [_pickerLexemes release];
    [_accuracyLabel release];
    [_commentsLabel release];
    [super dealloc];
    
}

- (void)viewDidUnload {
    
    [self setTxtPositiveMatchLexem:nil];
    [self setTxtNegativeMatchLeme:nil];
    [self setTxtViewDontMatch:nil];
    [self setViewLexemes:nil];
    [self setPickerLexemes:nil];
    [self setAccuracyLabel:nil];
    [self setCommentsLabel:nil];
    [super viewDidUnload];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
