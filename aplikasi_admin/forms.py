from django import forms
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class GedungForm(forms.ModelForm):
    class Meta:
        model = Gedung
        fields = '__all__'

        widgets = {
            'gedung': forms.TextInput(attrs={'class': 'form-control'}),
            'mg_gedung':forms.TextInput(attrs={'class':'form-control'})
        }

class RuangForm(forms.ModelForm):
    class Meta:
        model = Ruang
        fields = '__all__'

        widgets = {
            'ruang': forms.TextInput(attrs={'class': 'form-control'}),
            'pj_ruang':forms.TextInput(attrs={'class':'form-control'})
        }

class BarangForm(forms.ModelForm):
    class Meta:
        model = Barang
        fields = '__all__'

        widgets = {
            'kode_barang': forms.TextInput(attrs={'class': 'form-control'}),
            'nama_barang':forms.TextInput(attrs={'class':'form-control'}),
            'bast_perolehan':forms.FileInput(attrs={'class':'form-control'}),
            'merk':forms.TextInput(attrs={'class':'form-control'}),
            'stock':forms.TextInput(attrs={'class':'form-control'}),
        }


