import request from '@/utils/request'
const api_name = 'paid'
export default{
    getAllPaidList(){
        return request({
            url:`/${api_name}`,
            method:'get'
        })
    },
    getPaidListByCondition(pojo){
        return request({
            url:`/${api_name}`,
            method:'post',
            data:pojo
        })
    },
    addPaid(pojo){
        return request({
            url:`/${api_name}/add`,
            method:'post',
            data:pojo
        })
    },
    updatePaid(pojo){
        return request({
            url:`/${api_name}/updatepaid`,
            method:'post',
            data:pojo
        })
    },
    deletePaid(id){
        return request({
            url:`/${api_name}/deletepaid?paidId=`+id,
            method:'delete',
        })
    },
    findById(id){
        return request({
            url:`/${api_name}/`+id,
            method:'get',
        })
    }

}







