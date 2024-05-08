 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Kategori Ürün İşlemleri</h1>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            
            <!-- /.card -->

            <div class="card">
              <div class="card-header">
                <div class="row">

                <div class="col-md-6">
                <h3 class="card-title">Ürün Kategori İşlemleri</h3></div>
                
                <div class="col-md-6 text-right">
                <a href="<?php echo base_url("Product_category/new_form")?>" class="btn btn-success btn-xs mb-2"><i class="fas fa-plus"></i> Yeni Kategori Ekle</a></div>
                
                </div>
              </div>

              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Id</th>
                    <th>Kategori Adı</th>
                    <th>Durumu</th>
                    <th>Oluşturma Tarihi</th>
                    <th>İşlemler</th>
                  </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($items as $item) { ?>
                  <tr>
                    <td><?php echo $item->id; ?></td>
                    <td><?php echo $item->title; ?></td>
                    <td><?php echo $item->is_active == 1 ? "Aktif" : "Pasif"; ?></td>

                    <td><?php echo dateTimeFormat($item->created_at); ?></td>

                    <td><a href="<?php echo base_url("Product_Category/delete/$item->id")?>"class="btn btn-danger" >Sil</a>
                       <a href="<?php echo base_url("Product_Category/update_form/$item->id")?>"class="btn btn-info" >Güncelle</a>
                    </td>
                  
                  </tr>
             <?php   } ?>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>