<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Branches_Controller extends CI_Controller {

	public $viewFolder = "";

    public function __construct()
    {
        parent ::__construct();
		$this->load->model('Branches_model');
        $this->viewFolder="branches_view";
    }

	public function index()
	{
		$items = $this->Branches_model->getAll();

		$viewData = new stdClass();
		$viewData->viewFolder = $this->viewFolder;
        $viewData->subViewFolder = "list";
		$viewData->items = $items;
		$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
	}
 
	public function new_form()
	{
		$viewData = new stdClass();
        $viewData->viewFolder = $this->viewFolder;
        $viewData->subViewFolder = "add";
		$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);
	}

	public function save()
	{
        $this->load->library("form_validation"); //sınıfın yüklenmesi

		$this->form_validation->set_rules("title", "şube adı", "required|trim" ); //kuralların yazılması
		$this->form_validation->set_rules("adress", "şube adresi", "required|trim" ); 

		$this->form_validation->set_message(
			array(
			"required" => "<b>{field}</b> alanı doldurulmalıdır."
			)
		);

		$validate = $this->form_validation->run();

		if($validate)
        {
			//echo "validasyon başarılı, kayıt devam eder.";

			$data=array(
				"title"=>$this->input->post("title")
			);
			$insert=$this->Branches_model->add($data);

			if($insert){
				redirect(base_url("Branches_Controller"));
			} else {
				echo "kayıt ekleme sırasında bir hata oluştu";
			}

		} 
		else 
        {
	    //echo "validasyon başarısız, kayıt ekleme işlemine geri döner.";
		$viewData = new stdClass();
        $viewData->viewFolder = $this->viewFolder;
        $viewData->subViewFolder = "add";
		$viewData->formError = true;
		$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);

		}
	}

	public function update_form($id)
	{
		$item = $this->Branches_model->get(
			array(
				"id" => $id
			)
			);

			$viewData = new stdClass();
			$viewData->item = $item;
			$viewData->subViewFolder = "update";
			$viewData->viewFolder = $this->viewFolder;
			$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);	
	}

	public function update($id)
	{
        $this->load->library("form_validation"); //sınıfın yüklenmesi

		$this->form_validation->set_rules("title", "şube adı", "required|trim" ); //kuralların yazılması
		$this->form_validation->set_rules("adress", "şube adresi", "required|trim" ); 

		$this->form_validation->set_message(
			array(
			"required" => "<b>{field}</b> alanı doldurulmalıdır."
			)
		);

		$validate = $this->form_validation->run();

        if($validate){
			//echo "validasyon başarılı, kayıt devam eder.";

			$data=array(
				"title"=>$this->input->post("title")
			);

		$update = $this->Branches_model->update(
		
			array(
				"id" => $id
			),
			$data
		);	
		
		if ($update)
		{
			redirect(base_url("Branches_Controller"));
		} else {
			echo "update başarısız";
		}

	} else {
		$item = $this->Brand_model->get(
			array(
				"id" => $id
			)
			);

			$viewData = new stdClass();
			$viewData->item = $item;
			$viewData->subViewFolder = "update";
			$viewData->viewFolder = $this->viewFolder;
			$viewData->formError = true;
			$this->load->view("{$viewData->viewFolder}/{$viewData->subViewFolder}/index", $viewData);	
	}
    }
	public function delete($id)
	{
		$data = array(
			"id" => $id 
		);
		
	   $this->Branches_model->delete($data);
		
		// alert sistemi eklenecek
		redirect(base_url("Branches_Controller"));
	}

}
