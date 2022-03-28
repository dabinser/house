import request from '@/utils/request'
const api_name = 'schedule'
export default{
    getAllScheduleList(pojo){
        return request({
            url:`/${api_name}`,
            method:'post',
            data:pojo
        })
    },
    getScheduleListByCondition(pojo){
        return request({
            url:`/${api_name}/getschedulelistbycondition`,
            method:'post',
            data:pojo
        })
    },
    addSchedule(pojo){
        return request({
            url:`/${api_name}/addschedule`,
            method:'post',
            data:pojo
        })
    },
    updateSchedule(pojo){
        return request({
            url:`/${api_name}`,
            method:'patch',
            data:pojo
        })
    },
    deleteSchedule(id){
        return request({
            url:`/${api_name}/`+id,
            method:'delete',
        })
    },
    getScheduleInSevenDays(){
        return request({
            url:`/${api_name}/getscheduleinsevendays`,
            method:'get'
        })
    }
}







