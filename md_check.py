def md_check(m,d):
        if m > 0 and m < 13 and d > 0 and d < 32 : #general check date & month
                if m == 5 or m == 4 and d < 31:
                        print('True')
                elif m == 3 and d > 19 or m == 6 and d < 21:
                        print('True')
                else:
                        print ('False')
        else:
                print ('False')


md_check(1,31) # false month not in range
md_check(0,31) # false month doesn't exist
md_check(5,31) # true condition met
md_check(4,31) # false there's no 31 April in calendar
md_check(3,19) # false it's not in range
md_check(6,21) # false it's not in range
md_check(3,20) # true it's in range
md_check(4,20) # true it's in range
md_check(5,20) # true it's in range
md_check(6,20) # true it's in range
md_check(5,32) # false, date isn't exist
