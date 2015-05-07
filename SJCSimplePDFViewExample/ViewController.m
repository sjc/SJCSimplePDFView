//
//  ViewController.m
//  SJCSimplePDFViewExample
//
//  Created by Stuart Crook on 03/05/2015.
//  Copyright (c) 2015 Just About Managing ltd. All rights reserved.
//

#import "ViewController.h"
#import "SJCSimplePDFView.h"

static NSString *const kCurrentPageKey = @"currentPage";

@interface ViewController () <UIAlertViewDelegate>
@end

@implementation ViewController

- (void)dealloc {
    [_PDFView removeObserver:self forKeyPath:kCurrentPageKey];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = _PDFView.PDFBundleFileName;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"999/999" style:UIBarButtonItemStylePlain target:nil action:NULL];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Mode" style:UIBarButtonItemStylePlain target:self action:@selector(modeTapped:)];

    [_PDFView addObserver:self forKeyPath:kCurrentPageKey options:NSKeyValueObservingOptionInitial context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:kCurrentPageKey]) {
        self.navigationItem.leftBarButtonItem.title = [NSString stringWithFormat:@"%d/%d", (int)_PDFView.currentPage, (int)_PDFView.displayedPageCount];
    }
}

- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}

#pragma mark - actions

- (IBAction)modeTapped:(id)sender {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Choose Mode", @"")
                                                 message:NSLocalizedString(@"Choose between the PDF View's 3 display modes", @"")
                                                delegate:self
                                       cancelButtonTitle:NSLocalizedString(@"Cancel", @"")
                                       otherButtonTitles:NSLocalizedString(@"Continuous", @""), NSLocalizedString(@"Paged Vertically", @""), NSLocalizedString(@"Paged Horizontally", @""), nil];
    [av show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch(buttonIndex) {
        case 1: _PDFView.viewMode = kSJCPDFViewModeContinuous; break;
        case 2: _PDFView.viewMode = kSJCPDFViewModePageVertical; break;
        case 3: _PDFView.viewMode = kSJCPDFViewModePageHorizontal; break;
    }
}

@end
