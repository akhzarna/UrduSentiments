//
//  LexiconView.m
//  UrduTextManipulater
//
//  Created by Commander on 1/26/13.
//  Copyright (c) 2013 BrainiacsTech. All rights reserved.
//

#import "LexiconView.h"
#import "SharedManager.h"
#import "FinalResultsViewController.h"

@interface LexiconView ()

@end

@implementation LexiconView

//@synthesize lexemesArray1,positiveArray1,negativeArray1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)Positive:(id)sender{
 
    
}

-(IBAction)CompareEntries:(id)sender{
    
    
    [[SharedManager getInstance].positiveLexemeArray removeAllObjects];
    [[SharedManager getInstance].negativeLexemeArray removeAllObjects];
    [[SharedManager getInstance].dontMatchFinalArray removeAllObjects];
    [[SharedManager getInstance].dontMatchArray removeAllObjects];

    NSLog(@"Check is = %@",[SharedManager getInstance].positiveLexemeArray);
    NSLog(@"Check is = %@",[SharedManager getInstance].negativeLexemeArray);
    NSLog(@"Check is = %@",[SharedManager getInstance].dontMatchFinalArray);

    
//    NSString *objPath = [[NSBundle mainBundle] pathForResource:@"poisitive-words" ofType:@"txt"];
//    
//    NSLog(@"obj Path is %@",objPath);
//    
//    NSData *data = [[NSData alloc]initWithContentsOfFile:objPath];
//    
//    NSString *strPositive = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    
//    positiveArray = [[NSMutableArray alloc]initWithArray:[strPositive componentsSeparatedByString:@"\n"]];
//    
//    _txtViewPositive.text = strPositive;
//    
//    NSLog(@"positive Array object at index is %@",[positiveArray objectAtIndex:0]);
//    
//    
//    NSString *objPath1 = [[NSBundle mainBundle] pathForResource:@"negative-words" ofType:@"txt"];
//    
//    NSLog(@"obj Path is %@",objPath1);
//    
//    NSData *data1 = [[NSData alloc]initWithContentsOfFile:objPath1];
//    
//    NSString *strNegative = [[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding];
//    
//    negativeArray = [[NSMutableArray alloc]initWithArray:[strNegative componentsSeparatedByString:@"\n"]];
//    
//    
//    NSLog(@"negative Array object at index is %@",[negativeArray objectAtIndex:0]);
//    
//    _txtViewNegative.text = strNegative;
    
    positiveLexemes = [[NSMutableArray alloc]init];
    negativeLexemes = [[NSMutableArray alloc]init];
    
//    lexemesArray = [[NSMutableArray alloc]initWithArray:[[SharedManager getInstance].lexemes componentsSeparatedByString:@"\n"]];
//    
//    
//    _txtViewLexemes.text = [SharedManager getInstance].lexemes;
    
    NSLog(@"Lexeme array object at 0 index is %@",[lexemesArray objectAtIndex:0]);
    
    NSLog(@"lexemes aray count is %lu",(unsigned long)[lexemesArray count]);
    NSLog(@"positive lexemes aray count is %lu",(unsigned long)[positiveArray count]);
    NSLog(@"negative lexemes aray count is %lu",(unsigned long)[negativeArray count]);
    
    NSLog(@"Lexeme Array Object at index 0 is %@",[lexemesArray objectAtIndex:0]);
    NSLog(@"Positive Array Object at index 0 is %@",[positiveArray objectAtIndex:0]);
    NSLog(@"Negative Array Object at index 0 is %@",[negativeArray objectAtIndex:0]);
    
    NSString *str2 = [NSString stringWithFormat:@"%@",[lexemesArray objectAtIndex:0]];
    NSString *str3 = [NSString stringWithFormat:@"%@",[negativeArray objectAtIndex:0]];
  
    NSLog(@"Lexeme Array is =%@",lexemesArray);
    NSLog(@"positive Array is =%@",positiveArray);
    NSLog(@"negative Array is =%@",negativeArray);


//    NSString *str2 = @"abc";
//    NSString *str3 = @"abc";
    
//    NSString *stri = [NSString stringWithFormat:@"%@\r",str2];
    
    NSLog(@"str2 is %@",str2);
//    NSLog(@"stri is %@",stri);

    NSLog(@"str3 is %@",str3);
    
    if ([str2 isEqualToString:str3]) {
     
        NSLog(@"str2 is %@",str2);
        NSLog(@"str3 is %@",str3);
        
        NSLog(@"Equal");
        
    }
    
    NSLog(@"str2 is %@",str2);
    NSLog(@"str3 is %@",str3);

    int postiveLexemesCount = 0, negativeLexemesCount = 0;

    NSLog(@"Lexemes Array Count is %lu",(unsigned long)[lexemesArray count]);
    
    for (int x = 0 ; x<lexemesArray.count; x++) {
        
        NSLog(@"Lexemes Array Count is %lu",(unsigned long)[lexemesArray count]);
        NSLog(@"Lexemes Array is %@",lexemesArray);

        int i = 0;
        
        for (int y = 0 ; y<positiveArray.count; y++) {
           
            if (([[NSString stringWithFormat:@"%@\r",[lexemesArray objectAtIndex:x]] isEqualToString:[positiveArray objectAtIndex:y]]) || ([[lexemesArray objectAtIndex:x] isEqualToString:[positiveArray objectAtIndex:y]])) {
                
                NSLog(@"Lexeme Match Lexeme is %@",[NSString stringWithFormat:@"%@\r",[lexemesArray objectAtIndex:x]]);
                NSLog(@"Positive Match Lexeme is %@",[positiveArray objectAtIndex:y]);
                
                [[SharedManager getInstance].positiveLexemeArray addObject:[lexemesArray objectAtIndex:x]];
                                
                postiveLexemesCount++;
                
                NSLog(@"Lexeme Match Index x is %d",x);
                NSLog(@"Positive Match Index y is %d",y);
                
                NSLog(@"Removed Lexeme is %@",[lexemesArray objectAtIndex:x]);
//                [lexemesArray removeObjectAtIndex:x];
                
                i++;

            }
        }
        if (i == 0) {
            
            [[SharedManager getInstance].dontMatchArray addObject:[lexemesArray objectAtIndex:x]];
        }
        
    }
    
    NSLog(@"Dont match is %@",[SharedManager getInstance].dontMatchArray);

    
    NSLog(@"Lexemes Array Count after Positive match is %lu",(unsigned long)[lexemesArray count]);
    
    for (int x = 0 ; x<[[SharedManager getInstance].dontMatchArray count]; x++) {

        int i = 0;

        for (int y = 0 ; y<negativeArray.count; y++) {
            
            if (([[NSString stringWithFormat:@"%@\r",[[SharedManager getInstance].dontMatchArray objectAtIndex:x]] isEqualToString:[negativeArray objectAtIndex:y]]) || ([[[SharedManager getInstance].dontMatchArray objectAtIndex:x] isEqualToString:[negativeArray objectAtIndex:y]])) {
               
                NSLog(@"Lexeme Match Lexeme is %@",[NSString stringWithFormat:@"%@\r",[[SharedManager getInstance].dontMatchArray objectAtIndex:x]]);
                
                NSLog(@"Positive Match Lexeme is %@",[negativeArray objectAtIndex:y]);
                
                [[SharedManager getInstance].negativeLexemeArray addObject:[[SharedManager getInstance].dontMatchArray objectAtIndex:x]];
                
                negativeLexemesCount++;
                
                NSLog(@"Lexeme Match Index x is %d",x);
                NSLog(@"Negative Match Index y is %d",y);
                
                i++;

            }
        }if (i == 0) {
            
            [[SharedManager getInstance].dontMatchFinalArray addObject:[[SharedManager getInstance].dontMatchArray objectAtIndex:x]];
        }

        
    }
    
    
    NSLog(@"Positive Lexemes is %@",[SharedManager getInstance].positiveLexemeArray);
    NSLog(@"Negative Lexemes is %@",[SharedManager getInstance].negativeLexemeArray);

    
    NSLog(@"Lexemes Array Count after Negative match is %lu",(unsigned long)[lexemesArray count]);
    NSLog(@"Total Number Of Positive Lexemes are %d",postiveLexemesCount);
    NSLog(@"Total Number Of Negative Lexemes are %d",negativeLexemesCount);
    
    [_lblpositive setText:[NSString stringWithFormat:@"%d",postiveLexemesCount]];
    [_lblNegative setText:[NSString stringWithFormat:@"%d",postiveLexemesCount]];
    
//    NSLog(@"Positive Lexemes are %@",positiveLexemes);
//    NSLog(@"Negative Lexemes are %@",negativeLexemes);
    
//    int lexemePositive = [lexemesArray count]/4;
//    int lexemeNegative = [lexemesArray count]/6;
    
    [SharedManager getInstance].positiveLexeme = [NSString stringWithFormat:@"%d",postiveLexemesCount];
    [SharedManager getInstance].negativeLexeme = [NSString stringWithFormat:@"%d",negativeLexemesCount];
    [SharedManager getInstance].lexemeArray = lexemesArray;
    
    FinalResultsViewController *finalObj = [[FinalResultsViewController alloc] initWithNibName:@"FinalResultsViewController" bundle:nil];
    [self.navigationController pushViewController:finalObj animated:YES];
    
    [finalObj release];

}

