//
//  RecognizeTextViewController.m
//  OCRiOS
//
//  Created by John Thomas on 17/12/1936 SAKA.
//  Copyright (c) 1936 SAKA Project. All rights reserved.
//

#import "RecognizeTextViewController.h"
#import "Tesseract.h"
#import <AVFoundation/AVFoundation.h>

@interface RecognizeTextViewController ()<AVSpeechSynthesizerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property (weak, nonatomic) IBOutlet UITextView *textToSpeak;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;

@end

@implementation RecognizeTextViewController

BOOL speechPaused = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];
    //    [tesseract setImage:[UIImage imageNamed:@"image_sample.jpg"]];
    [tesseract setImage:_imageView.image];
    [tesseract recognize];
    NSLog(@"%@", [tesseract recognizedText]);
    
    // Do any additional setup after loading the view, typically from a nib.
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    speechPaused = NO;
    self.textToSpeak.text = [tesseract recognizedText];
    self.textToSpeak.textColor = [UIColor whiteColor];
    self.synthesizer.delegate = self;
    
    NSString *copyStringverse = self.textToSpeak.text;
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    [pb setString:copyStringverse];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playPauseButtonPressed:(UIButton *)sender {
    [self.textToSpeak resignFirstResponder];
    if (speechPaused == NO) {
        [self.playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        [self.synthesizer continueSpeaking];
        speechPaused = YES;
    } else {
        [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
        speechPaused = NO;
        [self.synthesizer pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
    if (self.synthesizer.speaking == NO) {
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.textToSpeak.text];
        //utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-au"];
        [self.synthesizer speakUtterance:utterance];
    }
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
    speechPaused = NO;
    NSLog(@"Playback finished");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
