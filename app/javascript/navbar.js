const profileImage = document.querySelector('.profile-image');
const dropdownMenu = document.querySelector('.dropdown-menu');
profileImage.addEventListener('click', function() {
  dropdownMenu.style.display = (dropdownMenu.style.display === 'block') ? 'none' : 'block';
});