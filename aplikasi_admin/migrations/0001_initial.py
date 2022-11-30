from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Gedung',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gedung', models.CharField(max_length=200)),
                ('mg_gedung', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Ruang',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ruang', models.CharField(max_length=200)),
                ('pj_ruang', models.CharField(max_length=200)),
                ('gedung', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='aplikasi_admin.gedung')),
            ],
        ),
    ]
