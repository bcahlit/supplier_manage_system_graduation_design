// 菜单 侧边栏
export default [
  { path: '/index', title: '首页', icon: 'home' },
  {
    title: '演示页面',
    icon: 'folder-o',
    children: [
      { path: '/demo/page1', title: '页面 1' },
      { path: '/demo/page2', title: '页面 2' },
      { path: '/demo/page3', title: '页面 3' }
    ]
  },
  {
    title: '办公',
    icon: 'briefcase',
    children: [
      { path: '/office/note', title: '便签', icon: 'sticky-note-o' },
      { path: '/office/schedule', title: '日程安排', icon: 'calendar' }
    ]
  },
  {
    title: '销售管理',
    icon: 'area-chart',
    children: [
      { path: '/sales_manage/customer', title: '客户管理', icon: 'user-o' },
      { path: '/sales_manage/points', title: '积分管理', icon: 'gg-circle' },
      { path: '/sales_manage/order', title: '订单管理', icon: 'first-order' }
    ]
  },
  {
    title: '销售支持',
    icon: 'file-text',
    children: [
      { path: '/sale_supports/product', title: '产品管理', icon: 'product-hunt' },
      { path: '/sale_supports/work_report', title: '工作报告', icon: 'reply' },
      { path: '/sale_supports/message', title: '消息管理', icon: 'comments' }
    ]
  }
]
