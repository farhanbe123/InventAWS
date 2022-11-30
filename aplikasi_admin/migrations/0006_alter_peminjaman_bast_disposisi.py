from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('aplikasi_admin', '0005_alter_peminjaman_bast_disposisi'),
    ]

    operations = [
        migrations.AlterField(
            model_name='peminjaman',
            name='bast_disposisi',
            field=models.CharField(max_length=200),
        ),
    ]
