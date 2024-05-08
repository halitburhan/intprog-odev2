<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_Controller extends CI_Controller {

    public $viewFolder = "";

    public function __construct()
    {
        parent ::__construct();
		$this->load->model('User_model');
        $this->viewFolder="user_view";
    }

	public function index()
	{
        $items = $this->User_model->getAll();

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
        

    $this->form_validation->set_rules('email', 'Email', 'required|valid_email|is_unique[users.email]' ); //kuralların yazılması
    $this->form_validation->set_rules("name", "Kullanıcı adı", "required|trim" ); //kuralların yazılması
    $this->form_validation->set_rules("surname", "Kullanıcı soyadı", "required|trim" ); //kuralların yazılması
      
    $this->form_validation->set_rules("password", "Şifre", "required|trim" ); //kuralların yazılması
    $this->form_validation->set_rules("re-password", "Şifre Tekrarı", "required|trim|matches[password]" ); //kuralların yazılması
       

    $this->form_validation->set_message(
        array(
        "required" => "<b>{field}</b> alanı doldurulmalıdır.",
        "valid_email" => "<b>{field}</b> geçerli bir eposta adresi değildir.",
        "is_unique" => "<b>{field}</b> daha önce sistemde kayıtlıdır.",
        "matches" => "Şifreler birbiri ile uyuşmuyor.."
        )
    );

    $validate = $this->form_validation->run();

    if($validate)
    {
        //echo "validasyon başarılı, kayıt devam eder.";

        $data=array(
            "email"=>$this->input->post("email"),
            "name"=>$this->input->post("name"),
            "surname"=>$this->input->post("surname"),
            "password"=>md5($this->input->post("password")),
            "is_Active"  => 1

        );
        $insert=$this->User_model->add($data);

        if($insert){
            redirect(base_url("User_Controller"));
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
		$item = $this->User_model->get(
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
    $this->load->library("form_validation"); //sınıfın yüklenmes

    $item = $this->User_model->get(array("id" => $id));

    if (!$item) {
        // Kullanıcı bulunamadıysa, hata ver veya yönlendirme yap
    }

    // Eğer form submit edilmişse
    if ($this->input->post()) {
        // Mevcut e-posta adresini al
        $current_email = $item->email;

        // Yeni e-posta adresi
        $new_email = $this->input->post('email');

        // Eğer e-posta adresi değiştirilmediyse, e-posta adresi validasyonunu atla
        if ($new_email == $current_email) {
            $this->form_validation->set_rules('email', 'Email', 'trim');
            // E-posta adresini güncelleme verisinden kaldır
            unset($_POST['email']);
        } else {
            // Eğer e-posta adresi değiştirildiyse, validasyonu uygula
            $this->form_validation->set_rules('email', 'Email', 'required|valid_email|is_unique[users.email]');
        }

        // Diğer validasyon kurallarını ekle...
        $this->form_validation->set_rules("name", "Kullanıcı Adı", "required|trim");
        $this->form_validation->set_rules("surname", "Kullanıcı soyadı", "required|trim");
        $this->form_validation->set_rules("password", "Şifre", "required|trim");
        $this->form_validation->set_rules("re-password", "Şifre Tekrarı", "required|trim|matches[password]");
    }

    $this->form_validation->set_message(
        array(
            "required" => "<b>{field}</b> alanı doldurulmalıdır.",
            "valid_email" => "<b>{field}</b> geçerli bir eposta adresi değildir.",
            "is_unique" => "<b>{field}</b> daha önce sistemde kayıtlıdır.",
            "matches" => "Şifreler birbiri ile uyuşmuyor.."
        )
    );

    $validate = $this->form_validation->run();

    if ($validate) {
        //echo "validasyon başarılı, kayıt devam eder.";

        $data = array(
            "name" => $this->input->post("name"),
            "surname" => $this->input->post("surname"),
            "password" =>md5($this->input->post("password")),
            "is_active" => 1
        );

        // Yeni e-posta adresi varsa, güncelleme verisine ekle
        if ($this->input->post('email')) {
            $data["email"] = $this->input->post("email");
        }

        $update = $this->User_model->update(
            array("id" => $id),
            $data
        );

        if ($update) {
            redirect(base_url("User_Controller"));
        } else {
            echo "update başarısız";
        }
    } else {
        // Validasyon başarısız ise
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
		
	   $this->User_model->delete($data);
		
		// alert sistemi eklenecek
		redirect(base_url("User_Controller"));
	}

}