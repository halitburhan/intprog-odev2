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
                <h3 class="card-title">Kullanıcı İşlemleri</h3></div>
                
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
              <form class="form-horizontal" method="POST" action="<?php echo base_url("User_Controller/save")?>">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="email" class="col-sm-2 col-form-label">Kullanıcı Maili:</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="email" name="email" placeholder="mailini gir">
                    </div>
                  </div>

                <?php if(isset($formError)) { ?>
                    <small><?php echo form_error("email");?></small>
                  <?php } ?>

                </div>

                <div class="card-body">
                  <div class="form-group row">
                    <label for="name" class="col-sm-2 col-form-label">Kullanıcı Adı:</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="name" name="name" placeholder="adını gir">
                    </div>
                  </div>

                <?php if(isset($formError)) { ?>
                    <small><?php echo form_error("name");?></small>
                  <?php } ?>

                </div>

                <div class="card-body">
                  <div class="form-group row">
                    <label for="surname" class="col-sm-2 col-form-label">Kullanıcı Soyadı:</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="surname" name="surname" placeholder="soyadını gir">
                    </div>
                  </div>

                <?php if(isset($formError)) { ?>
                    <small><?php echo form_error("surname");?></small>
                  <?php } ?>

                </div>

                <div class="card-body">
                  <div class="form-group row">
                    <label for="password" class="col-sm-2 col-form-label">Şifre:</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="password" name="password" placeholder="şifre gir">
                    </div>
                  </div>

                <?php if(isset($formError)) { ?>
                    <small><?php echo form_error("password");?></small>
                  <?php } ?>

                </div>

                <div class="card-body">
                  <div class="form-group row">
                    <label for="re-password" class="col-sm-2 col-form-label">Şifre Tekrarı:</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="re-password" name="re-password" placeholder="şifre tekrar gir">
                    </div>
                  </div>

                <?php if(isset($formError)) { ?>
                    <small><?php echo form_error("re-password");?></small>
                  <?php } ?>

                </div>

                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-info">Kaydet</button>
                  <a href="<?php echo base_url("User_Controller"); ?>" class="btn btn-default float_right">iptal</a>
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