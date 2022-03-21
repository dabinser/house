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
            url:`/${api_name}/addhouse`,
            method:'post',
            data:pojo
        })
    },
    updateHouse(pojo){
        return request({
            url:`/${api_name}/updatehouse`,
            method:'post',
            data:pojo
        })
    },
    deleteHouse(id){
        return request({
            url:`/${api_name}/deletehouse?houseId=`+id,
            method:'delete',
        })
    },

}







