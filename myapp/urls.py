from django.conf.urls import url,include
#from django.conf.urls import url,include
from myapp import views

urlpatterns=[
 url(r'fb/$',views.face,name="fb page"),
 url(r'submitcontactus/',views.submitcontactus,name="Acknowledgement form submitted"),
 url(r'login/$',views.loginu,name="log in page"),
 url(r'messagedirector/$',views.messaged,name="Message of director"),
 url(r'welcome/$',views.welcome,name="front page detail"),
 url(r'sort/$',views.studentsort,name="sorting of stud profile bsd on param"),
 url(r'message/$',views.message,name="message static page"),
 url(r'alumnidisc/$',views.alumnidisc,name="Alumni discription"),
 url(r'signedin/$',views.signedpage,name='signedpage'),
 url(r'beyondacad/$',views.beyondacad,name="Beyond Academics"),
 url(r'academics/$',views.academics,name='Academics'),

 url(r'contactus/$',views.contactus,name="TPO @IIT BHU contact page"),
 url(r'discussion/$',views.discussion,name="Discussion Socket"),
 url(r'whyrecurit/$',views.whyrecurit,name="why recurit"),
 url(r'signup/$',views.signup,name="sign up"),
 url(r'studprofile/$',views.studprofile,name="student profile"),
 url(r'past/$',views.past,name='Past Recruits'),
 url(r'^$',views.index, name='index'),
 ]
