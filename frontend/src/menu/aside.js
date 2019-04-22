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
  }
]
