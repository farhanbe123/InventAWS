from django.shortcuts import render, redirect
from django.core import serializers
# Create your views here.
from django.contrib.auth.models import Group , User
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from .models import *
from .forms import *

import random
import datetime
import json

from aplikasi_login.decorators import *

from io import BytesIO
from django.template.loader import get_template

from xhtml2pdf import pisa

def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html  = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None

@admin_only
@login_required(login_url='login')
def dashboard(request):
    gedung = Gedung.objects.all()
    jumlah_gedung = gedung.count()

    ruang = Ruang.objects.all()
    jumlah_ruang = ruang.count()

    barang = Barang.objects.all()
    jumlah_barang = barang.count()

    pegawai = Pegawai.objects.all()
    jumlah_pegawai = pegawai.count()

    context = {
        "jumlah_gedung":jumlah_gedung,
        "jumlah_ruang":jumlah_ruang,
        "jumlah_barang":jumlah_barang,
        "jumlah_pegawai":jumlah_pegawai
    }
    return render(request, 'aplikasi_admin/dashboard.html',context)
@admin_only
@login_required(login_url='login')
def data_gedung(request):
    gedung = Gedung.objects.all()

    context = {"data_gedung":gedung}

    return render(request, 'aplikasi_admin/data_gedung.html',context)
    
@admin_only    
@login_required(login_url='login')
def create_gedung(request):
    if request.method == "POST" :
        form = GedungForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/aplikasi_admin/gedung')
    form = GedungForm()

    context = {"form":form}

    return render(request, 'aplikasi_admin/gedung_form.html',context)
@admin_only
@login_required(login_url='login')
def update_gedung(request, id_gedung):
    gedung = Gedung.objects.get(id = id_gedung)
    form = GedungForm(instance=gedung)

    if request.method == "POST" :
        form = GedungForm(request.POST, instance=gedung)
        if form.is_valid():
            form.save()
            return redirect('/aplikasi_admin/gedung')

    context = {"form":form}
    return render(request, 'aplikasi_admin/gedung_form.html',context)

@admin_only
@login_required(login_url='login')
def delete_gedung(request, id_gedung):
    if request.method == "POST" :
        gedung = Gedung.objects.get(id=id_gedung)
        gedung.delete()
        return redirect('/aplikasi_admin/gedung')

@admin_only    
@login_required(login_url='login')
def data_ruang(request):
    ruang = Ruang.objects.all().order_by('gedung_id')

    context = {"data_ruang":ruang}

    return render(request, 'aplikasi_admin/data_ruang.html', context)



@admin_only
@login_required(login_url='login')
def create_ruang(request):
    if request.method == "POST" :
        form = RuangForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/aplikasi_admin/ruang')
    form = RuangForm()

    context = {"form":form}

    return render(request, 'aplikasi_admin/ruang_form.html',context)

@admin_only
@login_required(login_url='login')
def update_ruang(request, id_ruang):

    ruang = Ruang.objects.get(id = id_ruang)
    form = RuangForm(instance=ruang)

    if request.method == "POST" :
        form = RuangForm(request.POST, instance=ruang)
        if form.is_valid():
            form.save()
            return redirect('/aplikasi_admin/ruang')

    context = {"form":form}
    return render(request, 'aplikasi_admin/ruang_form.html',context)



@admin_only   
@login_required(login_url='login')
def delete_ruang(request, id_ruang):
    if request.method == "POST" :
        ruang = Ruang.objects.get(id=id_ruang)
        ruang.delete()
        return redirect('/aplikasi_admin/ruang')

@admin_only
@login_required(login_url='login')
def data_barang(request):
    barang = Barang.objects.all()

    context = {"data_barang":barang}

    return render(request, 'aplikasi_admin/data_barang.html', context)

@admin_only
@login_required(login_url='login')
def create_barang(request):

    if request.method == "POST" :
        form = BarangForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/aplikasi_admin/barang')

    form = BarangForm()

    context = {"form":form}

    return render(request, 'aplikasi_admin/barang_form.html',context)
@admin_only
@login_required(login_url='login')
def update_barang(request, id_barang):
    barang = Barang.objects.get(id = id_barang)
    form = BarangForm(instance=barang)

    if request.method == "POST" :
        form = BarangForm(request.POST, request.FILES, instance=barang)
        if form.is_valid():
            form.save()
            return redirect('/aplikasi_admin/barang')

    context = {"form":form}
    return render(request, 'aplikasi_admin/barang_form.html',context)

@admin_only
@login_required(login_url='login')
def delete_barang(request, id_barang):
    if request.method == "POST" :
        barang = Barang.objects.get(id=id_barang)
        barang.delete()
        return redirect('/aplikasi_admin/barang')

@admin_only
@login_required(login_url='login')
def data_peminjaman(request):
    peminjaman = PeminjamanDetail.objects.all()
    context = {"data_peminjaman" : peminjaman}
    return render(request, 'aplikasi_admin/data_peminjaman.html', context)

