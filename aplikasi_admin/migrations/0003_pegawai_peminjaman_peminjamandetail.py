from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('aplikasi_admin', '0002_barang'),
    ]

    operations = [
        migrations.CreateModel(
            name='Pegawai',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nip_nrk', models.CharField(max_length=200)),
                ('alamat', models.CharField(max_length=200)),
                ('telp', models.CharField(max_length=200)),
                ('role', models.CharField(max_length=200)),
                ('user', models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Peminjaman',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('no_peminjaman', models.CharField(max_length=100)),
                ('tgl_pinjam', models.DateField()),
                ('tgl_kembali', models.DateField(null=True)),
                ('bast_disposisi', models.CharField(choices=[('Kurang Baik', 'Kurang Baik'), ('Baik', 'Baik'), ('Sangat Baik', 'Sangat Baik')], max_length=200)),
                ('pegawai', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='aplikasi_admin.pegawai')),
            ],
        ),
        migrations.CreateModel(
            name='PeminjamanDetail',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('jumlah', models.IntegerField(default=0)),
                ('barang', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='aplikasi_admin.barang')),
                ('gedung', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='aplikasi_admin.gedung')),
                ('peminjaman', models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, to='aplikasi_admin.peminjaman')),
                ('ruang', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='aplikasi_admin.ruang')),
            ],
        ),
    ]
