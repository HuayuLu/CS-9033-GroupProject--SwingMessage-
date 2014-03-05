//
//  sqliteViewController.m
//  sqlitDemo
//
//  Created by Huayu Lyu on 14-3-3.
//  Copyright (c) 2014年 New York University. All rights reserved.
//

#import "Sqitle3.h"

@interface Sqitle3 ()

@end

@implementation Sqitle3

sqlite3 *database;

//return the sqlite3 database path
-(NSString *)databasePath

{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *pathname = [path objectAtIndex:0];
    
    return [pathname stringByAppendingPathComponent:@"database.sqlite3"];
    
}

//open the sqlite3 database
- (BOOL)openDatabase

{
    
    if (sqlite3_open([[self databasePath] UTF8String],&database) != SQLITE_OK)
        
    {
        
        sqlite3_close(database);
        
        printf("failed to open the database");
        
        return NO;
        
    }
    
    else
        
    {
        
        printf("open the database successfully");
        
        return YES;
        
    }
    
}

// create table
- (BOOL)createTimerTable

{
    
    if ([self openDatabase]==YES)
        
    {
        
        char *erroMsg;
        NSString *TableName;
        
        NSString *createSQL = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(timerid INTEGER PRIMARY KEY AUTOINCREMENT,time INTEGER,remaintime INTEGER,iconuri BLOB,vibrate INTEGER,status INTEGER,message TEXT)",TableName];
        
        if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, &erroMsg)!= SQLITE_OK)
            
        {
            
            sqlite3_close(database);
            
            printf("create table faild");
            
            return NO;
            
        }
        
        else
            
        {
            
            printf("table was created");
            
            return YES;
            
        }
        
    }
    
    else
        
        return NO;
    
}

@end
