<!DOCTYPE html>
<html lang="tr">

<?php $this->load->view("includes/header");?>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="<?php echo base_url("assets/")?>dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <?php $this->load->view("includes/navbar");?>

  <?php $this->load->view("includes/sidebar");?>

  <?php $this->load->view("{$viewFolder}/{$subViewFolder}/content");?>

  <?php $this->load->view("includes/footer");?>