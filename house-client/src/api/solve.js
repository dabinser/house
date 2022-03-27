import request from '@/utils/request'
const api_name = 'solve'
export default{
    getAllSolveList(pojo){
        return request({
            url:`/${api_name}`,
            method:'post',
            data:pojo
        })
    },
    getSolveListByCondition(pojo){
        return request({
            url:`/${api_name}/condition`,
            method:'post',
            data:pojo
        })
    },
    addSolve(pojo){
        return request({
            url:`/${api_name}/addsolve`,
            method:'post',
            data:pojo
        })
    },
    updateSolve(pojo){
        return request({
            url:`/${api_name}`,
            method:'patch',
            data:pojo
        })
    },
    deleteSolve(id){
        return request({
            url:`/${api_name}/`+id,
            method:'delete',
        })
    },
    
}







