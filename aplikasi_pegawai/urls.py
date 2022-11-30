from django.urls import path 

from . import views 

urlpatterns = [
    path('', views.dashboard, name="pegawai_dashboard"),
    path('getruang/',views.get_ruang,name="pegawai_get_ruang"),

    path('barang',views.data_barang, name="pegawai_data_barang"),

    path('update_barang/<int:id_barang>',views.update_barang, name="pegawai_update_barang"),

    path('create_peminjaman', views.create_peminjaman, name="pegawai_create_peminjaman"),

    path('printlaporan', views.print, name="pegawai_printlaporan"),
    
]
