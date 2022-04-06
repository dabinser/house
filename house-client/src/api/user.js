import request from '@/utils/request'
const api_name = 'User/user'
export default{
    login(pojo){
        return request({
            url:`/login`,
            method:'post',
            data:pojo
        })
    },
    getAllUserList(pojo){
        return request({
            url:`/${api_name}/condition`,
            method:'post',
            data:pojo
        })
    },
    getUserListByCondition(pojo){
        return request({
            url:`/${api_name}/condition`,
            method:'post',
            data:pojo
        })
    },
    getUserInfoByCondition(){
        return request({
            url:`/${api_name}/detail`,
            method:'get',
        })
    },
    addUser(pojo){
        return request({
            url:`/${api_name}/addition`,
            method:'post',
            data:pojo
        })
    },
    updateUser(pojo){
        return request({
            url:`/${api_name}/updateuser`,
            method:'post',
            data:pojo
        })
    },
    deleteUser(id){
        return request({
            url:`/${api_name}/deleteuser?userListid=`+id,
            method:'delete',
        })
    },
    editPassword(pojo){
        return request({
            url:`/${api_name}/modify`,
            method:'post',
            data:pojo
        })
    },


}







