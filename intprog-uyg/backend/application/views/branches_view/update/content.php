 <!-- Content Wrapper. Contains page content -->
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
           
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
                <h3 class="card-title">Şube Güncelleme İşlemleri</h3></div>
                
                </div>
              </div>

              <!-- /.card-header -->
              <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Ekleme</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form class="form-horizontal" method="POST" action="<?php echo base_url("Branches_Controller/update/$item->id")?>">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="category" class="col-sm-2 col-form-label"> Şube Adı</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="title" name="title" value="<?php echo isset($formError) ? set_value("title") : $item->title; ?>" placeholder="şube adı gir">
                    </div>
                  </div>
                  <div class="card-body">
                  <div class="form-group row">
                    <label for="category" class="col-sm-2 col-form-label"> Adres</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="adress" name="adress" value="<?php echo isset($formError) ? set_value("adress") : $item->title; ?>" placeholder="adresi gir">
                    </div>
                  </div>

                <?php if(isset($formError)) { ?>
                    <small><?php echo form_error("title");?></small>
                  <?php } ?>
                  <?php if(isset($formError)) { ?>
                    <small><?php echo form_error("adress");?></small>
                  <?php } ?>

                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-info">Kaydet</button>
                  <a href="<?php echo base_url("Branches_Controller"); ?>" class="btn btn-default float_right">iptal</a>
                </div>
                <!-- /.card-footer -->
              </form>
            </div>
            <!-- /.card -->

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