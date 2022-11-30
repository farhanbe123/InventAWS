from django.shortcuts import render, redirect

from django.contrib.auth import authenticate,login,logout
from .decorators import *

@unauthenticated_user
def loginPage(request):

    if request.method == 'POST':
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username = username,password = password)

        if user is not None : 
            login(request, user)
            return redirect('admin_dashboard')

    return render(request, 'aplikasi_login/login.html')


def logoutUser(request):
    logout(request)
    return redirect('login')