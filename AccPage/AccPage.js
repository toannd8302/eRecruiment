const boxes = document.querySelectorAll('.box');

// loop through each box and attach event listeners to buttons
boxes.forEach((box) => {
  const editButton = box.querySelector('.edit-button');
  const saveButton = box.nextElementSibling;

  // when edit button is clicked, switch to edit mode
  editButton.addEventListener('click', () => {
    editButton.classList.add('active');
    box.querySelectorAll('input, textarea').forEach((element) => {
      element.removeAttribute('readonly');
    });
    saveButton.classList.remove('hidden');
  });

  // when save button is clicked, switch back to view mode and save data
  saveButton.addEventListener('click', () => {
    editButton.classList.remove('active');
    box.querySelectorAll('input, textarea').forEach((element) => {
      element.setAttribute('readonly', true);
    });
    saveButton.classList.add('hidden');
    saveData(box);
  });
});

// save data to local storage
function saveData(box) {// get all boxes
  const boxes = document.querySelectorAll('.box');

  // loop through each box and attach event listeners to buttons
  boxes.forEach((box) => {
    const editButton = box.querySelector('.edit-button');
    const saveButton = box.nextElementSibling;

    // when edit button is clicked, switch to edit mode
    editButton.addEventListener('click', () => {
      editButton.classList.add('active');
      box.querySelectorAll('input, textarea').forEach((element) => {
        element.removeAttribute('readonly');
      });
      saveButton.classList.remove('hidden');
    });

    // when save button is clicked, switch back to view mode and save data
    saveButton.addEventListener('click', () => {
      editButton.classList.remove('active');
      box.querySelectorAll('input, textarea').forEach((element) => {
        element.setAttribute('readonly', true);
      });
      saveButton.classList.add('hidden');
      saveData(box);
    });
  });

  // save data to local storage
  function saveData(box) {
    const inputs = box.querySelectorAll('input, textarea');
    const data = {};
    inputs.forEach((input) => {
      data[input.name] = input.value;
    });
    localStorage.setItem(box.id, JSON.stringify(data));
  }

  // load saved data on page load
  window.addEventListener('load', () => {
    boxes.forEach((box) => {
      const savedData = localStorage.getItem(box.id);
      if (savedData) {
        const data = JSON.parse(savedData);
        const inputs = box.querySelectorAll('input, textarea');
        inputs.forEach((input) => {
          input.value = data[input.name];
        });
      }
    });
  });
}