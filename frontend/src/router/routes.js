import layoutHeaderAside from '@/layout/header-aside'

/**
 * 在主框架内显示
 */
const frameIn = [
  {
    path: '/',
    redirect: { name: 'index' },
    component: layoutHeaderAside,
    children: [
      // 首页 必须 name:index
      {
        path: 'index',
        name: 'index',
        meta: {
          auth: true
        },
        component: () => import('@/pages/index')
      },
      // 刷新页面 必须保留
      {
        path: 'refresh',
        name: 'refresh',
        hidden: true,
        component: {
          beforeRouteEnter (to, from, next) {
            next(vm => vm.$router.replace(from.fullPath))
          },
          render: h => h()
        }
      },
      // 页面重定向 必须保留
      {
        path: 'redirect/:route*',
        name: 'redirect',
        hidden: true,
        component: {
          beforeRouteEnter (to, from, next) {
            next(vm => vm.$router.replace(JSON.parse(from.params.route)))
          },
          render: h => h()
        }
      }
    ]
  },
  {
    path: '/office',
    name: 'office',
    auth: true,
    redirect: { name: 'schedule' },
    component: layoutHeaderAside,
    children: [
      { path: 'schedule', name: `schedule`, component: () => import('@/pages/offices/schedules'), meta: { auth: true, title: '日程表' } },
      { path: 'note', name: 'note', component: () => import('@/pages/note'), meta: { auth: true, title: '便笺' } }
      // { path: 'page2', name: `${pre}page2`, component: () => import('@/pages/demo/page2'), meta: { ...meta, title: '页面 2' } },
      // { path: 'page3', name: `${pre}page3`, component: () => import('@/pages/demo/page3'), meta: { ...meta, title: '页面 3' } }
    ]
  },
  {
    path: '/sales_manage',
    name: 'sales_manage',
    auth: true,
    redirect: { name: 'supplier' },
    component: layoutHeaderAside,
    children: [
      { path: 'sales', name: `sales`, component: () => import('@/pages/sales-manage/sales'), meta: { auth: true, title: '销售' } },
      { path: 'supplier', name: `supplier`, component: () => import('@/pages/sales-manage/supplier'), meta: { auth: true, title: '供应商管理' } },
      { path: 'points', name: `points`, component: () => import('@/pages/sales-manage/points'), meta: { auth: true, title: '积分管理' } },
      { path: 'order', name: 'order', component: () => import('@/pages/sales-manage/order'), meta: { auth: true, title: '订单管理' } }
    ]
  },
  {
    path: '/sale_supports',
    name: 'sale_supports',
    auth: true,
    redirect: { name: 'product' },
    component: layoutHeaderAside,
    children: [
      // { path: 'product', name: `product`, component: () => import('@/pages/sale_supports/product'), meta: { auth: true, title: '产品管理' } },
      { path: 'work_report', name: `work_report`, component: () => import('@/pages/sale_supports/work_report'), meta: { auth: true, title: '积分管理' } },
      { path: 'message', name: 'message', component: () => import('@/pages/sale_supports/message'), meta: { auth: true, title: '订单管理' } }
    ]
  },
  {
    path: '/admin',
    name: 'admin',
    auth: true,
    redirect: { name: 'user' },
    component: layoutHeaderAside,
    children: [
      { path: 'user', name: `user`, component: () => import('@/pages/admin/user'), meta: { auth: true, title: '用户管理' } }
    ]
  },
  {
    path: '/data_analysis',
    name: 'data_analysis',
    auth: true,
    redirect: { name: 'ssupplier' },
    component: layoutHeaderAside,
    children: [
      { path: 'ssupplier', name: `ssupplier`, component: () => import('@/pages/data_analysis/supplier'), meta: { auth: true, title: '供应商统计' } }
    ]
  },
  {
    path: '/supplier',
    name: 'supplier',
    auth: true,
    redirect: { name: 'dossier' },
    component: layoutHeaderAside,
    children: [
      { path: 'dossier', name: `dossier`, component: () => import('@/pages/supplier/dossier'), meta: { auth: true, title: '档案管理' } },
      { path: 'order', name: `order`, component: () => import('@/pages/supplier/order'), meta: { auth: true, title: '订单管理' } },
      { path: 'product_manage', name: `product_manage`, component: () => import('@/pages/supplier/product_manage'), meta: { auth: true, title: '产品管理' } },
      { path: 'quality_evaluation', name: `quality_evaluation`, component: () => import('@/pages/supplier/quality_evaluation'), meta: { auth: true, title: '质量管理' } }
    ]
  },
  {
    path: '/puches',
    name: 'puches',
    auth: true,
    redirect: { name: 'application' },
    component: layoutHeaderAside,
    children: [
      { path: 'application', name: `application`, component: () => import('@/pages/puches/application'), meta: { auth: true, title: '申请' } },
      { path: 'ratify', name: `ratify`, component: () => import('@/pages/puches/ratify'), meta: { auth: true, title: '审批' } },
      { path: 'product', name: `product`, component: () => import('@/pages/puches/product'), meta: { auth: true, title: '产品库管理' } },
      { path: 'arival', name: `arival`, component: () => import('@/pages/puches/arival'), meta: { auth: true, title: '到货情况' } },
      { path: 'evaluation', name: `evaluation`, component: () => import('@/pages/puches/evaluation'), meta: { auth: true, title: '评价' } }
    ]
  }
]

/**
 * 在主框架之外显示
 */
const frameOut = [
  // 登录
  {
    path: '/login',
    name: 'login',
    component: () => import('@/pages/login')
  }
]

/**
 * 错误页面
 */
const errorPage = [
  // 404
  {
    path: '*',
    name: '404',
    component: () => import('@/pages/error-page-404')
  }
]

// 导出需要显示菜单的
export const frameInRoutes = frameIn

// 重新组织后导出
export default [
  ...frameIn,
  ...frameOut,
  ...errorPage
]
