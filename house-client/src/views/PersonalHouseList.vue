<template>
    <div class="fillcontain">
        <div>
            <el-form :inline="true" ref="add_data" :model="search_data">
                <el-form-item label="地址：">
                    <el-input v-model="search_data.search_address"></el-input>
                </el-form-item>
                <el-form-item label="状态：">
                    <el-select v-model.trim="search_data.search_status">
                        <el-option v-for="(formteam,index) in format_status_list" :key="index" :label="formteam" :value="formteam"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item class="btnSearch">
                    <el-button type="primary " size="small" icon="el-icon-search" @click="handleSearch()">筛选</el-button>
                </el-form-item>
            </el-form>
        </div>
        <div class="table_container">
            <el-table :data="tableData" style="width: 100%" max-height="450" border >
                <el-table-column type="index" label="序号" align="center" width="100">
                </el-table-column>
                <el-table-column prop="area" label="地址" align="center" width="400">
                </el-table-column>
                <el-table-column prop="mode" label="方式" align="center" width="200">
                </el-table-column>
                <el-table-column prop="pay" label="价格" align="center" width="300">
                </el-table-column>
                <el-table-column prop="is_rent" label="状态" align="center" width="100">
                </el-table-column>
                <el-table-column label="操作" prop="operation" align="center"  >
                    <template slot-scope="scope">
                        <el-button
                        size="small"
                        type="primary"
                        icon="el-icon-search"
                        @click="handleView(scope.$index, scope.row)">查看详情</el-button>
                    </template>
                </el-table-column>
            </el-table>
            <!--分页-->
             <el-row>
                <el-col :span="24">
                    <div class="pagination">
                        <el-pagination
                            v-if='paginations.total > 0'
                            :page-sizes="paginations.page_sizes"
                            :page-size="paginations.page_size"
                            :layout="paginations.layout"
                            :total="paginations.total"
                            :current-page.sync='paginations.page_index'
                            @current-change='handleCurrentChange'
                            @size-change='handleSizeChange'>
                        </el-pagination>
                    </div>
                </el-col>
            </el-row>

        </div>
        <HouseViewDialog :dialog3="dialog3" @update="getProfile" :formData="Data"></HouseViewDialog>
    </div>

</template>

<script>
import houseApi from '../api/house.js'
import HouseViewDialog from '../components/HouseViewDialog'
export default {
    name:"personalhouseList",
    components: {
        HouseViewDialog
    },
    data () {
        return {
            //筛选条件数据
            search_data:{
                search_address:'',
                search_status:''
            },
            //需要给分页组件传的信息
            paginations: {
                page_index: 1, // 当前位于哪页
                total: 0, // 总数
                page_size: 5, // 1页显示多少条
                page_sizes: [5, 10, 15, 20], //每页显示多少条
                layout: "total, sizes, prev, pager, next, jumper" // 翻页属性
            },
            Data:{
                detail:''
            },
            dialog3:{
               show:false,
               title:""
            },
            tableData:[],
            allTableData: [],
            format_status_list:[
                "全部","未出租","已出租"
            ],

        };
    },
    created () {
        this.getProfile();
    },
    methods: {
        getProfile(){
            this.search_data.search_status = "全部"
           /* let basePage=basePage
          {
                  current: this.paginations.page_index,
                  size: this.paginations.page_size

            }*/
            let basePage={
              current: this.paginations.page_index,
              size: this.paginations.page_size
            }
            houseApi.getAllHouseList(basePage).then(res =>{
                if(res.data.code == '0'){
                    this.allTableData = res.data.data;
                    // 设置分页数据
                    this.setPaginations();
                }else{
                    this.$message({
                    message: '获取房屋信息列表失败',
                    type: 'warning'
                    });
                }
            })
        },
        handleView(index,row){
            this.Data=''
            this.Data={
                detail:row.content
            };
            console.log(row),
            this.dialog3={
                show:true,
                title:"房屋详情"
            };
        },
        handleSearch(){
            let pojo;
            let page={
              current: this.paginations.page_index,
              size: this.paginations.page_size
            }
            if(this.search_data.search_status == "全部"){
                pojo = {
                address:this.search_data.search_address,
                status:''
                }
            }else{
                pojo = {
                condition: {
                  address:this.search_data.search_address,
                  is_rent:this.search_data.search_status,
                  mode:'合租'
                },
                  basepage:page

                }
            }



          houseApi.getHouseListByCondition(pojo).then(res =>{
                if(res.data.code == '0'){
                    this.$message({
                    message: '筛选成功',
                    type: 'success'
                    });
                    this.allTableData = res.data.data;
                    // 设置分页数据
                    this.setPaginations();
                }else{
                    this.$message({
                    message: '按条件获取房屋信息列表失败',
                    type: 'warning'
                    });
                }
            })
        },
        handleCurrentChange(page) {
            // 当前页
            this.getProfile();
            /*let sortnum = this.paginations.page_size * (page - 1);
            let table = this.allTableData.records.filter((item, index) => {
                return index >= sortnum;
            });
            // 设置默认分页数据
            this.tableData = table.filter((item, index) => {
                return index < this.paginations.page_size;
            });
*/
        },
        handleSizeChange(page_size) {
            // 切换size
            this.paginations.page_index = 1;
            this.paginations.page_size = page_size;
            this.getProfile();
         },
        setPaginations() {
            // 总页数
            this.paginations.total = this.allTableData.total;
            this.paginations.page_index=this.allTableData.current;

            // 设置默认分页数据
            this.tableData = this.allTableData.records;

        }
    }
}
</script>


<style scoed>
.fillcontain {
  width: 100%;
  height: 100%;
  padding: 16px;
  box-sizing: border-box;
}
.btnRight {
  float: right;
}
.pagination {
  text-align: center;
  margin-top: 10px;
  margin: 10px auto 0 auto;
}
</style>

