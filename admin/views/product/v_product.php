
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="page-title">Tables</h4>
                <div class="ml-auto text-right">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Library</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Basic Datatable</h5>
                        <div class="table-responsive">
                            <table id="zero_config" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Hình ảnh</th>
                                    <th>Số lượng</th>
                                    <th>Giá bán</th>
                                    <th>Thông tin</th>
                                    <th>Trạng thái</th>


                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                    foreach ($product as $key=>$value) {
                                        $css_trang_thai = $value->trang_thai ? "badge-info" : "badge-danger";
                                        $text_trang_thai = $value->trang_thai ? "Mở" : "Khóa";
                                 ?>
                                    <tr>
                                        <td><?php echo $key ; ?></td>
                                        <td><?php echo $value->ten_sp ; ?></td>
                                        <td> <img style="width: 150px;"  src = 'public/imageproduct/<?php echo$value->hinh_anh;?>'></td>
                                        <td><?php echo $value->so_luong ; ?></td>
                                        <td><?php echo $value->gia_ban ; ?></td>
                                        <td><?php echo $value->thong_tin_them ; ?></td>
                                        <td> <span class="badge badge-pill <?php echo $css_trang_thai;?>"><?php echo $text_trang_thai;?> </span></td>
                                        <td>
                                            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href='edit_product.php?ma_sp=<?php echo $value->ma_sp;?>'">Edit</button>
                                            <button type="button" class="btn btn-success btn-sm" onclick="window.location.href='delete_product.php?ma_sp=<?php echo $value->ma_sp;?>'">Delete</button>
                                        </td>
                                    </tr>
                                <?php } ?>
                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End PAge Content -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right sidebar -->
        <!-- ============================================================== -->
        <!-- .right-sidebar -->
        <!-- ============================================================== -->
        <!-- End Right sidebar -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <footer class="footer text-center">
        All Rights Reserved by Matrix-admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
    </footer>
    <!-- ============================================================== -->
    <!-- End footer -->
    <!-- ============================================================== -->
</div>