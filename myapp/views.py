from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection
# Create your views here.
def welcome(request):
    return render(request,'myapp/welcometotpo.html',{})
def message(request):
    return render(request,'myapp/Message.html',{})
def messaged(request):
    return render(request,'myapp/Message2director.html',{})
def past(request):
    return render(request,'myapp/pastrecruits.html',{})
def beyondacad(request):
    return render(request,'myapp/beyondAcademics.html',{})
def index(request):
    return render(request,'myapp/homepage.html',{})
def contactus(request):
    return render(request,'myapp/contactus.html',{})
def studprofile(request):
    return render(request,'myapp/studprofile.html',{})
def discussion(request):
    return render(request,'myapp/discussion.html',{})
def signup(request):
    return render(request,'myapp/Signup.html',{})
def whyrecurit(request):
    return render(request,'myapp/whyrecurit.html',{})
def login(request):
    return render(request,'myapp/login.html',{})
def loginm(request):
    return render(request,'myapp/Login.html',{})
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
        cursor.execute('''SELECT passwd FROM login_tb WHERE username = %s;'''%(data['email'].encode('utf-8')))
        passwod=cursor.fetchone()
        print passwod
        if passwod == data['password'].encode('utf-8'):
            return HttpResponse("success fully loged in!")
        else:
            return HttpResponse("Either username or password is incorrect")

    return HttpResponse("The username and password is correct")
