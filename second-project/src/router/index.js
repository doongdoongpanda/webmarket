import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue' //HomeView 는 일종의 변수 선언
//import ResultView from '../views/ResultView.vue' //HomeView 는 일종의 변수 선언

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },


  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/result',
    name: 'result',
    component: () => import(/* webpackChunkName: "about" */ '../views/ResultView.vue')
  }

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
