<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

   

	public function index()
	{
        
		$this->load->model('Product_category_model');
		$items = $this->Product_category_model->getAll();

		//print_r($items);

		$viewData = new stdClass();
        
		$viewData->items = $items;
		$this->load->view("welcome_message", $viewData);
	}
}
