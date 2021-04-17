const selectContent = function () {
    const selections = {
        titleInput: document.querySelector('#note_book_title'),
        sideBarHeader: document.querySelector('.sb-sidenav-menu-heading'),
    }
    return selections;
};
const addListeners = function ({ titleInput, sideBarHeader }) {

 console.log(titleInput);

 titleInput.addEventListener('input', ({ target: { value }}) => {
    console.log(value);
    sideBarHeader.textContent = value;
 });
};

const addListenersAndSyncTitle = () => {
    const documentQueries = selectContent();
    const { titleInput, sideBarHeader } = documentQueries;
    sideBarHeader.textContent = titleInput.value;
    addListeners(documentQueries);

};


document.addEventListener("turbolinks:load", addListenersAndSyncTitle());

// if (!Turbolinks) {
//     location.reload();
// }

// Turbolinks.dispatch("turbolinks:load");