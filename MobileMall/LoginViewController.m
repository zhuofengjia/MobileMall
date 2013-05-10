//
//  LoginViewController.m
//  MobileMall
//
//  Created by ChenYuanFang on 13-4-27.
//  Copyright (c) 2013年 softbest1. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisteredViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    self.title=@"用户登陆";
    
    self.view.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    
    UIButton *leftBtn=[ComponentsFactory drawStringInMyButtonWithFrame:CGRectMake(0, 0, 45, 30) IconName:@"allLeft.png" Target:self Action:@selector(goBack) ButtonTag:101 TitleString:@"返回" StringFont:12 IsBold:YES Color:[UIColor whiteColor]];
    UIBarButtonItem *leftBarItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    [self.navigationItem setLeftBarButtonItem:leftBarItem];
    [leftBarItem release];
    
    [self layoutMyMainView];
	// Do any additional setup after loading the view.
}

-(void)goBack{
    [accountFld resignFirstResponder];
    [passwordFld resignFirstResponder];
    //[self.navigationController dismissModalViewControllerAnimated:YES];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


-(void)gotoRegisteredView{
    RegisteredViewController *myRegist=[[RegisteredViewController alloc]init];
    [self.navigationController pushViewController:myRegist animated:YES];
    [myRegist release];
}

-(void)layoutMyMainView{
    bgView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT-20-44)];
    bgView.backgroundColor=[UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1.0];
    bgView.delegate=self;
    bgView.contentSize=CGSizeMake(320, MY_HEIGHT+25);
    //bgView.scrollEnabled=NO;
    bgView.showsHorizontalScrollIndicator=NO;
    bgView.showsVerticalScrollIndicator=NO;
    
    UIControl *bgControl=[[UIControl alloc]initWithFrame:CGRectMake(0, 0, 320, MY_HEIGHT+25)];
    bgControl.backgroundColor=[UIColor clearColor];
    [bgControl addTarget:self action:@selector(cancelMyEnter) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:bgControl];
    [bgControl release];
    
    loginTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 2, 320, 110) style:UITableViewStyleGrouped];
    loginTable.delegate=self;
    loginTable.dataSource=self;
    loginTable.backgroundView.alpha=0.0f;
    loginTable.scrollEnabled=NO;
    [bgView addSubview:loginTable];
    
    UIButton *loginBtn=[ComponentsFactory buttonWithType:UIButtonTypeCustom title:@"" frame:CGRectMake(8.5, 130, 301, 41) imageName:@"login.png" tappedImageName:@"login.png" target:self action:@selector(loginStart) tag:101];
    [bgView addSubview:loginBtn];
    
    registTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 180, 320, 60) style:UITableViewStyleGrouped];
    registTable.delegate=self;
    registTable.dataSource=self;
    registTable.backgroundView.alpha=0.0f;
    registTable.scrollEnabled=NO;
    [bgView addSubview:registTable];
    
    [self.view addSubview:bgView];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==loginTable) {
        return 2;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==loginTable) {
        if (indexPath.row==0) {
            static NSString *CellIdentifier = @"firstCellIdentifier";
            
            UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 50, 20) Font:[UIFont systemFontOfSize:18] Text:@"账号:" Color:[UIColor blackColor]];
            
            accountFld=[[UITextField alloc]initWithFrame:CGRectMake(68, 14, 240, 20)];
            accountFld.placeholder=@"请输入用户名";
            accountFld.delegate=self;
            accountFld.returnKeyType=UIReturnKeyNext;
            accountFld.backgroundColor=[UIColor clearColor];
            
            [cell.contentView addSubview:accountFld];
            
            return cell;
        }else{
            static NSString *CellIdentifier = @"secondCellIdentifier";
            
            UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                            reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 50, 20) Font:[UIFont systemFontOfSize:18] Text:@"密码:" Color:[UIColor blackColor]];
            
            passwordFld=[[UITextField alloc]initWithFrame:CGRectMake(68, 14, 240, 20)];
            passwordFld.placeholder=@"请输入密码";
            passwordFld.delegate=self;
            passwordFld.returnKeyType=UIReturnKeyDone;
            passwordFld.secureTextEntry=YES;
            passwordFld.backgroundColor=[UIColor clearColor];
            
            [cell.contentView addSubview:passwordFld];
            
            return cell;
        }
    }else{
        static NSString *CellIdentifier = @"thirdCellIdentifier";
        
        UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                        reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [ComponentsFactory drawMyLabelInView:cell.contentView Frame:CGRectMake(10, 14, 100, 20) Font:[UIFont systemFontOfSize:18] Text:@"免费注册" Color:[UIColor blackColor]];
        
        UIImageView *arrow=[[UIImageView alloc]initWithFrame:CGRectMake(285, 19, 7, 11)];
        arrow.image=[UIImage imageNamed:@"jiantou.png"];
        [cell.contentView addSubview:arrow];
        [arrow release];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [accountFld resignFirstResponder];
    [passwordFld resignFirstResponder];
    if (tableView==registTable) {
        RegisteredViewController *myRegist=[[RegisteredViewController alloc]init];
        [self.navigationController pushViewController:myRegist animated:YES];
        [myRegist release];
    }
}

-(void)cancelMyEnter{
    [accountFld resignFirstResponder];
    [passwordFld resignFirstResponder];

}

-(void)loginStart{
    
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //bgView.scrollEnabled=YES;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField==accountFld) {
        [passwordFld becomeFirstResponder];
    }else{
        [self loginStart];
    }
    return YES;
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self cancelMyEnter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    TT_RELEASE_SAFELY(accountFld);
    TT_RELEASE_SAFELY(passwordFld);
    TT_RELEASE_SAFELY(loginTable);
    TT_RELEASE_SAFELY(registTable);
    TT_RELEASE_SAFELY(bgView);
    [super dealloc];
}

@end
