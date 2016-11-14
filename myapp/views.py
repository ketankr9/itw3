from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.db import connection
from django.template import RequestContext
import datetime
# Create your views here.
def face(request):
    return render(request,'myapp/fblogin.html',{})
def welcome(request):
    return render(request,'myapp/welcometotpo.html',{})
def message(request):
    return render(request,'myapp/Message.html',{})
def messaged(request):
    return render(request,'myapp/Message2director.html',{})
def beyondacad(request):
    return render(request,'myapp/beyondAcademics.html',{})
def index(request):
    return render(request,'myapp/homepage.html',{})
def contactus(request):
    return render(request,'myapp/contactus.html',{})
def past(request):
    return render(request,'myapp/pastrecruits.html',{})
def studprofile(request):
    return render(request,'myapp/studprofile.html',{})
def discussion(request,num):
    diic={}
    num=num.encode('utf-8')
    # first check if the user is logged in or not
    if 'cook' not in request.COOKIES:
        print "DEBUG PLEASE LOGIN"
        diclog={}
        diclog['num']=1
        diclog['value']="You must be logged in to use this feature!"
        print "redirecting to login page"
        return render(request,'myapp/loginUtsav.html',diclog)
    roll=request.COOKIES['roll']
    branch=request.COOKIES['branch']
    roll=request.COOKIES['roll']
    year=str(int(request.COOKIES['year'])%100)
    sec="btech"
    print roll
    print type(num)
    print "DEBUG",num
    que="dfkjh"
    if num=="1":
        que=sec+"."+branch+year
    #cse15
    elif num=="2":
        que=branch+year
    #cse
    elif num=="3":
        que=branch
    #general
    elif num=="4":
        que="general"
    disp=""
    if request.method=='POST':
        cursor=connection.cursor()  #2
        data=request.POST
        name=request.COOKIES['name']
        cursor.execute('''INSERT INTO discuss (roll,name,msg,grp) VALUES(%s,%s,%s,%s)''',[roll,name,data['msg'].encode("utf-8"),que])
        cursor.close() #2
        # if data['msg'] !="":
        #     cursor=connection.cursor()
        #     cursor.execute('''INSERT INTO discuss (name,msg) VALUES(%s,%s)''',(name,data['msg'].encode("utf-8")))
        #     cursor.close()
    cursor=connection.cursor() #3
    cursor.execute("""select name,msg from discuss where grp=%s""",[que])
    disp=cursor.fetchall()
    dic=[]
    for e in disp:
        dic.append(e[0].encode('utf-8')+"::"+e[1].encode('utf-8'))
    cursor.close() #3
    diic['msglog']=dic
    diic['varme']="varme"
    diic['num']=num
    return render(request,'myapp/discussion.html',diic)
def signup(request):
    return render(request,'myapp/Signup.html',{})
def logout(request):
    response = redirect('/')
    response.delete_cookie('cook')
    response.delete_cookie('roll')
    response.delete_cookie('name')
    response.delete_cookie('year')
    response.delete_cookie('branch')
    return response

def whyrecurit(request):
    return render(request,'myapp/whyrecurit.html',{})
def login(request):
    return render(request,'myapp/Login.html',{})

def loginu(request,w):
    dic={}
    if 'cook' in request.COOKIES:
        print "cook exists"
        if request.COOKIES['cook']=="cooked":
            print "cooked"
            return render(request,'myapp/homepage.html',{'value':"logged in"})
    #print request.COOKIES['cook']
    if request.method=="POST":
        data=request.POST
        remme=request.POST.get('remme', "off")
        cursor=connection.cursor()
        cursor.execute('''SELECT * FROM login_tb WHERE username = %s AND passwd=%s;''',(data['uname'].encode('utf-8'),data['psw'].encode('utf-8')))
        val=cursor.fetchall()
        cursor.execute('''SELECT Name,Branch, Year FROM profiles WHERE `Roll No`=%s;''',[data['uname'].encode('utf-8')])
        val2=cursor.fetchall()

        if val: # cred is correct
            if remme=="on":
                if w.encode('utf-8')=='1':
                    dic['num']=1
                    response=render(request,'myapp/discussion.html',dic)
                else:
                    dic['num']=0
                    response=render(request,'myapp/homepage.html',dic)

                response.set_cookie('cook', "cooked")
                response.set_cookie('name',val2[0][0])  # get name from db
                response.set_cookie('branch',val2[0][1]) # get branch from db
                response.set_cookie('year',val2[0][2]) # get year from db
                response.set_cookie('roll',str(data['uname'].encode('utf-8')))
                dic['value']="logged in"
                return response
            else:  # remember is off, set_cookie until browser is open
                response=render(request,'myapp/homepage.html',dic)
                response.set_cookie('cook', "cooked")
                dic['value']="logged in"
                return response
        else:
            dic['value']="Incorrect Username or Password";
    else:
        dic['num']=0;
        dic['value']="Please log in";

    #response.set_cookie('cook', "cooked")
    #return response
    return render(request,'myapp/loginUtsav.html',dic)
