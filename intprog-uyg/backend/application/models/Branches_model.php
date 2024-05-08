
<?php
class Branches_model extends CI_Model
{
    
    public function __construct()
    {
        parent::__construct();
    }

    /* Tabloya veri ekleyen fonksiyon */
    public function add($data = array())
    {
        return $this->db->insert("branches", $data);
    }
  
    /*tek kaydı getirecek*/
    public function get($where=array())
    {
        return $this->db->where($where)->get("branches")->row();
    }

    /* Tablodaki tüm kayıtları çeken fonksiyon */

    public function getAll($order = "id ASC")
    {
        return $this->db->order_by($order)->get("branches")->result();
    }

    public function delete($where=array())
    {
        return $this->db->where($where)->delete("branches");
    }
    
    public function update($where=array(),$data=array())
    {
       return $this->db->where($where)->update("branches", $data);
    }
}

?>
