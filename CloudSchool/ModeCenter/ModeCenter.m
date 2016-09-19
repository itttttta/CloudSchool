//
//  ModeCenter.m
//  CloudSchool
//
//  Created by 汪达 on 16/9/14.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "ModeCenter.h"

@implementation ModeCenter

@end

//课程
@implementation Course_M

@end

//课程列表
@implementation Course_M_List

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"selectCourses" : [Course_M class]};
}

@end




//课程详情
@implementation CourseDetail_M

@end

//考试信息
@implementation ExamInfo_M

@end

