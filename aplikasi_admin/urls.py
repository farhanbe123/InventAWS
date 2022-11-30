from django.urls import path 

from . import views 

urlpatterns = [
    path('', views.dashboard, name="admin_dashboard"),
    path('gedung',views.data_gedung, name="data_gedung"),
    path('create_gedung', views.create_gedung, name="create_gedung"),
    path('update_gedung/<int:id_gedung>',views.update_gedung, name="update_gedung"),
    path('delete_gedung/<int:id_gedung>',views.delete_gedung, name="delete_gedung"),
    path('ruang',views.data_ruang, name="data_ruang"),
    path('create_ruang', views.create_ruang, name="create_ruang"),
    path('update_ruang/<int:id_ruang>',views.update_ruang, name="update_ruang"),
    path('delete_ruang/<int:id_ruang>',views.delete_ruang, name="delete_ruang"),

    path('getruang/',views.get_ruang,name="get_ruang"),

    path('barang',views.data_barang, name="data_barang"),
    path('create_barang', views.create_barang, name="create_barang"),
    path('update_barang/<int:id_barang>',views.update_barang, name="update_barang"),
    path('delete_barang/<int:id_barang>',views.delete_barang, name="delete_barang"),

    path('peminjaman', views.data_peminjaman, name="data_peminjaman"),
    path('create_peminjaman', views.create_peminjaman, name="create_peminjaman"),
    path('update_peminjaman/<int:peminjaman_id>', views.update_peminjaman, name="update_peminjaman"),
    path('delete_peminjaman/<int:peminjaman_id>', views.delete_peminjaman, name="delete_peminjaman"),

    path('pegawai', views.data_pegawai, name="data_pegawai"),
    path('create_pegawai', views.create_pegawai, name ="create_pegawai"),
    path('update_pegawai/<int:user_id>', views.update_pegawai, name ="update_pegawai"),
    path('delete_pegawai/<int:user_id>', views.delete_pegawai, name="delete_pegawai"),

    path('printlaporan', views.print, name="printlaporan")
]
