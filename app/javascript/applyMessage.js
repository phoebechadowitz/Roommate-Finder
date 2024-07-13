document.addEventListener('DOMContentLoaded', function () {
    console.log("Custom JavaScript loaded after DOM content is fully loaded!");
    const applyButton = document.getElementById("apply-button")
    const backButton = document.getElementById("back-button")
    applyButton.addEventListener('click', function() {
        openMessagePopup()
    })
    backButton.addEventListener('click', function () {
        closeMessagePopup()
    })
});

function openMessagePopup() {
    messageBox = document.getElementById("message-popup")
    messageBox.classList.remove("hidden")
}
function closeMessagePopup() {
    messageBox = document.getElementById("message-popup")
    messageBox.classList.add("hidden")
}