import Vue from 'vue'
import {login} from './api/user'
import Vuex from 'vuex'

Vue.use(Vuex)

const types = {
  SET_IS_AUTNENTIATED: 'SET_IS_AUTNENTIATED', // 是否认证通过
  SET_USER: 'SET_USER' // 用户信息
}

const state = { // 需要维护的状态
  isAutnenticated: false,  // 是否认证
  user: {}   // 存储用户信息
}

const getters = {
  isAutnenticated: state => state.isAutnenticated,
  user: state => state.user
}

const mutations = {
  [types.SET_IS_AUTNENTIATED](state, isAutnenticated) {
    if (isAutnenticated)
      state.isAutnenticated = isAutnenticated
    else
      state.isAutnenticated = false
  },
  [types.SET_USER](state, user) {
    if (user)
      state.user = user
    else
      state.user = {}
  }
}

const actions = {
  setIsAutnenticated: ({ commit }, isAutnenticated) => {
    commit(types.SET_IS_AUTNENTIATED, isAutnenticated)
  },
  setUser: ({ commit }, user) => {
    commit(types.SET_USER, user)
  },
  clearCurrentState: ({ commit }) => {
    commit(types.SET_IS_AUTNENTIATED, false)
    commit(types.SET_USER, null)
  },
  ToggleSideBar: ({ commit }) => {
    commit('TOGGLE_SIDEBAR')
  },
  Login({ commit }, userInfo) {
    return new Promise((resolve, reject) => {
      console.log("++++++++++++")
      let form=new FormData;
      form.append("username",userInfo.username.trim());
      form.append("password",userInfo.password)

      login(form).then(response => {
        console.log('_____________')
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },
  // 注册
  Register({ commit }, userInfo) {
    const username = userInfo.username.trim()
    const password = userInfo.password.trim()
    var userPojo = {
      mobile: username,
      usertype: "用户",
      password: password
    }
    var jsonData = JSON.stringify(userPojo)
    return new Promise((resolve, reject) => {
      register(jsonData).then(response => {
        alert(response.data)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },

  // 获取用户信息
  GetInfo({ commit, state }) {
    return new Promise((resolve, reject) => {
      getInfo(state.token).then(response => {
        const data = response.data
        commit('SET_ROLES', data.roles)
        commit('SET_UID', data.uid)
        commit('SET_NAME', data.name)
        commit('SET_MOBILE', data.mobile)
        commit('SET_AVATAR', data.avatar)
        resolve(response)
      }).catch(error => {
        reject(error)
      })
    })
  },
}

export default new Vuex.Store({
  state,
  getters,
  mutations,
  actions
})
