<div class="row">
    <div class="col-sm-12">
        <div class="card card-info">
             <div class="card-header">
                

                <div class="card-tools">
                  <a href="#"  class="btn btn-tool" >
                   <i class="fas fa-user-plus mr-2"></i> Add new agent
                  </a>
                    |
                   <a href="#"  class="btn btn-tool" >
                   <i class="fas fa-file-upload mr-2 ml-2" ></i> Import From File
                  </a>
                </div>
              </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 20px">CID</th>
                            <th style="width: 40px">ID</th>
                            <th style="width: 200px">Name</th>
                            <th style="width: 15px">Left Nodes</th>
                            <th style="width: 15px">Right Nodes</th>
                            <th style="width: 30px">Last Update</th>
                            <th style="width: 40px">-</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        for ($i = 1; $i <= 100; $i++) {
                            ?>
                            <tr>
                                <td><?php echo $i; ?></td>
                                <td><?php echo getrandomstring(4); ?></td>
                                <td><?php echo getrandomstring(8); ?></td>
                                <td><?php echo rand(0, 12); ?></td>
                                <td><?php echo rand(0, 12); ?></td>
                                <td><?php echo date("Y-m-d H:i:s"); ?></td>
                                <td>
                                    <a class="btn btn-sm" title="Edit">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a class="btn btn-sm" title="Tree View">
                                        <i class="fas fa-project-diagram"></i>
                                    </a>
                                    <a class="btn btn-sm" title="Ino">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>CID</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Left Nodes</th>
                            <th>Right Nodes</th>
                            <th>Last Update</th>
                            <th>-</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>