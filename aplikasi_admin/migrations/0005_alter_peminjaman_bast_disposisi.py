from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplikasi_admin', '0004_pegawai_nama_pegawai'),
    ]

    operations = [
        migrations.AlterField(
            model_name='peminjaman',
            name='bast_disposisi',
            field=models.FileField(upload_to=''),
        ),
    ]
