const listViewBtn = document.getElementById('list-view');
const gridViewBtn = document.getElementById('grid-view');
const interviewList = document.querySelector('.interview-list');
const interviewGrid = document.querySelector('.interview-grid');

// Hide gridview initially
interviewGrid.style.display = 'none';

// Event listener for listview button
listViewBtn.addEventListener('click', function() {
  // Show listview, hide gridview
  interviewList.style.display = 'block';
  interviewGrid.style.display = 'none';
})

// Event listener for gridview button
gridViewBtn.addEventListener('click', function() {
  // Show gridview, hide listview
  interviewGrid.style.display = 'grid';
  interviewList.style.display = 'none';
})