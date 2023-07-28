const navItems = document.querySelector('.nav_items');
const navOpenBtn = document.querySelector('#open_nav-btn');
const navCloseBtn = document.querySelector('#close_nav-btn');

const openNav = () => {
	navItems.style.display = 'flex';
	navOpenBtn.style.display = "none";
	navCloseBtn.style.display = "inline-block";
}
navOpenBtn.addEventListener('click', openNav);

const closeNav = () => {
	navItems.style.display = "none";
	navOpenBtn.style.display = "inline-block";
	navCloseBtn.style.display = "none";
}
navCloseBtn.addEventListener('click', closeNav);

const sidebar = document.querySelector('#aside');
const showSidebarBtn= document.querySelector('#show_sidebar-btn');
const hideSidebarBtn = document.querySelector('#hide_sidebar-btn');

const showSidebar = () =>{
	sidebar.style.left='0';
	showSidebarBtn.style.display='none';
	hideSidebarBtn.style.display='inline-block';
}

const hideSidebar = () => {
	sidebar.style.left='-100%';
	showSidebarBtn.style.display='inline-block';
	hideSidebarBtn.style.display='none';
}

showSidebarBtn.addEventListener('click', showSidebar);
hideSidebarBtn.addEventListener('click', hideSidebar);


