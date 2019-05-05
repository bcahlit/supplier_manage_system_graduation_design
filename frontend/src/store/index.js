import Vue from 'vue'
import Vuex from 'vuex'

import d2admin from './modules/d2admin'

Vue.use(Vuex)
let state = {
  supplier: null
}
const mutations = {
  setSupplier (context, msg) {
    context.supplier = msg
  }
}

export default new Vuex.Store({
  modules: {
    d2admin
  },
  state,
  mutations
})