-(IBAction)back:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    
    [_txtViewPositive setInputAccessoryView:_toolbar];
    [_txtViewNegative setInputAccessoryView:_toolbar];
    [_txtViewLexemes setInputAccessoryView:_toolbar];
    
    return true;
}

-(IBAction)textViewToolbarDoneButton:(id)sender{
    
    [self.view endEditing:YES];
}


# pragma mark - TextView Delegates

//- (BOOL)textViewShouldReturn:(UITextField *)textView{
//    
//    [_txtViewPositive resignFirstResponder];
//    return YES;
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.        

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    NSLog(@"Selected TagSet is %@",[SharedManager getInstance].selectedTagSet);
    
    lexemesArray1 = [[NSMutableArray alloc]init];
    lexemesArray2 = [[NSMutableArray alloc]init];
    
    lexemesArray = [[NSMutableArray alloc]initWithArray:[[SharedManager getInstance].lexemes componentsSeparatedByString:@"\n"]];
    
    NSLog(@"Lexemes are %@",lexemesArray);
    
    //    _txtViewLexemes.text = lexemesArray;
    
    _txtViewLexemes.text = [SharedManager getInstance].lexemes;
    
    NSArray *pathsPositive = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPositive = [pathsPositive objectAtIndex:0];
    NSString *myPathDocsPositive =  [documentsDirectoryPositive stringByAppendingPathComponent:@"positive-words.txt"];
    
    NSLog(@"My Positive Paths is = %@",myPathDocsPositive);
    
    //    NSData *myData = [NSData dataWithContentsOfFile:myPathDocs1];
    //    NSString *finalString = [[NSString alloc]initWithData:myData encoding:NSUTF8StringEncoding];
    //    NSLog(@"Final File is %@",finalString);
    
    NSString *myStringPositive = [[NSString alloc] initWithContentsOfFile:myPathDocsPositive encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"MyString is = %@",myStringPositive);
    _txtViewPositive.text = myStringPositive;
    positiveArray = [[NSMutableArray alloc]initWithArray:[myStringPositive componentsSeparatedByString:@"\n"]];
    
    
    NSArray *pathsNegative = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryNegative = [pathsNegative objectAtIndex:0];
    NSString *myPathsDocsNegative = [documentsDirectoryNegative stringByAppendingPathComponent:@"negative-words.txt"];
    
    NSLog(@"My Negative Paths is = %@",myPathsDocsNegative);
    
    //    NSData *myData = [NSData dataWithContentsOfFile:myPathDocs1];
    //    NSString *finalString = [[NSString alloc]initWithData:myData encoding:NSUTF8StringEncoding];
    //    NSLog(@"Final File is %@",finalString);
    
    NSString *myStringNegative = [[NSString alloc] initWithContentsOfFile:myPathsDocsNegative encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"MyString is = %@",myStringNegative);
    _txtViewNegative.text = myStringNegative;
    negativeArray = [[NSMutableArray alloc]initWithArray:[myStringNegative componentsSeparatedByString:@"\n"]];
    
    NSLog(@"Lexeme Array is %@",lexemesArray);
    NSLog(@"positive Array is %@",positiveArray);
    NSLog(@"Negative Array is %@",negativeArray);
    
    NSLog(@"Positive Array Acount is %lu",(unsigned long)[positiveArray count]);
    
    NSArray *copy = [positiveArray copy];
    NSInteger index = [copy count] - 1;
    for (id object in [copy reverseObjectEnumerator]) {
        if ([positiveArray indexOfObject:object inRange:NSMakeRange(0, index)] != NSNotFound) {
            [positiveArray removeObjectAtIndex:index];
        }
        
        index--;
    }
    
    [copy release];
    
    NSLog(@"Positive Array Acount is %lu",(unsigned long)[positiveArray count]);
    
    
    NSLog(@"Negative Array Acount is %lu",(unsigned long)[negativeArray count]);
    
    
    NSArray *copy1 = [negativeArray copy];
    NSInteger index1 = [copy1 count] - 1;
    for (id object in [copy1 reverseObjectEnumerator]) {
        if ([negativeArray indexOfObject:object inRange:NSMakeRange(0, index1)] != NSNotFound) {
            [negativeArray removeObjectAtIndex:index1];
        }
        index1--;
    }
    [copy1 release];
    
    NSLog(@"Negative Array Acount is %lu",(unsigned long)[negativeArray count]);
    
    
    //    _txtViewPositive.text  = [NSString stringWithFormat:@"%@",positiveArray];
    //    _txtViewNegative.text = [NSString stringWithFormat:@"%@",negativeArray];
    
    //    [_txtViewLexemes setText:[NSString stringWithFormat:@"%@",]];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)dealloc {
    
    [_txtViewLexemes release];
    [_txtViewPositive release];
    [_txtViewNegative release];
    
    [_toolbar release];
    [_lblpositive release];
    [_lblNegative release];
    [super dealloc];
}
@end
