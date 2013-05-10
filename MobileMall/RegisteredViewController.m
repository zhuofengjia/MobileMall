//
//  RegisteredViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-4-27.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "RegisteredViewController.h"

@interface RegisteredViewController ()

@end

@implementation RegisteredViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"用户注册";
    
    self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
    
    [self layoutMyMainView];
	// Do any additional setup after loading the view.
}

-(void)layoutMyMainView{
    bgView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT-20-44)];
    bgView.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    bgView.delegate=self;
    bgView.contentSize=CGSizeMake(320, MY_HEIGHT+80);
    bgView.showsHorizontalScrollIndicator=NO;
    bgView.showsVerticalScrollIndicator=NO;
    
    UIControl *bgControl=[[UIControl alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT+50)];
    bgControl.backgroundColor=[UIColor clearColor];
    [bgControl addTarget:self action:@selector(cancelMyEnter) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:bgControl];
    [bgControl release];
    
    UITableView *registTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 2, 320, 260) style:UITableViewStyleGrouped];
    registTable.delegate=self;
    registTable.dataSource=self;
    registTable.backgroundView.alpha=0.0f;
    registTable.scrollEnabled=NO;
    [bgView addSubview:registTable];
    [registTable release];
    
    UIButton *registBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"" frame:CGRectMake(8.5, 265, 301, 41) imageName:@"regist.png" tappedImageName:@"regist.png" target:self action:@selector(registStart) tag:101];
    [bgView addSubview:registBtn];
    
    [self.view addSubview:bgView];
}

-(void)goBack{
    //[self cancelMyEnter];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)cancelMyEnter{
    [accountFld resignFirstResponder];
    [passwordFld resignFirstResponder];
    [againFld resignFirstResponder];
    [phoneFld resignFirstResponder];
    [verificationFld resignFirstResponder];
    [bgView scrollRectToVisible:CGRectMake(0, 0, 320, MY_HEIGHT-20-44) animated:YES];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            static NSString *CellIdentifier = @"firstCellIdentifier";
            
            UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 50, 20) Font:[UIFont systemFontOfSize:18] Text:@"账号:" Color:[UIColor blackColor]];
            
            accountFld=[[UITextField alloc]initWithFrame:CGRectMake(62, 14, 240, 20)];
            accountFld.placeholder=@"请输入用户名";
            accountFld.delegate=self;
            accountFld.returnKeyType=UIReturnKeyNext;
            accountFld.backgroundColor=[UIColor clearColor];
            
            [cell.contentView addSubview:accountFld];
            
            return cell;
        }
            break;
        case 1:{
            static NSString *CellIdentifier = @"secondCellIdentifier";
            
            UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 50, 20) Font:[UIFont systemFontOfSize:18] Text:@"密码:" Color:[UIColor blackColor]];
            
            passwordFld=[[UITextField alloc]initWithFrame:CGRectMake(62, 14, 240, 20)];
            passwordFld.placeholder=@"请输入密码";
            passwordFld.delegate=self;
            passwordFld.returnKeyType=UIReturnKeyNext;
            passwordFld.secureTextEntry=YES;
            passwordFld.backgroundColor=[UIColor clearColor];
            
            [cell.contentView addSubview:passwordFld];
            
            return cell;
        }
            break;
        case 2:{
            static NSString *CellIdentifier = @"thirdCellIdentifier";
            
            UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 80, 20) Font:[UIFont systemFontOfSize:18] Text:@"确认密码:" Color:[UIColor blackColor]];
            
            againFld=[[UITextField alloc]initWithFrame:CGRectMake(95, 14, 240, 20)];
            againFld.placeholder=@"请再一次输入密码";
            againFld.delegate=self;
            againFld.returnKeyType=UIReturnKeyNext;
            againFld.secureTextEntry=YES;
            againFld.backgroundColor=[UIColor clearColor];
            
            [cell.contentView addSubview:againFld];
            
            return cell;
            
        }
            break;
        case 3:{
            static NSString *CellIdentifier = @"forthCellIdentifier";
            
            UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 80, 20) Font:[UIFont systemFontOfSize:18] Text:@"联系电话:" Color:[UIColor blackColor]];
            
            phoneFld=[[UITextField alloc]initWithFrame:CGRectMake(95, 14, 120, 20)];
            phoneFld.placeholder=@"请输入手机号码";
            phoneFld.delegate=self;
            phoneFld.keyboardType=UIKeyboardTypePhonePad;
            phoneFld.returnKeyType=UIReturnKeyNext;
            phoneFld.backgroundColor=[UIColor clearColor];
            [cell.contentView addSubview:phoneFld];
            
            UIButton *getVerifBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"" frame:CGRectMake(220, 9, 73, 30) imageName:@"verificationCode.png" tappedImageName:@"verificationCode.png" target:self action:@selector(getMyVerification) tag:201];
            [cell.contentView addSubview:getVerifBtn];
            
            return cell;
        }
            break;
        case 4:{
            static NSString *CellIdentifier = @"fifthCellIdentifier";
            
            UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            
            [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 70, 20) Font:[UIFont systemFontOfSize:18] Text:@"验证码:" Color:[UIColor blackColor]];
            
            verificationFld=[[UITextField alloc]initWithFrame:CGRectMake(82, 14, 240, 20)];
            verificationFld.placeholder=@"请输验证码";
            verificationFld.delegate=self;
            verificationFld.returnKeyType=UIReturnKeyDone;
            verificationFld.backgroundColor=[UIColor clearColor];
            
            [cell.contentView addSubview:verificationFld];
            
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
}

-(void)getMyVerification{
    
}

-(void)registStart{
    
}

#pragma mark UIScrollViewDelegate


#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField==phoneFld) {
        [bgView scrollRectToVisible:CGRectMake(0, 144, 320, MY_HEIGHT-20-44) animated:YES];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField==accountFld) {
        [passwordFld becomeFirstResponder];
    }else if (textField==passwordFld){
        [againFld becomeFirstResponder];
    }else if (textField==againFld){
        [phoneFld becomeFirstResponder];
    }else if (textField==phoneFld){
        [verificationFld becomeFirstResponder];
    }
    else{
        [self registStart];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    TT_RELEASE_SAFELY(bgView);
    TT_RELEASE_SAFELY(accountFld);
    TT_RELEASE_SAFELY(passwordFld);
    TT_RELEASE_SAFELY(againFld);
    TT_RELEASE_SAFELY(phoneFld);
    TT_RELEASE_SAFELY(verificationFld);
    [super dealloc];
}

@end
