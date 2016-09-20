from django.conf.urls import url,include
#from django.conf.urls import url,include
from myapp import views

urlpatterns=[
 url(r'signedin/$',views.signedpage,name='signedpage'),
 url(r'login/$',views.login,name="Log In page"),
 url(r'contactus/$',views.contactus,name="TPO @IIT BHU contact page"),
 url(r'discussion/$',views.discussion,name="Discussion Socket"),
 url(r'whyrecurit/$',views.whyrecurit,name="why recurit"),
 url(r'signup/$',views.signup,name="sign up"),
 url(r'studprofile/$',views.studprofile,name="student profile"),
 url(r'^$',views.index, name='index'),

]