@admin_only
@login_required(login_url='login')
def create_peminjaman(request):

    if request.method == "POST" :
        date_today = datetime.datetime.now()
        adder = date_today.strftime("%d%m%Y")
        no_peminjaman = adder + str(random.randint(100,999))
        barang_id = request.POST['barang_id']
        pegawai_id = request.POST['pegawai_id']
        gedung_id = request.POST['gedung_id']
        ruang_id = request.POST['ruang_id']
        jumlah = request.POST['jumlah']
        tgl_pinjam = request.POST['tgl_pinjam']
        tgl_kembali = request.POST['tgl_kembali']
        bast_disposisi = request.FILES['bast_disposisi']

        fs = FileSystemStorage()
        filename = fs.save(bast_disposisi.name, bast_disposisi)
        bast_disposisi_url = fs.url(filename)
     
        peminjaman_data = Peminjaman(no_peminjaman = no_peminjaman, 
        pegawai_id = pegawai_id, 
        tgl_pinjam = tgl_pinjam, 
        tgl_kembali = tgl_kembali, 
        bast_disposisi = bast_disposisi_url
        )
        peminjaman_data.save()

        peminjaman_id = peminjaman_data.id

        peminjaman_detail_data = PeminjamanDetail(jumlah = jumlah, peminjaman_id = peminjaman_id, barang_id = barang_id, ruang_id = ruang_id, gedung_id = gedung_id)
        peminjaman_detail_data.save()

        barang = Barang.objects.get(id = barang_id)
        barang.stock -= int(jumlah)
        barang.save()

        return redirect('/aplikasi_admin/peminjaman')
    pegawai = Pegawai.objects.all()
    gedung = Gedung.objects.all()
    barang = Barang.objects.all()
    context = {"data_pegawai" : pegawai,"data_gedung" : gedung, "data_barang": barang}
    return render(request, 'aplikasi_admin/peminjaman_form.html', context)

@admin_only
@login_required(login_url='login')
def update_peminjaman(request, peminjaman_id):
    date_today = datetime.datetime.now()
    if request.method == 'POST':

        bast_disposisi = request.FILES['bast_disposisi']

        fs = FileSystemStorage()
        filename = fs.save(bast_disposisi.name, bast_disposisi)
        bast_disposisi_url = fs.url(filename)

        peminjaman_detail = PeminjamanDetail.objects.get(id = request.POST["pinjam_id"])

        peminjaman_detail.peminjaman.pegawai_id = request.POST["pegawai_id"]
        peminjaman_detail.gedung_id = request.POST["gedung_id"]
        peminjaman_detail.ruang_id = request.POST["ruang_id"]
        peminjaman_detail.barang_id = request.POST["barang_id"]
        peminjaman_detail.jumlah = request.POST["jumlah"]
        peminjaman_detail.peminjaman.tgl_pinjam = request.POST["tgl_pinjam"]
        peminjaman_detail.peminjaman.tgl_kembali = request.POST["tgl_kembali"]
        peminjaman_detail.peminjaman.bast_disposisi = bast_disposisi_url
        peminjaman_detail.save()

        barang = Barang.objects.get(id = request.POST["barang_id"])
        barang.stock -= int(request.POST["jumlah"]) 
        barang.save()
        
        return redirect('/aplikasi_admin/peminjaman')
    pinjam = PeminjamanDetail.objects.get(id=peminjaman_id)
    pegawai = Pegawai.objects.all()
    gedung = Gedung.objects.all()
    barang = Barang.objects.all()
    context = {"pinjam":pinjam,"data_pegawai" : pegawai,"data_gedung" : gedung, "data_barang": barang}

    return render(request, 'aplikasi_admin/peminjaman_edit_form.html', context)


def get_ruang(request):
    data_from_post = json.load(request)['gedung_id']
    print(data_from_post)

    ruang =Ruang.objects.filter(gedung_id = data_from_post)    
    ruang_json = serializers.serialize('json', ruang)
    print(ruang_json)

    return HttpResponse(ruang_json, content_type='application/json')

@admin_only    
@login_required(login_url='login')
def delete_peminjaman(request, peminjaman_id):
    if request.method == "POST" :
        peminjaman_detail = PeminjamanDetail.objects.get(id=peminjaman_id)
        peminjaman_detail.delete()
        return redirect('/aplikasi_admin/peminjaman')

@admin_only
@login_required(login_url='login')
def data_pegawai(request):
    pegawai = Pegawai.objects.all()

    context = {"data_pegawai":pegawai}

    return render(request, "aplikasi_admin/data_pegawai.html", context)
@admin_only
@login_required(login_url='login')
def create_pegawai(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()

            user.refresh_from_db()
            group = Group.objects.get(name='PEGAWAI')
            user.groups.add(group) 
             # load the profile instance created by the signal
            pegawai = Pegawai(user_id = user.id, role = "PEGAWAI", nama_pegawai = request.POST["nama_pegawai"], nip_nrk = request.POST["nip_nrk"])
            pegawai.save()
            user.save()
            return redirect('/aplikasi_admin/pegawai')
    
    form = UserCreationForm()
    return render(request, 'aplikasi_admin/pegawai_form.html', {'form': form})
@admin_only
@login_required(login_url='login')
def update_pegawai(request, user_id):
    user = User.objects.get(id=user_id)

    if request.method == 'POST':
        form = UserCreationForm(request.POST, instance = user)
        if form.is_valid():
            user = form.save()
            
            user.pegawai.nama_pegawai = request.POST["nama_pegawai"]
            user.pegawai.nip_nrk = request.POST["nip_nrk"]
            user.pegawai.save()
            return redirect('/aplikasi_admin/pegawai')
    
    form = UserCreationForm(instance = user)
    return render(request, 'aplikasi_admin/pegawai_edit_form.html', {'form': form,"user":user})

@admin_only
@login_required(login_url='login')
def delete_pegawai(request, user_id):
    if request.method == "POST" :
        user = User.objects.get(id=user_id)
        user.pegawai.delete()
        user.delete()
        return redirect('/aplikasi_admin/pegawai')


def print(request):


    peminjaman=PeminjamanDetail.objects.all()
    context = {
        "data_peminjaman" : peminjaman
    }

    pdf = render_to_pdf('aplikasi_admin/templatecetakpdf.html', context)
    if pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "Laporan.pdf"
        content = "attachment; filename=%s" %(filename)
        response['Content-Disposition'] = content
        return response
    return HttpResponse("Not found")