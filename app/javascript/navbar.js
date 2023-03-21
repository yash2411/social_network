const profileImage = document.querySelector('.profile-image');
const dropdownMenu = document.querySelector('.dropdown-menu');
const hamBurger = document.querySelector('.ham-burger');
const dropdown = document.querySelector('.dropdown');
profileImage.addEventListener('click', function() {
  dropdownMenu.style.display = (dropdownMenu.style.display === 'block') ? 'none' : 'block';
});


hamBurger.addEventListener('click', function() {
  dropdown.style.display = (dropdown.style.display === 'block') ? 'none' : 'block';
})