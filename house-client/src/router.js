import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/index.vue'
import NotFound from './views/404.vue'
import Login from './views/Login.vue'
import { getUser } from './utils/auth';
import Home from './views/Home.vue'
import UserList from './views/UserList.vue'
import HouseList from './views/HouseList.vue'
import PaidList from './views/PaidList.vue'
import SolveList from './views/SolveList.vue'
import ScheduleList from './views/ScheduleList.vue'
import PersonalPaidList from './views/PersonalPaidList.vue'
import PersonalHouseList from './views/PersonalHouseList.vue'
import PersonalScheduleList from './views/PersonalScheduleList.vue'
import PersonalSolveList from './views/PersonalSolveList.vue'
import ChatOnline from "./views/Examine";
import cheader from "./components/cheader";
import cfooter from "./components/cfooter";
import info from "./views/view/house/info";
import publish from "./views/view/publish/index"
import Center from "./views/view/center/index"
import agent from "./views/view/agent/index"
import house from "./views/view/house/index"
import chat from "./views/view/login/index1"
import Verify from "./views/Verify";
import Contract from "./views/Contract";
import Examine from "./views/Examine";




Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      redirect: '/index',
    },
    {
      path: '/index',
      component: Index,
      children:[
        {
          path:'',
          component: Home
        },
        {
          path:'/home',
          name: 'home',
          component: Home
        },
        {
          path:'/userlist',
          name: 'userlist',
          component: UserList
        },
        {
          path:'/houselist',
          name: 'houselist',
          component: HouseList
        },
        {
          path:'/paidlist',
          name: 'paidlist',
          component: PaidList
        },
        {
          path:'/solvelist',
          name: 'solvelist',
          component: SolveList
        },
        {
          path:'/schedulelist',
          name: 'schedulelist',
          component: ScheduleList
        },
        {
          path:'/personalPaidList',
          name: 'personalPaidList',
          component: PersonalPaidList
        },
        {
          path:'/personalHouseList',
          name: 'personalHouseList',
          component: PersonalHouseList
        },
        {
          path:'/personalScheduleList',
          name: 'personalScheduleList',
          component: PersonalScheduleList
        },
        {
          path:'/personalSolveList',
          name: 'personalSolveList',
          component: PersonalSolveList
        },{
          path: '/examine',
          name: 'examine',
          component: Examine
        },
        {
          path: '/verify',
          name: 'verify',
          component: Verify
        },
        {
          path: '/contract',
          name: 'contract',
          component: Contract
        }
      ]
    },
    {
      path: '/cheader',
      name: 'cheader',
      component: cheader,
      hidden: true
    },
    //版权尾部
    {
      path: '/cfooter',
      name: 'cfooter',
      component: ()=>import('./components/cfooter'),
      hidden: true
    },
    {
      path: '*',
      name: '/404',
      component:NotFound
    },
    {
      path: '/login',
      name: 'login',
      component:Login
    },
      ///
    {
      path: '/rent',
      name: 'rent',
      component: house
    },

    {
      path: '/logon',
      name: 'logon',
      component: ()=>import('./views/view/login/index')
    },

    //-------------------------------------------
    //发布房源
    {
      path: '/publish',
      name: 'index',
      component: publish,
      hidden: true
    },



    //-------------------------------------------
    //二手房
    {
      path: '/info/:id',
      name: 'info',
      component: info,

    },
    //-------------------------------------------
    //经纪人
    {
      path:'/agent',
      name: 'agent',
      component:agent
    },
    //-------------------------------------------f
    //个人中心
    {
      path: '/center',
      name: 'index1',
      component: Center,

    },




    {
      path:'/chat',
      name:'cc',
      component: chat
    },


  ]
});

//路由守卫
router.beforeEach((to,from,next) => {
  const isLogin = getUser().token ? true : false;
  if (to.path=="/home"){
    next("/home")
  }
  if(to.path == "/login" || to.path == "reguster"){
    next();
  }else{
    isLogin ? next() : next('login');
  }
})

export default router;
