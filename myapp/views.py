from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.db import connection
from django.template import context
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
def discussion(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    print ip
    if request.method=='POST':
        data=request.POST
        if data['msg'] !="":
            cursor=connection.cursor()
            cursor.execute('''INSERT INTO discuss (name,msg) VALUES(%s,%s)''',(str(ip),data['msg'].encode("utf-8")))
            cursor.close()
    cursor=connection.cursor()
    cursor.execute('''select * from discuss''')
    dic=[]
    for e in cursor.fetchall():
        dic.append(e[1].encode('utf-8')+":::"+e[2].encode('utf-8'))
    dic.reverse()
    cursor.close()
    diic={'msglog':dic}
    print dic
    return render(request,'myapp/discussion.html',diic)
def signup(request):
    return render(request,'myapp/Signup.html',{})
def whyrecurit(request):
    return render(request,'myapp/whyrecurit.html',{})
def login(request):
    return render(request,'myapp/Login.html',{})
def loginu(request):
    data=request.POST
    #print data #debug
    dic={}
    if request.method=="POST":
        cursor=connection.cursor()
        cursor.execute('''SELECT * FROM login_tb WHERE username = %s AND passwd=%s;''',(data['uname'].encode('utf-8'),data['psw'].encode('utf-8')))
        val=cursor.fetchall()
        for i in val:
            print i
        if val:
            #dic['value']="LOGGED IN";
            return redirect(request,'/')
        else:
            dic['value']="Incorrect";
    else:
        dic['value']="Please log in";
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
