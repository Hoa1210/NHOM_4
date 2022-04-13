<div class="page-title-area">
    <div class="container">
        <div class="page-title-content">
            <h1>Cart</h1>
            <ul>
                <li><a href="index.php">Home</a></li>
                <li>Cart</li>
            </ul>
        </div>
    </div>
</div>


<div class="cart-area ptb-100">
    <div class="container">
        <form action="" method="POST">
            <div class="cart-table table-responsive">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">STT</th>
                        <th scope="col">Product</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php
//                    kiểm tra mảnh $_SESSION['cart'] có tồn tại không
                    if(isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
//                        echo "<script> alert('no');</script> ";
//                        echo "<pre />";
//                        var_dump($_SESSION['cart']);
                        $dem = 1;
                        $tongtien = 0;
                        foreach ($_SESSION['cart'] as $key=>$value) :
                            $thanhtien = $value['so_luong'] * $value['gia_ban'];
                            $tongtien += $thanhtien;
                            ?>
                            <tr>
                                <td><input type="button"  value="Xóa" style="color: red; border: none; background-color: #fff;" onclick="window.location.href='cart.php?key=<?php echo $value['id']; ?>'"></td>
                                <td><?php echo $dem; ?>
                                <td class="product-thumbnail">
                                    <a href="products-details.php">
                                        <img src="admin/public/imageproduct/<?php echo $value['hinh_sp']; ?>" alt="item">
                                        <h3><?php echo $value['ten_sp']; ?></h3>
                                    </a>
                                </td>
                                <td> <?php echo number_format($value['gia_ban']); ?> VNĐ</td>
                                <td class="product-quantity">
                                    <div class="input-counter">
                                        <span class="minus-btn"><i class='bx bx-minus'></i></span>
                                        <input type="text" name="so_luong[<?php echo $value['id']?>]"   value="<?php echo $value['so_luong'];?>" min="1" max="<?php echo $value['sl_max'];?>" >
                                        <span class="plus-btn"><i class='bx bx-plus'></i></span>
                                    </div>
                                </td>
                                <td><?php echo number_format($thanhtien);?> VNĐ</td>
                            </tr>
                        <?php   $dem++; endforeach;
                    }else {
                        $tongtien = 0;
                        ?>
                        <td colspan="6"> <b> Không có sản phẩm nào trong giỏ hàng</b></td>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
            <?php if(isset($_SESSION['cart']) && !empty($_SESSION['cart'])) { ?>
            <div class="cart-buttons">
                <div class="row align-items-center">
                    <div class="col-lg-7 col-sm-12 col-md-7">
                        <div class="shopping-coupon-code">
                            <input type="text" class="form-control" placeholder="Coupon code" name="coupon-code" id="coupon-code">
                            <button type="submit">Apply Coupon</button>
                        </div>
                    </div>
                    <div class="col-lg-5 col-sm-12 col-md-5 text-end">
                        <!--                        <a href="" class="default-btn"><span>Update Cart</span></a>-->
                        <input type="submit" class="default-btn"  name="btn_delete"   value="Delete all cart">

                        <input type="submit" class="default-btn"  name="btn_update"  value="Update">
                    </div>
                </div>
            </div>
            <div class="cart-totals">
                <ul>
                    <li>Ship <span>0 VNĐ</span></li>
<!--                    if(isset($_SESSION['tong'])) {echo number_format($_SESSION['tong']);} else {echo "0";}-->
                    <li>Total <span><?php echo number_format($tongtien); ?> VNĐ</span></li>
                </ul>
                <input type="button" name="btn_checkout" onclick="location.href='check_out.php'"  class="default-btn" value="Proceed to Checkout">
            </div>
            <?php }else{ echo " "; } ?>
        </form>
    </div>
</div>
