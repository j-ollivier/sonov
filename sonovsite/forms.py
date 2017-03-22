from django import forms

class SearchAll(forms.Form):
    search = forms.CharField(label='')
