from django.contrib import admin
from .models import *
# Register your models here.


admin.site.register(Gedung)
admin.site.register(Ruang)
admin.site.register(Barang)
admin.site.register(Peminjaman)
admin.site.register(PeminjamanDetail)
admin.site.register(Pegawai)