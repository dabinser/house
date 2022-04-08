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
import ChatOnline from "./views/ChatOnline";
import index1 from "./views/view/index.vue";
import cheader from "./components/cheader";
import newheader from "./components/newheader";
import cfooter from "./components/cfooter";
import oldHouse from "./views/view/oldHouse/index"
import info from "./views/view/oldHouse/info";
import rentHouse from "./views/view/rentHouse/index"
import publish from "./views/view/publish/index"
import rentInfo from "./views/view/rentHouse/info"
import tool from "./views/view/tool/index"
import centHouse from "./views/view/center/house"
import housePrice from "./views/view/housePrice/index"
import Center from "./views/view/center/index"
import houseInfo from "./views/view/info/info"

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
      name: 'index',
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
          path: '/chatOnline',
          name: 'chat',
          component:ChatOnline
        },
      ]
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
    },{
      path: '/client',
      name: 'client',
      component: index1
    },{
      path: '/logon',
      name: 'logon',
      component: ()=>import('./views/view/login/index')
    },
    //导航头部
    {
      path: '/cheader',
      name: 'cheader',
      component: cheader,
      hidden: true
    },
    //导航头部
    {
      path: '/newheader',
      name: 'newheader',
      component: ()=>import('./components/newheader'),
      hidden: true
    },
    //版权尾部
    {
      path: '/cfooter',
      name: 'cfooter',
      component: ()=>import('./components/cfooter'),
      hidden: true
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
      path: '/oldHouse/:content?',
      name: 'index',
      component: oldHouse,
      hidden: true
    },
    {
      path: '/info/:id',
      name: 'info',
      component: info,
      hidden: true
    },
    //-------------------------------------------
    //租房
    {
      path: '/rentHouse/:content?',
      name: 'index',
      component: rentHouse,
      hidden: true
    },
    {
      path: '/rentHouse/info/:id',
      name: 'info',
      component: rentInfo,
      hidden: true
    },

    //-------------------------------------------
    //新房

    //-------------------------------------------
    //工具
    {
      path: '/tool',
      name: 'index',
      component: tool,
      hidden: true
    },

    //-------------------------------------------
    //经纪人
    {
      path: '/agent/',
      name: 'index',
      component: ()=>import('./views/view/agent/index'),
      hidden: true
    },

    //-------------------------------------------

    //-------------------------------------------
    //房价
    {
      path: '/housePrice/',
      name: 'index',
      component: housePrice,
      hidden: true
    },
    //-------------------------------------------
    //个人中心
    {
      path: '/center/',
      name: 'index',
      component: ()=>import('./views/view/center/index'),
      hidden: true
    },
    {
      path: '/center',
      name: 'index',
      component: Center,
      children: [
        { path: 'house', name: 'house', component: centHouse}
      ]
    },
    {
      path: 'info',
      name:"info",
      component:houseInfo
    }

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