def alumnidisc(request):
    return render(request,'myapp/alumnidiscript.html',{})
def academics(request):
    return render(request,'myapp/academics.html',{})
def studentsort(request):
    return render(request,'myapp/studentsort.html',{})
def signedpage(request):
    #db=MySQLdb.connect("localhost","user","passwd","tpoportal")

    data=request.POST
    print data['email']
    print request.POST['email']
    if request.method=='POST':
        data=request.POST
        print data['email'].encode('utf-8')
        cursor=connection.cursor()
        cursor.execute('''SELECT passwd FROM login_tb WHERE username = %s;''',(data['email'].encode('utf-8')))
        passwod=cursor.fetchone()
        print passwod
        if passwod == data['password'].encode('utf-8'):
            return HttpResponse("success fully loged in!")
        else:
            return HttpResponse("Either username or password is incorrect")

    return HttpResponse("The username and password is correct")
def submitcontactus(request):
    print "submit contact us"
    if request.method=='POST':
        data=request.POST
        print data['email'],data['fname'],data['mobile']
        cursor=connection.cursor()
        cursor.execute('''INSERT INTO contactus(fname,email,mobile,subject,query) VALUES(%s,%s,%s,%s,%s)''',(data['fname'].encode('utf-8'),data['email'].encode('utf-8'),data['mobile'].encode('utf-8'),data['subject'].encode('utf-8'),data['query'].encode('utf-8')))
        cursor.close()
        return HttpResponse("""<p style="font-size:50px;" >Form successfully submitted<br/>We will reach you soon :)</p>""")
def submitcontactus(request):
    print "submit contact us"
    if request.method=='POST':
        data=request.POST
        print data['email'],data['fname'],data['mobile']
	body ="""
	%s
	Mobile Number: %s
	Email: %s
	""" % (data['query'], data['mobile'],data['email'])
	print body
	send_mail(data['subject'], body,data['email'], ['mayank.hawk@gmail.com'], fail_silently=False)


        return HttpResponse("""<p style="font-size:50px;" >Thank You<br/>Your response was successfully submitted<br/>We will reach you soon :)</p>""")

#2
def OTPsignup(request):
    print "OTP for signup"
    if request.method=='POST':
        data=request.POST
        print data['email'],data['fname'],data['lname']
	global Name
	Name= data['fname'] + " " + data['lname']
        print (Name)
	host = "localhost"
	port = 12345
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.connect((host, port))
	t=data['email']
	t=str(t)
	t=t.encode("utf-8")
	s.sendall(t)
	data = s.recv(1024)
	data=data.decode("utf-8")
	global otp
	otp = data
	global flagotp
	flagotp=1
	print(otp)

        return render(request,'myapp/Signupotp.html',{})

#3
def OTPVerification(request):
    print "OTP for signup"
    if request.method=='POST':
        data=request.POST
	global Name
	print (Name)
        print data['otp']
	if data['otp']==otp and flagotp==1:
	    return render(request,'myapp/Signupcomp.html',{})
	elif data['otp']==otp :
	    return HttpResponse("""<p style="font-size:50px;" >Session Expired :( </p>""")
	else:
	    global flagotp
	    flagotp=0
	    return HttpResponse("""<p style="font-size:50px;" >Incorrect OTP :( </p>""")

#4
def signupc(request):
    print "Complete signup"
    if request.method=='POST':
        data=request.POST
	global Name
	print (Name)
	Name=str(Name)
        print (data['rolln'], data['uname'], data['psw'], data['psw2'])
	if data['psw']==data['psw2'] :
	     cursor=connection.cursor()
             cursor.execute('''INSERT INTO profiles (`Roll No`, Name, `GPA Details` ) VALUES(%s, %s, %s)''',(data['rolln'].encode("utf-8"), "10.0",Name.encode("utf-8")))
	     cursor.execute('''INSERT INTO login_tb (Roll_No,username,passwd) VALUES(%s,%s,%s)''',(data['rolln'].encode("utf-8"), data['uname'].encode("utf-8"),data['psw'].encode("utf-8")))
	     return render(request,'myapp/Login.html',{})
	else:
	    return render(request,'myapp/Signupcomp.html',{})
