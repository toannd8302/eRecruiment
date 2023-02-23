expandBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        // Get the row that contains the clicked button
        const row = btn.parentNode.parentNode;

        // Check if the row is already expanded
        const isExpanded = row.nextElementSibling && row.nextElementSibling.classList.contains("expandable-row");

        // Toggle the visibility of the expandable row
        if (isExpanded) {
            row.nextElementSibling.remove();
        } else {
            // Create a new row to hold the expanded content
            const expandableRow = document.createElement("tr");
            expandableRow.classList.add("expandable-row");

            // Create a new table cell to hold the expanded content
            const cell = document.createElement("td");
            cell.setAttribute("colspan", "5");

            // Create the expanded content
            const content = `
<h4>Details for ${row.cells[0].textContent}</h4>
<p>Age: ${row.cells[1].textContent}</p>
<p>Job Title: ${row.cells[2].textContent}</p>
`;

            // Set the innerHTML of the cell to the expanded content
            cell.innerHTML = content;

            // Append the cell to the expandable row
            expandableRow.appendChild(cell);

            // Insert the expandable row below the clicked row
            table.tBodies[0].insertBefore(expandableRow, row.nextSibling);
        }
    });
});