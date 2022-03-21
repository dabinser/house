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
    getAllUserList(){
        return request({
            url:`/${api_name}/getalluserlist`,
            method:'get'
        })
    },
    getUserListByCondition(pojo){
        return request({
            url:`/${api_name}/getuserlistbycondition`,
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
            url:`/${api_name}/adduser`,
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







