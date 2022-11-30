from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Gedung (models.Model):
    gedung = models.CharField(max_length = 200)
    mg_gedung = models.CharField(max_length = 200)
   
    def __str__(self):
        return self.gedung

class Ruang (models.Model):
    gedung = models.ForeignKey(Gedung, null=True, on_delete= models.SET_NULL)
    ruang = models.CharField(max_length = 200)
    pj_ruang =  models.CharField(max_length = 200)

    def __str__ (self):
        return self.ruang

class Barang(models.Model):
    kode_barang = models.CharField(max_length=200)
    nama_barang = models.CharField(max_length=100)
    merk = models.CharField(max_length = 200)
    stock = models.IntegerField(default = 0)
    bast_perolehan = models.ImageField(upload_to='aplikasi_admin/bast_perolehan/')
    
    def __str__(self):
        return self.nama_barang
        
    def delete(self, *args, **kwargs):
        self.bast_perolehan.delete()
        super().delete(*args, **kwargs)

class Pegawai(models.Model):
    user = models.OneToOneField(User, null = True, on_delete = models.SET_NULL)
    nip_nrk = models.CharField(max_length=200)
    alamat = models.CharField(max_length=200)
    telp = models.CharField(max_length = 200)
    role = models.CharField(max_length = 200)
    nama_pegawai = models.CharField(max_length = 200, null = True)

    def __str__(self):
        return self.nama_pegawai

  
class Peminjaman(models.Model):
    KONDISI = (
        ('Kurang Baik', 'Kurang Baik'),
        ('Baik', 'Baik'),
        ('Sangat Baik', 'Sangat Baik')
    )
    no_peminjaman = models.CharField(max_length = 100)
    pegawai = models.ForeignKey(Pegawai, null = True, on_delete= models.SET_NULL)
    tgl_pinjam = models.DateField()
    tgl_kembali = models.DateField(null = True)
    bast_disposisi = models.CharField(max_length=200)

    def __str__(self):
        return self.no_peminjaman

    def delete(self, *args, **kwargs):
        self.bast_disposisi.delete()
        super().delete(*args, **kwargs)


class PeminjamanDetail(models.Model):
    peminjaman = models.OneToOneField(Peminjaman, null = True, on_delete = models.SET_NULL)
    barang = models.ForeignKey(Barang , null = True, on_delete = models.SET_NULL)
    jumlah = models.IntegerField(default = 0)
    gedung = models.ForeignKey(Gedung , null = True , on_delete = models.SET_NULL)
    ruang = models.ForeignKey(Ruang , null = True, on_delete = models.SET_NULL)

    def __str__(self):
        return self.peminjaman.no_peminjaman + "-" + self.gedung.gedung