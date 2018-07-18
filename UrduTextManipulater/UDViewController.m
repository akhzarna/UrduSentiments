//
//  UDViewController.m
//  UrduTextManipulater
//
//  Created by Syed Rajeel Amjad on 1/11/13.
//  Copyright (c) 2013 BrainiacsTech. All rights reserved.
//

#import "UDViewController.h"
#import "LexiconView.h"
#import "SharedManager.h"

@interface UDViewController ()
@end

@implementation UDViewController
@synthesize urduFileTextView;
@synthesize adjectivesTextView;
@synthesize remarksTextView;
@synthesize toolbar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arrayTagSet = [[NSMutableArray alloc]initWithObjects:@"<Adj>",@"<JJ>",@"<J>",@"<Ad>", nil];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSString *resourceTestPath = [[NSBundle mainBundle] pathForResource:@"manifesto" ofType:@"docx"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *txtPathNegative = [documentsDirectory stringByAppendingPathComponent:@"negative-words.txt"];
    NSString *txtPathPositive = [documentsDirectory stringByAppendingPathComponent:@"positive-words.txt"];
    if ([fileManager fileExistsAtPath:txtPathNegative] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"negative-words" ofType:@"txt"];
        [fileManager copyItemAtPath:resourcePath toPath:txtPathNegative error:&error];
    }
    if ([fileManager fileExistsAtPath:txtPathPositive] == NO) {
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"positive-words" ofType:@"txt"];
        [fileManager copyItemAtPath:resourcePath toPath:txtPathPositive error:&error];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    [textView setInputAccessoryView:toolbar];
    return true;
}

-(IBAction)textViewToolbarDoneButton:(id)sender{
    
    [self.view endEditing:YES];
}

-(void)readUrduFile:(id)sender{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"00ur_pos" ofType:@"txt"];
    NSLog(@"Path For File is %@",filePath);
    NSData *myData = [NSData dataWithContentsOfFile:filePath];
    //NSString *myData = [NSString stringWithContentsOfFile:@"filePath" encoding:NSUTF8StringEncoding error:NULL];
    NSString *str = [[[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding] autorelease];
   // NSLog(@"Data %@",data);
    urduFileTextView.text = str;
    
}

-(void)adjectivesButtonAction:(id)sender{
    
    [SharedManager getInstance].selectedTagSet = @"س:";
    NSString *objPath = [[NSBundle mainBundle] pathForResource:@"00ur_pos" ofType:@"txt"];
    NSData *objData = [[NSData alloc] initWithContentsOfFile:objPath];
    NSString *oneLine;
    NSString *finalString;
    NSMutableArray * newArray = [[NSMutableArray alloc] init];
    NSString *objString = [[NSString alloc] initWithData:objData encoding:NSUTF8StringEncoding];
    NSMutableArray *lines = [NSMutableArray arrayWithArray:[objString componentsSeparatedByString:[SharedManager getInstance].selectedTagSet]];
    
        for (int i = 0; i < lines.count; i++) {
            oneLine = [lines objectAtIndex:i];
            if (oneLine.length < 2) {
                continue;
           }
            NSMutableArray *lines2 = [NSMutableArray arrayWithArray:[oneLine componentsSeparatedByString:@"س:"]];
            NSInteger abc = lines2.count;
            [newArray addObject:[lines2 objectAtIndex:abc-1]];
            
        }
    
        finalString = [newArray componentsJoinedByString:@"\n"];
        [adjectivesTextView setText:finalString];
        [SharedManager getInstance].lexemes = finalString;

}

-(void)copyed{
    
    NSString *objPath = [[NSBundle mainBundle] pathForResource:@"textfile" ofType:@"txt"];
    NSData *objData = [[NSData alloc] initWithContentsOfFile:objPath];
    
    NSString *objString = [[NSString alloc] initWithData:objData encoding:NSUTF8StringEncoding];
    NSMutableArray *lines = [NSMutableArray arrayWithArray:[objString componentsSeparatedByString:@"\n"]];
    
    for (int i = 0; i < lines.count; i++) {
        NSString *oneLine = [lines objectAtIndex:i];
        if (oneLine.length < 2) {
            continue;
        }
        oneLine = [NSString stringWithFormat:@"/%@", oneLine];
        oneLine = [oneLine stringByReplacingOccurrencesOfString:@"`" withString:@"\`"];
        
        [lines replaceObjectAtIndex:i withObject:oneLine];
    }
    NSString *finalString = [lines componentsJoinedByString:@"\n"];
    //save the file
}

-(IBAction)Lexicon:(id)sender{
    LexiconView *obj = [[LexiconView alloc]initWithNibName:@"LexiconView" bundle:nil];
    [self.navigationController pushViewController:obj animated:YES];
    [obj release];
}

-(IBAction)WriteToFile:(id)sender{
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/outputlexeme.txt",documentsDirectory];
    NSLog(@"File Name is %@",fileName);
    NSString *content = adjectivesTextView.text;
    NSLog(@"Content is %@",content);
    //save content to the documents directory
    [content writeToFile:fileName atomically:NO encoding:NSUTF8StringEncoding error:nil];
}

-(IBAction)TagSetAction:(id)sender{
    _viewTagSet.center = CGPointMake(self.view.center.x, 350);
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [self.view addSubview:_viewTagSet];
    [UIView commitAnimations];
}

-(IBAction)PickerDoneAction:(id)sender{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView commitAnimations];
    [_viewTagSet removeFromSuperview];
}

#pragma mark - pickerView delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [arrayTagSet count];
    
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [arrayTagSet objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    [SharedManager getInstance].selectedTagSet = [arrayTagSet objectAtIndex:row];
        
}

-(void)dealloc{
    
    [urduFileTextView release];
    [adjectivesTextView release];
    [remarksTextView release];
    [_btnTagSet release];
    [_btnLexemes release];
    [_viewTagSet release];
    [_pickerTagSet release];
    [super dealloc];

}

- (void)viewDidUnload {

    [self setBtnTagSet:nil];
    [self setBtnLexemes:nil];
    [self setViewTagSet:nil];
    [self setPickerTagSet:nil];
    [super viewDidUnload];

}

@end
