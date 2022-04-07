<?php
include "models/m_checkout.php";
@session_start();
class c_checkout {

    public function c_checkout() {
        $ma_kh = $_SESSION['id_user'];
        $m_checkout = new m_checkout();
        $check_out = $m_checkout->select_infomation_user($ma_kh);


        $view = "views/checkout/v_checkout.php";
        include_once ("templates/layout.php");
    }

    public function add_order() {

        if(isset($_POST['btn_order'])) {
            $ma_dh = NULL;
            $ma_kh = $_SESSION['id_user'];
            $tong_tien = $_SESSION['tong'];
            $phuong_thuc_thanh_toan = $_POST['radio-group'];
            $ngay_thanh_toan = date("Y-m-d");
            $trang_thai = 1;

            $m_order = new m_checkout();
            $last_id = $m_order->insert_order($ma_dh, $ma_kh, $tong_tien, $phuong_thuc_thanh_toan,$ngay_thanh_toan,$trang_thai);


            if($last_id) {
//            lấy thông tin chi tiết đơn hàng đẩy lên databases
                foreach ($_SESSION['cart'] as $key => $value) :

                    $ma_sp = $value['id'];
                    $so_luong = $value['so_luong'];

                    $m_order_details = new m_checkout();
                    $details = $m_order_details->insert_order_details($last_id, $ma_sp, $so_luong);

                endforeach;
            }
            echo "<script>window.location.href='order_history.php'</script>";
//            echo "<script>alert('Mua hàng thành công')</script>";
        }
    }
}
?>