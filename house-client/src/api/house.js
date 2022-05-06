import request from '@/utils/request'
const api_name = 'te/rent'
export default{
    getAllHouseList(pojo){
        return request({
            url:`/${api_name}/page`,
            method:'post',
            data: pojo,

        })
    },
    getHouseListByCondition(serchDto){
        return request({
            url:`/${api_name}/ConditionQuery`,
            method:'post',
            data:serchDto

        })
    },
    addHouse(pojo){
        return request({
            url:`/${api_name}/addHouse`,
            method:'post',
            data:pojo
        })
    },
    updateHouse(pojo){
        return request({
            url:`/${api_name}`,
            method:'post',
            data:pojo
        })
    },
    deleteHouse(id){
        return request({
            url:`/${api_name}/`+id,
            method:'delete',
        })
    },
    getCollection(id){
        return request({
            url:`/collection/`+id,
            method:'get'
        })

    },
    getExamine(pojo){
        return request({
            url:`/${api_name}/getExamine`,
            method:'post',
            data:pojo
        })
    },
    changeState(id, state) {
        return request({
            url:`/${api_name}/changeState/`+id/+state,
            method:'post',
        })
    }

}







