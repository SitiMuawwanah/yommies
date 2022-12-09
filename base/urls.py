from django.urls import path 
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.home, name="home"),
    path('login/', views.loginPage, name="login"),
    path('logout', views.logout_view, name='logout'),

    # OPERATOR ROUTE
    path('operator/dashboard', views.dashboard, name="dashboard"),
    path('operator/profil', views.profil, name="profil"),

    # Artikel Route
    path('operator/resep', views.resepIndex, name="resep"),
    path('operator/resep/tambah', views.resepTambah, name="tambah-resep"),
    path('operator/resep/hapus/<int:pk>', views.resepHapus, name="hapus-resep"),
    path('operator/resep/edit/<int:pk>', views.resepEdit, name="edit-resep"),
    path('operator/resep/detail/<int:pk>', views.resepDetail, name="detail-resep"),


    # USER ROUTE
    path('resep-masakan/kategori/<str:key>', views.resepByKategori, name="resep-by-kategori"),
    path('resep-masakan/detail-resep/<str:key>', views.detailResep, name="detail-resep-masakan"),

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)