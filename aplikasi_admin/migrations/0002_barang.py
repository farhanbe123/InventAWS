from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplikasi_admin', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Barang',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('kode_barang', models.CharField(max_length=200)),
                ('nama_barang', models.CharField(max_length=100)),
                ('merk', models.CharField(max_length=200)),
                ('stock', models.IntegerField(default=0)),
                ('bast_perolehan', models.ImageField(upload_to='aplikasi_admin/bast_perolehan/')),
            ],
        ),
    ]
