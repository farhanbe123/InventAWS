from django.shortcuts import render, redirect
from django.core import serializers
# Create your views here.
from django.contrib.auth.models import Group , User
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from aplikasi_admin.models import *
from aplikasi_admin.forms import *

import random
import datetime
import json

from aplikasi_login.decorators import *

from io import BytesIO
from django.template.loader import get_template

from xhtml2pdf import pisa



@login_required(login_url='login')
def dashboard(request):

    return render(request, 'aplikasi_pegawai/dashboard.html')


@login_required(login_url='login')
def data_barang(request):
    barang = Barang.objects.all()

    context = {"data_barang":barang}

    return render(request, 'aplikasi_pegawai/data_barang.html', context)



@login_required(login_url='login')
def update_barang(request, id_barang):
    barang = Barang.objects.get(id = id_barang)
    form = BarangForm(instance=barang)

    if request.method == "POST" :
        form = BarangForm(request.POST, request.FILES, instance=barang)
        if form.is_valid():
            form.save()
            return redirect('/pegawai/barang')

    context = {"form":form}
    return render(request, 'aplikasi_pegawai/barang_form.html',context)





@login_required(login_url='login')
def create_peminjaman(request):

    if request.method == "POST" :
        date_today = datetime.datetime.now()
        adder = date_today.strftime("%d%m%Y")
        no_peminjaman = adder + str(random.randint(100,999))
        barang_id = request.POST['barang_id']
        pegawai_id = request.user.pegawai.id
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

        return redirect('/pegawai')

    gedung = Gedung.objects.all()
    barang = Barang.objects.all()
    context = {"data_gedung" : gedung, "data_barang": barang}
    return render(request, 'aplikasi_pegawai/peminjaman_form.html', context)

def get_ruang(request):
    data_from_post = json.load(request)['gedung_id']
    print(data_from_post)

    ruang =Ruang.objects.filter(gedung_id = data_from_post)    
    ruang_json = serializers.serialize('json', ruang)
    print(ruang_json)

    return HttpResponse(ruang_json, content_type='application/json')



def print(request):
    peminjaman = PeminjamanDetail.objects.all()
    context = {
        "data_peminjaman" : peminjaman
    }

    pdf = render_to_pdf('aplikasi_pegawai/templatecetakpdf.html', context)
    if pdf:
        response = HttpResponse(pdf, content_type='application/pdf')
        filename = "Laporan.pdf"
        content = "attachment; filename=%s" %(filename)
        response['Content-Disposition'] = content
        return response
    return HttpResponse("Not found")


    
def render_to_pdf(template_src, context_dict={}):
    template = get_template(template_src)
    html  = template.render(context_dict)
    result = BytesIO()
    pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
    if not pdf.err:
        return HttpResponse(result.getvalue(), content_type='application/pdf')
    return None