//
//  ViewController.m
//  QObjcTour
//
//  Created by cdzdev on 2017/6/29.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

/*view层代码规范：
 在viewDidload里面只做addSubview的事情，然后在viewWillAppear里面做布局的事情（勘误1），最后在viewDidAppear里面做Notification的监听之类的事情。至于属性的初始化，则交给getter去做。
 
 比如这样：
 */

#import "ViewController.h"
#import "QBlock.h"
#import "PThread.h"
#import "QObjcTour-Bridging-Header.h"
#import "MemoryManagementTest.h"
#import <objc/runtime.h>
#import "DynamicResolutionTest.h"

@interface ViewController ()<UITableViewDelegate>{
    UIImageView *_imageView;
    UIButton *_pressBtn;
}

@end

@implementation ViewController

#pragma mark-
#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [QBlock inlineBlock];
//    LaunchThread();
//    newPthread();
    
    [self layoutUI];
    
    
    [DynamicResolutionTest noIMPClassMethodWithArg:@"动态添加类方法，参数为classArg"];
    DynamicResolutionTest *resolution = [[DynamicResolutionTest alloc]init];
    [resolution message];
    [resolution noIMPInstanceMethodWithArg:@"动态添加实例方法,参数为instanceArg"];
    [resolution forwardedInstanceMethodWithArg:@"需要重定向的实例方法，参数为forwarded instance Agr"];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _pressBtn.frame = CGRectMake(0, 0, 100, 20);
    _pressBtn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    unsigned int count=1;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        MPLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        Method method = methodList[i];
        MPLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        MPLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        MPLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Delegate

#pragma mark- event response

-(void)loadImageWithMultiThread{
    //方法1：使用对象方法
    //创建一个线程，第一个参数是请求的操作，第二个参数是操作方法的参数
    //    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage) object:nil];
    //    //启动一个线程，注意启动一个线程并非就一定立即执行，而是处于就绪状态，当系统调度时才真正执行
    //    [thread start];
    
    //方法2：使用类方法
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
}


#pragma mark- private methods

-(void)layoutUI{
    _imageView =[[UIImageView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 500, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


-(void)updateImage:(NSData *)imageData{
    UIImage *image=[UIImage imageWithData:imageData];
    _imageView.image=image;
}

-(NSData *)requestData{
    //对于多线程操作建议把线程操作放到@autoreleasepool中
    @autoreleasepool {
        NSURL *url=[NSURL URLWithString:@"http://images.apple.com/iphone-6/overview/images/biggest_right_large.png"];
        NSData *data=[NSData dataWithContentsOfURL:url];
        return data;
    }
}

-(void)loadImage{
    //请求数据
    NSData *data= [self requestData];
    /*将数据显示到UI控件,注意只能在主线程中更新UI,
     另外performSelectorOnMainThread方法是NSObject的分类方法，每个NSObject对象都有此方法，
     它调用的selector方法是当前调用控件的方法，例如使用UIImageView调用的时候selector就是UIImageView的方法
     Object：代表调用方法的参数,不过只能传递一个参数(如果有多个参数请使用对象进行封装)
     waitUntilDone:是否线程任务完成执行
     */
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:data waitUntilDone:YES];
}

- (void)userDefaultStorage {
    
    //自定义类型
    
    
    /*
    Person *per = [[Person alloc]init];
    per.name = @"zhangsan";
    per.age = 42;
    
    //转化为 data
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:per];
    //存入
    [[NSUserDefaults standardUserDefaults]setObject:@{@"zhangsan":data} forKey:@"person"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //取出打印
    Person *a = [NSKeyedUnarchiver unarchiveObjectWithData:[[[NSUserDefaults standardUserDefaults] objectForKey:@"person"] valueForKey:@"zhangsan"]];
    MPLog(@"%@,%ld",a.name,a.age);
    */
    
}

//可变参数的函数
- (void)method:(NSString *)value,...
{
    //指向变参的指针
    va_list list;
    //使用第一个参数来初使化list指针
    va_start(list, value);
    while (YES)
    {
        //返回可变参数，va_arg第二个参数为可变参数类型，如果有多个可变参数，依次调用可获取各个参数
        NSString *string = va_arg(list, NSString*);
        if (!string) {
            break;
        }
        MPLog(@"%@",string);
    }
    //结束可变参数的获取
    va_end(list);
}
//[self method:@"1",@"2",@"3",nil];

- (void)foo:(NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    printf("%s",[str UTF8String]);
    str = nil;
}
- (IBAction) doo: (UIButton*) sender
{
    //须留意不定参函数的调用格式，逗号分隔的序列，应该它们整体是作为函数的一个参数传入
    [self foo : @"My name %@, %@", @"Unmi", @"Yes"];
}

-(void)vaMethod:(id)object1, ...{
    va_list argList;
    id arg;
    if (object1) {
        va_start(argList, object1);
        while ((arg = va_arg(argList, id))) {
            MPLog(@"%@",arg);
        }
        va_end(argList);
    }
}
// 调用
//[self vaMethod:someObj,button,@"ss",nil];

#pragma mark- getters and setters


@end
