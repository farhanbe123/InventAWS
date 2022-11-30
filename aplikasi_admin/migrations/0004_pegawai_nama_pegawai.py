from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplikasi_admin', '0003_pegawai_peminjaman_peminjamandetail'),
    ]

    operations = [
        migrations.AddField(
            model_name='pegawai',
            name='nama_pegawai',
            field=models.CharField(max_length=200, null=True),
        ),
    ]
