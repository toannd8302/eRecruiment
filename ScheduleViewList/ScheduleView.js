const listViewBtn = document.getElementById('list-view');
const gridViewBtn = document.getElementById('grid-view');
const interviewList = document.querySelector('.interview-list');
const interviewGrid = document.querySelector('.interview-grid');

listViewBtn.addEventListener('click', function() {
  interviewList.style.display = 'block';
  interviewGrid.style.display = 'none';
  listViewBtn.classList.add('active');
  gridViewBtn.classList.remove('active');
});

gridViewBtn.addEventListener('click', function() {
  interviewGrid.style.display = 'grid';
  interviewList.style.display = 'none';
  gridViewBtn.classList.add('active');
  listViewBtn.classList.remove('active');
});
