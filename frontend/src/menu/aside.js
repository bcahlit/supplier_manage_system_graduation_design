// 菜单 侧边栏
export default [
  { path: '/index', title: '首页', icon: 'home' },
  {
    title: '办公',
    icon: 'briefcase',
    children: [
      { path: '/office/note', title: '便签', icon: 'sticky-note-o' },
      { path: '/office/schedule', title: '日程安排', icon: 'calendar' }
    ]
  },
  {
    title: '管理员',
    icon: 'adn',
    children: [
      { path: '/admin/user', title: '用户管理', icon: 'user-circle' }
    ]
  },
  {
    title: '数据统计',
    icon: 'area-chart',
    children: [
      { path: '/data_analysis/ssupplier', title: '供应商统计', icon: 'bar-chart' }
    ]
  },
  {
    title: '供应商管理',
    icon: 'user-o',
    children: [
      { path: '/supplier/dossier', title: '档案管理', icon: 'file-text' },
      { path: '/supplier/order', title: '订单管理', icon: 'first-order' },
      { path: '/supplier/product_manage', title: '产品管理', icon: 'product-hunt' }
      // { path: '/supplier/quality_evaluation', title: '质量管理', icon: 'gg-circle' }
    ]
  },
  {
    title: '采购管理',
    icon: 'plus',
    children: [
      { path: '/puches/application', title: '申请', icon: 'level-up' },
      { path: '/puches/ratify', title: '审批', icon: 'paint-brush' },
      { path: '/puches/product', title: '产品库管理', icon: 'product-hunt' },
      { path: '/puches/arival', title: '到货情况', icon: 'bar-chart' },
      { path: '/puches/evaluation', title: '评价', icon: 'share' }
    ]
  }
]
