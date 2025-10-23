document.addEventListener('DOMContentLoaded', () => {
    // Highlight active navigation link
    const currentPage = window.location.pathname.split('/').pop() || 'index.html';
    const navLinks = document.querySelectorAll('nav ul li a');

    navLinks.forEach(link => {
        if (link.getAttribute('href') === currentPage || (currentPage === 'index.html' && link.getAttribute('href') === '#')) {
            link.classList.add('nav-active');
        }
    });

    // Dashboard widgets responsiveness (example)
    const widgets = document.querySelectorAll('.widget');
    widgets.forEach(widget => {
        widget.addEventListener('click', () => {
            alert(`You clicked on the ${widget.querySelector('h3').textContent} widget.`);
        });
    });
});
